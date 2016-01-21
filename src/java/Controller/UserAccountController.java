/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.UserAccount;
import Model.UserPassword;
import db.DB_Handler;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hp pc
 */
public class UserAccountController {
    public static void addUserAccount(UserAccount userAccount) throws ClassNotFoundException, SQLException{ 
        Connection connection=db.DB_Connection.getDBConnection().getConnection();
        String sql = "INSERT INTO user_account VALUES(?,?,?,?,password(?),?)";
        PreparedStatement pStatement = connection.prepareStatement(sql);
        pStatement.setString(1, userAccount.getName());
        pStatement.setString(2, userAccount.getNic());
        pStatement.setString(3, userAccount.getTelephone());
        pStatement.setString(4, userAccount.getUsername());
        pStatement.setString(5, userAccount.getPassword());
        pStatement.setInt(6, userAccount.getAccountType());
        int result = pStatement.executeUpdate();
    }
    public static void updateUserAccount(UserAccount userAccount) throws ClassNotFoundException, SQLException{
        Connection connection=db.DB_Connection.getDBConnection().getConnection();
        String sql = "UPDATE user_account SET (?,?,?,?,?,?,?,?)";
        PreparedStatement pStatement = connection.prepareStatement(sql);
        pStatement.setString(1, userAccount.getName());
        pStatement.setString(2, userAccount.getNic());
        pStatement.setString(3, userAccount.getTelephone());
        pStatement.setString(4, userAccount.getUsername());
        pStatement.setString(5, userAccount.getUsername());
        int result = pStatement.executeUpdate();
    }
    public static void removeUserAccount(String username){   // account_id = username 
    }
    
    //cheack user is exist, for user change password in userSetting_serverlet.java 
    public static  boolean isUserExist(UserPassword user) throws ClassNotFoundException, SQLException{
        Connection connection=db.DB_Connection.getDBConnection().getConnection();
        System.out.println("controller: username : "+user.getUsername()+"");
        String sql = "SELECT * FROM user_account Where account_id = '"+user.getUsername()+"'";
        ResultSet resultset = DB_Handler.getData(connection, sql);
        if(resultset.next()){
            System.out.println("User Exist");
            return true;
            
        }else{
            System.out.println("User not Exist");
            return false;
        }
        
        
    }
    public static  void userPasswordUpdate(UserPassword user) throws ClassNotFoundException, SQLException{
        Connection connection=db.DB_Connection.getDBConnection().getConnection();
        String sql = "UPDATE user_account SET password=password('"+user.getNewPassword_enter1()+"') WHERE account_id ='"+user.getUsername()+"'";
        int resultset = DB_Handler.setData(connection, sql);
        
    }
    //add new school user... only username and password 
    public static  void addSchooluser(UserAccount userAccount) throws ClassNotFoundException, SQLException{
        Connection connection=db.DB_Connection.getDBConnection().getConnection();
        String sql = "INSERT INTO user_account VALUES(?,?,?,?,password(?),?)";
        PreparedStatement pStatement = connection.prepareStatement(sql);
        pStatement.setString(1, userAccount.getName());
        pStatement.setString(2, "123v");
        pStatement.setString(3, userAccount.getTelephone());
        pStatement.setString(4, userAccount.getUsername());
        pStatement.setString(5, userAccount.getPassword());
        pStatement.setInt(6, userAccount.getAccountType());
        int result = pStatement.executeUpdate();
    }
}
    
