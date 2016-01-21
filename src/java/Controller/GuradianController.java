/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Guardian;
import Model.Student;
import db.DB_Connection;
import db.DB_Handler;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hp pc
 */
public class GuradianController {
//    public static Guardian getGuarduan(String student_id) throws SQLException, ClassNotFoundException{
//        Guardian guardian=null;
//        GuardianMobileTelephoneController guardianMobileTelephoneController = null;
//        GuardianWorkTelephoneController guardianWorkTelephoneController = null;
//        Connection connection=DB_Connection.getDBConnection().getConnection();
//        String sql="select * from guardian where student_id='"+student_id+"'";
//        ResultSet resultSet=DB_Handler.getData(connection,sql);
//        if(resultSet.next()){
//            guardian=new Guardian(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3),
//                    resultSet.getString(4), resultSet.getString(5), resultSet.getString(6), resultSet.getString(7),
//                    resultSet.getString(8),resultSet.getString(9), resultSet.getString(10), resultSet.getString(11),
//                    resultSet.getString(12), resultSet.getString(13), resultSet.getString(14), resultSet.getString(15),
//                    resultSet.getString(16),resultSet.getString(17),
//                    guardianMobileTelephoneController.getMobileTelephone(resultSet.getString(1)),
//                    guardianWorkTelephoneController.getWorkTelephone(resultSet.getString(1)));
//            //guardian.setClassRoom(ClassRoomController.searchClassRoomByID(resultSet.getInt("current_class_id")));
//        }
//        return guardian;
//    }
    
    
    
    
    
    //Hashini
    public static void updateGuarduan(Guardian guardian,String guardianId) throws ClassNotFoundException, SQLException{
        GuardianMobileTelephoneController guardianMobileController = null;
        GuardianWorkTelephoneController guardianWorkTelephoneController=null;
        Connection connection=db.DB_Connection.getDBConnection().getConnection();
        String sql = "UPDATE guardian SET full_name=?,first_name=?,middle_innitials=?,surname=?,occupation=?,res_address_line_1=?, res_address_line_2=?,res_street_name=?,res_city=?,work_address_line_1=?work_address_line_2=?, work_street_name=?,work_city=?,telephone_home=? WHERE guardian_id=?";
        PreparedStatement pStatement = connection.prepareStatement(sql);
        pStatement.setString(15, guardian.getNic());
        pStatement.setString(1, guardian.getFullName());
        pStatement.setString(2, guardian.getFirstName());
        pStatement.setString(3, guardian.getMiddleInitials());
        pStatement.setString(4, guardian.getSurname());
        pStatement.setString(5, guardian.getOccupation());
        pStatement.setString(6, guardian.getResidentAddressline_1());
        pStatement.setString(7, guardian.getResidentAddressline_2());
        pStatement.setString(8, guardian.getResidentStreetName());
        pStatement.setString(9, guardian.getResidentCity());
        pStatement.setString(10, guardian.getWorkAddressline_1());
        pStatement.setString(11, guardian.getWorkAddressline_2());
        pStatement.setString(12, guardian.getWorkStreetName());
        pStatement.setString(13, guardian.getWorkCity());
        pStatement.setString(14, guardian.getHomeTP());
        
        guardianMobileController.updateMobileTelephone(guardian);
        guardianWorkTelephoneController.updateWorkTelephone(guardian);
        int result = pStatement.executeUpdate();
    }
    
    //Hashini
    public static boolean addNewGuardian(Guardian guardian) throws SQLException, ClassNotFoundException{
        GuardianMobileTelephoneController guardianMobileController = null;
        GuardianWorkTelephoneController guardianWorkTelephoneController=null;
        Connection connection=db.DB_Connection.getDBConnection().getConnection();
        String sql = "INSERT INTO guardian VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pStatement = connection.prepareStatement(sql);
        pStatement.setString(1, guardian.getNic());
        pStatement.setString(2, guardian.getFullName());
        pStatement.setString(3, guardian.getFirstName());
        pStatement.setString(4, guardian.getMiddleInitials());
        pStatement.setString(5, guardian.getSurname());
        pStatement.setString(6, guardian.getOccupation());
        pStatement.setString(7, guardian.getResidentAddressline_1());
        pStatement.setString(8, guardian.getResidentAddressline_2());
        pStatement.setString(9, guardian.getResidentStreetName());
        pStatement.setString(10, guardian.getResidentCity());
        pStatement.setString(11, guardian.getWorkAddressline_1());
        pStatement.setString(12, guardian.getWorkAddressline_2());
        pStatement.setString(13, guardian.getWorkStreetName());
        pStatement.setString(14, guardian.getWorkCity());
        pStatement.setString(15, guardian.getHomeTP());
        boolean guardianMobile = guardianMobileController.addMobileTelephone(guardian);
        if(!guardianMobile){
            return false;
        }
        boolean guardianTelephone = guardianWorkTelephoneController.addWorkTelephone(guardian);
        if(!guardianTelephone){
            return false;
        }
       
        
        
        int result = pStatement.executeUpdate();        
        return  true ? result>0 : false;  
        
    }
    //Hashini
    public static boolean checkGuardian(String guardianId ) throws ClassNotFoundException, SQLException{
        
       
        Connection connection=db.DB_Connection.getDBConnection().getConnection();
        String sql = "SELECT * FROM guardian WHERE guardian_id='"+guardianId+"'";
        ResultSet resultSet=DB_Handler.getData(connection,sql);
        if(resultSet.next()){
        return true;
        }
        return false;
    }
    
    
    
    
 
}
