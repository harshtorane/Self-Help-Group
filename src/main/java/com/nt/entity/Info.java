package com.nt.entity;

public class Info {
    private int id;
    private String name;
    private String monthly_saving;
    private String loan_installment;
    private String fine;
    private String total;
    private String uname;

    // Constructors
    public Info() {}

    public Info(int id, String name, String monthly_saving, String loan_installment, 
               String fine, String total, String uname) {
        this.id = id;
        this.name = name;
        this.monthly_saving = monthly_saving;
        this.loan_installment = loan_installment;
        this.fine = fine;
        this.total = total;
        this.uname = uname;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getMonthly_saving() { return monthly_saving; }
    public void setMonthly_saving(String monthly_saving) { this.monthly_saving = monthly_saving; }

    public String getLoan_installment() { return loan_installment; }
    public void setLoan_installment(String loan_installment) { this.loan_installment = loan_installment; }

    public String getFine() { return fine; }
    public void setFine(String fine) { this.fine = fine; }

    public String getTotal() { return total; }
    public void setTotal(String total) { this.total = total; }

    public String getUname() { return uname; }
    public void setUname(String uname) { this.uname = uname; }

	public void setMonthly_saving(double double1) {
		// TODO Auto-generated method stub
		
	}
}