/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Guardian;
import db.DB_Connection;
import db.DB_Handler;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Yasiru
 */
public class GuardianMobileTelephoneController {
    
    public static boolean addMobileTelephone(Guardian guardian) throws ClassNotFoundException, SQLException{
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        String sql = "INSERT INTO guardian_mobile_telephone VALUES(?,?)";
        PreparedStatement pStatement = null;
        int result =0;
        for (String number : guardian.getMobileTP()) {
            pStatement= connection.prepareStatement(sql);
            pStatement.setString(1, guardian.getNic());
            pStatement.setString(2, number);
            result = pStatement.executeUpdate();   
            if(result == 0){
                break;
            }
        }   
        return  true ? result>0 : false;
    }
    
    public void updateMobileTelephone(Guardian guardian) throws ClassNotFoundException, SQLException{
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        String sql = "UPDATE guardian_mobile_telephone SET (?,?)";
        PreparedStatement pStatement = null;
        for (String number : guardian.getMobileTP()) {
            pStatement= connection.prepareStatement(sql);
            pStatement.setString(1, guardian.getNic());
            pStatement.setString(2, number);
            int result = pStatement.executeUpdate();
        }
    }
    
    public ArrayList<String> getMobileTelephone(String guardian_id) throws ClassNotFoundException, SQLException{
        ArrayList<String> mobileTelephone=new ArrayList<String>();
        
        Connection connection=DB_Connection.getDBConnection().getConnection();
        String sql="select number from guardian_mobile_telephone where guardian_id='"+guardian_id+"'";
        ResultSet resultSet=DB_Handler.getData(connection,sql);
        
        while(resultSet.next()){
            mobileTelephone.add(resultSet.getString(1));
        }
        return mobileTelephone;
        
    }
}
