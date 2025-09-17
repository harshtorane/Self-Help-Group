package com.nt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String showLoginPage() {
        return "login";
    }
    
    @GetMapping("/signup")
    public String showSignupForm() {
        return "signup"; // signup.jsp render होईल
    }

}
