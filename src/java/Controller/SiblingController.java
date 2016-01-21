/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Student;
import db.DB_Handler;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author hp pc
 */
public class SiblingController {
    public static ArrayList<String> getSiblingByStudent(String student_id) throws ClassNotFoundException, SQLException{
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        ArrayList<String> siblingList = new ArrayList<>();        
        String sql = "SELECT elder_sibling_id FROM sibling WHERE student_id = '"+student_id+"'";
        ResultSet resultset = DB_Handler.getData(connection, sql);
        while(resultset.next()){
            siblingList.add(resultset.getString("elder_sibling_id"));
        }
        return siblingList;
    }
  
    
    public boolean addSibling(String student_id,String sibling_id) throws ClassNotFoundException, SQLException{
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        String sql = "INSERT INTO sibling VALUES('"+student_id+"','"+sibling_id+"')";
        int result = DB_Handler.setData(connection, sql);
        return  true ? result>0 : false;        
    }
      //Lakshan Gamage
    public static boolean addSiblings(String student_id,ArrayList<String> siblingList) throws ClassNotFoundException, SQLException{
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        String sql ="INSERT INTO sibling VALUES(?,?)";    
        int result = 0;
        PreparedStatement preparedStatement = null;
        for (String sibling : siblingList) {            
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, student_id);
            preparedStatement.setString(2, sibling);
            result = preparedStatement.executeUpdate();
            if(result==0){
                return false;
            }
        }        
        return true;        
    }
    
}
