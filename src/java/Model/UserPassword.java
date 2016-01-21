/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Lahiru Sandeepa
 */
public class UserPassword {
    
    private String username;
    private String currantPassword;
    private String newPassword_enter1;
    private String newPassword_enter2;
    
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCurrantPassword() {
        return currantPassword;
    }

    public void setCurrantPassword(String currantPassword) {
        this.currantPassword = currantPassword;
    }

    public String getNewPassword_enter1() {
        return newPassword_enter1;
    }

    public void setNewPassword_enter1(String newPassword_enter1) {
        this.newPassword_enter1 = newPassword_enter1;
    }

    public String getNewPassword_enter2() {
        return newPassword_enter2;
    }

    public void setNewPassword_enter2(String newPassword_enter2) {
        this.newPassword_enter2 = newPassword_enter2;
    }
    
}
