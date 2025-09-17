package com.nt.controller;

import com.nt.entity.User;
import com.nt.entity.Info;
import com.nt.service.SHGService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class SHGController {

    @Autowired
    private SHGService shgService;

    // ---------------- LOGIN ----------------
    @PostMapping("/login")
    public String doLogin(@RequestParam String userName,
                          @RequestParam String pwd,
                          HttpSession session,
                          Model model) {

        User user = shgService.login(userName, pwd);

        if (user != null) {
            session.setAttribute("loggedInUser", user);

            int membercount = shgService.membercount();
            int totalsaving = shgService.totalsaving();
            int totalfine = shgService.totalFine();
            int totaltotal = shgService.totaltotal();

            model.addAttribute("username", user.getUname());
            model.addAttribute("role", user.getRole());
            model.addAttribute("photoPath", user.getPhotoPath());
            model.addAttribute("totalMembers", membercount);
            model.addAttribute("totalSaving", totalsaving);
            model.addAttribute("totalFine", totalfine);
            model.addAttribute("totalTotal", totaltotal);
            model.addAttribute("topSavers", shgService.getTopSavers());

            return "dashboard";
        } else {
            model.addAttribute("error", "Invalid Username or Password");
            return "login";
        }
    }

    // ---------------- VIEW DATA ----------------
    @GetMapping("/viewData")
    public String getAllData(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) return "redirect:/login";

        List<Info> memberData = shgService.getMemberInfo(loggedInUser);

        model.addAttribute("username", loggedInUser.getUname());
        model.addAttribute("role", loggedInUser.getRole());
        model.addAttribute("photoPath", loggedInUser.getPhotoPath());
        model.addAttribute("memberList", memberData);

        return "viewData";
    }

    // ---------------- UPDATE ----------------
    @PostMapping("/updateInfo")
    public String updateInfo(@ModelAttribute Info info) {
        shgService.updateInfo(info);
        return "redirect:/viewData";
    }

    // ---------------- DELETE ----------------
    @GetMapping("/deleteInfo/{id}")
    public String deleteInfo(@PathVariable int id) {
        shgService.deleteInfo(id);
        return "redirect:/viewData";
    }

    // ---------------- ADD NEW MEMBER ----------------
    @PostMapping("/addMember")
    public String addMember(@ModelAttribute Info info,
                            HttpSession session,
                            Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) return "redirect:/login";

        if (!"ADMIN".equalsIgnoreCase(loggedInUser.getRole())) {
            model.addAttribute("errMsg", "Access Denied! Only Admin can add members.");
            return "viewData";
        }

        shgService.addMember(info);
        return "redirect:/viewData";
    }

    // ---------------- PROFILE ----------------
    @GetMapping("/viewProfileForm")
    public String showViewProfileForm(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) return "redirect:/login";

        List<Info> members;

        if ("ADMIN".equalsIgnoreCase(loggedInUser.getRole())) {
            // Admin साठी सगळे members fetch करा
            members = shgService.getAllMembers();
        } else {
            // Normal user साठी फक्त स्वतःचा member fetch करा
            members = shgService.getMemberInfo(loggedInUser);
        }

        model.addAttribute("members", members);
        return "viewprofile";
    }


    @PostMapping("/viewProfile")
    public String viewProfile(@RequestParam("id") int id, Model model) {
        Info member = shgService.getMemberById(id);
        model.addAttribute("member", member);
        return "profile";
    }

    // ---------------- LOGOUT ----------------
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    // ---------------- DASHBOARD ----------------
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) return "redirect:/login";

        int membercount = shgService.membercount();
        int totalsaving = shgService.totalsaving();
        int totalfine = shgService.totalFine();
        int totaltotal = shgService.totaltotal();

        model.addAttribute("username", loggedInUser.getUname());
        model.addAttribute("role", loggedInUser.getRole());
        model.addAttribute("photoPath", loggedInUser.getPhotoPath());
        model.addAttribute("totalMembers", membercount);
        model.addAttribute("totalSaving", totalsaving);
        model.addAttribute("totalFine", totalfine);
        model.addAttribute("totalTotal", totaltotal);
        model.addAttribute("topSavers", shgService.getTopSavers());

        return "dashboard";
    }
 // ---------------- SHOW REGISTER FORM ----------------
    @GetMapping("/register")
    public String showRegisterForm(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) return "redirect:/login";

        if (!"ADMIN".equalsIgnoreCase(loggedInUser.getRole())) {
            model.addAttribute("errMsg", "Access Denied! Only Admin can add members.");
            return "dashboard";
        }

        return "register"; // register.jsp render होईल
    }

    
 // SHOW LOAN FORM
    @GetMapping("/loanForm")
    public String showLoanForm(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"ADMIN".equalsIgnoreCase(loggedInUser.getRole())) {
            return "redirect:/dashboard";
        }
        model.addAttribute("members", shgService.getAllMembers());
        return "loanForm";
    }

    // ISSUE LOAN
    @PostMapping("/issueLoan")
    public String issueLoan(@RequestParam int memberId,
                            @RequestParam double amount,
                            @RequestParam double rate,
                            @RequestParam int tenure) {
        shgService.issueLoan(memberId, amount, rate, tenure);
        return "redirect:/viewLoans";
    }

    // VIEW LOANS
    @GetMapping("/viewLoans")
    public String viewLoans(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) return "redirect:/login";

        model.addAttribute("loans", shgService.getActiveLoans());
        return "viewLoans";
    }

}
