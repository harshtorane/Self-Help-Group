package com.nt.entity;

public class User {
    private int id;
    private String uname;
    private String pass;
    private String role;
    private String photoPath; // NEW

    // Constructors
    public User() {}
    // getters/setters
    public String getPhotoPath() { return photoPath; }
    public void setPhotoPath(String photoPath) { this.photoPath = photoPath; }
    
    public User(int id, String uname, String pass, String role) {
        this.id = id;
        this.uname = uname;
        this.pass = pass;
        this.role = role;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUname() { return uname; }
    public void setUname(String uname) { this.uname = uname; }

    public String getPass() { return pass; }
    public void setPass(String pass) { this.pass = pass; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}