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
public class GuardianWorkTelephoneController {
    public static boolean addWorkTelephone(Guardian guardian) throws SQLException, ClassNotFoundException{
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        String sql = "INSERT INTO guardian_work_telephone VALUES(?,?)";
        PreparedStatement pStatement = null;
        int result = 0;
        for (String number : guardian.getOfficeTP()) {
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
    public void updateWorkTelephone(Guardian guardian) throws ClassNotFoundException, SQLException{
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        String sql = "UPDATE guardian_work_telephone SET (?,?)";
        PreparedStatement pStatement = null;
        for (String number : guardian.getOfficeTP()) {
            pStatement= connection.prepareStatement(sql);
            pStatement.setString(1, guardian.getNic());
            pStatement.setString(2, number);
            int result = pStatement.executeUpdate();
        }
    }
    
    public ArrayList<String> getWorkTelephone(String guardian_id) throws ClassNotFoundException, SQLException{
        ArrayList<String> workTelephone=new ArrayList<String>();
        
        Connection connection=DB_Connection.getDBConnection().getConnection();
        String sql="select number from guardian_work_telephone where guardian_id='"+guardian_id+"'";
        ResultSet resultSet=DB_Handler.getData(connection,sql);
        
        while(resultSet.next()){
            workTelephone.add(resultSet.getString(1));
        }
        return workTelephone;
        
    }
}
