package com.nt.entity;

import java.util.Date;

public class UserProfile {
    private int id;
    private int userId;
    private String fullName;
    private String email;
    private String mobile;
    private String address;
    private String city;
    private String state;

    private String bankName;
    private String accountNo;

    private String aadharNo;
    private String panNo;

    private Date dob;
    private String gender;
    private String maritalStatus;

    private String altMobile;
    private String emergencyPerson;
    private String emergencyNumber;
    
    public UserProfile() {};
    
    
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getFullName() {
		return fullName;
	}


	public void setFullName(String fullName) {
		this.fullName = fullName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getBankName() {
		return bankName;
	}


	public void setBankName(String bankName) {
		this.bankName = bankName;
	}


	public String getAccountNo() {
		return accountNo;
	}


	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}


	public String getAadharNo() {
		return aadharNo;
	}


	public void setAadharNo(String aadharNo) {
		this.aadharNo = aadharNo;
	}


	public String getPanNo() {
		return panNo;
	}


	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}


	public Date getDob() {
		return dob;
	}


	public void setDob(Date dob) {
		this.dob = dob;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getMaritalStatus() {
		return maritalStatus;
	}


	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}


	public String getAltMobile() {
		return altMobile;
	}


	public void setAltMobile(String altMobile) {
		this.altMobile = altMobile;
	}


	public String getEmergencyPerson() {
		return emergencyPerson;
	}


	public void setEmergencyPerson(String emergencyPerson) {
		this.emergencyPerson = emergencyPerson;
	}


	public String getEmergencyNumber() {
		return emergencyNumber;
	}


	public void setEmergencyNumber(String emergencyNumber) {
		this.emergencyNumber = emergencyNumber;
	}


	public UserProfile(int id, int userId, String fullName, String email, String mobile, String address, String city,
			String state, String bankName, String accountNo, String aadharNo, String panNo, Date dob, String gender,
			String maritalStatus, String altMobile, String emergencyPerson, String emergencyNumber) {
		super();
		this.id = id;
		this.userId = userId;
		this.fullName = fullName;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
		this.city = city;
		this.state = state;
		this.bankName = bankName;
		this.accountNo = accountNo;
		this.aadharNo = aadharNo;
		this.panNo = panNo;
		this.dob = dob;
		this.gender = gender;
		this.maritalStatus = maritalStatus;
		this.altMobile = altMobile;
		this.emergencyPerson = emergencyPerson;
		this.emergencyNumber = emergencyNumber;
	}

    
}
