package pl.coderslab.charity.model;

import javax.validation.constraints.Email;

public class registerUser {
    @Email
    private String username;
    //Tutaj można dodać regexa jakie hasło ma być
    private String password;
    private String passwordConfirm;

    public registerUser(@Email String username, String password, String passwordConfirm) {
        this.username = username;
        this.password = password;
        this.passwordConfirm = passwordConfirm;
    }

    public registerUser() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }
}
