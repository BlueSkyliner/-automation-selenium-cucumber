package com.IndieAn.GoFundIndie.TestDomain.UserTest;

public class UserInfoTestDTO {
    private long id;
    private boolean admin_role;
    private String email;
    private String profile_picture;
    private String nickname;
    private int total_donation;
    private boolean ad_agree;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public boolean isAdmin_role() {
        return admin_role;
    }

    public void setAdmin_role(boolean admin_role) {
        this.admin_role = admin_role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProfile_picture() {
        return profile_picture;
    }

    public void setProfile_picture(String profile_