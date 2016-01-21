/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Application_School;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Hashini
 */
public class Application_SchoolController {
    
    public static boolean addApplication_School(Application_School appSch) throws ClassNotFoundException, SQLException{
    
     Connection connection = db.DB_Connection.getDBConnection().getConnection();
        String sql = "INSERT INTO application_school VALUES(?,?,?,?,?)";
        PreparedStatement pStatement = null;
        int result =0;
        for (String number : appSch.getSchool_id()) {
            pStatement= connection.prepareStatement(sql);
            pStatement.setString(1, appSch.getApplication_id());
            pStatement.setString(2, number);
            pStatement.setInt(3, 0);
            pStatement.setInt(4, 0);
            pStatement.setInt(5, 0);
            result = pStatement.executeUpdate();   
            if(result == 0){
                break;
            }
        }   
        return  true ? result>0 : false;
    }
    //Lakshan Gamage
    public static boolean updateMarks(Application_School appSch) throws ClassNotFoundException, SQLException{
    
     Connection connection = db.DB_Connection.getDBConnection().getConnection();
        String sql = "UPDATE application_school SET location_marks=?, sibling_marks=? WHERE school_id=?";
        PreparedStatement pStatement = null;
        int result =0;        
        pStatement= connection.prepareStatement(sql);
        pStatement.setInt(1, appSch.getLocation_marks());
        pStatement.setInt(2, appSch.getSibling_marks());
        pStatement.setString(3, appSch.getSingle_school_id());        
        result = pStatement.executeUpdate();   
        if(result == 0){
            return false;
        }           
        return  true;
    }
    
    
}
