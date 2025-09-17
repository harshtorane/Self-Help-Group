package com.nt.service;

import com.nt.dao.SHGDao;

import com.nt.entity.Info;
import com.nt.entity.User;
import com.nt.entity.UserProfile;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;
import java.util.Map;

@Service
public class SHGService {

    @Autowired
    private SHGDao dao;

  

    public User login(String username, String password) {
        return dao.getUserByUsernameAndPassword(username, password);
    }

    public List<Info> getMemberInfo(User user) {
    	 if("ADMIN".equalsIgnoreCase(user.getRole())) {
    	        return dao.getAllInfo();
    	    } else {
    	        return dao.getInfoByUsername(user.getUname());
    	    }
    }

    public void updateInfo(Info info) {
        dao.updateInfo(info);
    }

    public void deleteInfo(int id) {
        dao.deleteInfo(id);
    }

    public void addMember(Info info) {
        int monthly = Integer.parseInt(info.getMonthly_saving());
        int loan = (info.getLoan_installment() == null) ? 0 : Integer.parseInt(info.getLoan_installment());
        int fine = (info.getFine() == null) ? 0 : Integer.parseInt(info.getFine());

        int total = monthly + loan + fine;
        info.setTotal(String.valueOf(total));

        dao.saveMember(info);
    }

    public List<Info> getAllMembers() {
        return dao.getAllMembers();
    }

    public Info getMemberById(int id) {
        return dao.getMemberById(id);
    }

    public int membercount() {
    	 
    int count =	dao.membercount();
    
	return count;
    	
    	
    	
    }

	public int registerUser(User user) {
		 return dao.registerUser(user);
	}

	public int totalsaving() {
		return dao.totalsaving();

	}
	
	

	public int totalFine() {
	    return dao.totalFine();
	}
	
	public int totaltotal() {
	    return dao.totaltotal();
	}

	public List<Info> getTopSavers() {
	    return dao.getTopSavers();
	}


	public int signupStep1(User user) {  // returns new userId
	    return dao.insertUserAndReturnId(user);
	}
	
	public void issueLoan(int memberId, double amount, double rate, int tenure) {
	    dao.issueLoan(memberId, amount, rate, tenure);
	}

	public List<Map<String,Object>> getActiveLoans() {
	    return dao.getActiveLoans();
	}


  

 
}
