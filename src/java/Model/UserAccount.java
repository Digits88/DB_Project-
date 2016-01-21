/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author hp pc
 */
public class UserAccount {
    private String username;
    private String password;
    private String telephone;
    private String nic;
    private String name;
    private int accountType;

    public String getUsername() {
        return username;
    }

    public UserAccount() {
    }

    public UserAccount(String username, String password, String telephone, String nic, String name, int accountType) {
        this.username = username;
        this.password = password;
        this.telephone = telephone;
        this.nic = nic;
        this.name = name;
        this.accountType = accountType;
    }

    public int getAccountType() {
        return accountType;
    }

    public void setAccountType(int accountType) {
        this.accountType = accountType;
    }
    
    public UserAccount(String username, String password, String telephone, String nic, String name) {
        this.username = username;
        this.password = password;
        this.telephone = telephone;
        this.nic = nic;
        this.name = name;
    }
    
    public String getPassword() {
        return password;
    }

    public String getTelephone() {
        return telephone;
    }

    public String getNic() {
        return nic;
    }

    public String getName() {
        return name;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public void setName(String name) {
        this.name = name;
    }

    
    
}
