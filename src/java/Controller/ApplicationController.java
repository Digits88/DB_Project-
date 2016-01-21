/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Application;
import Model.Application_School;
import Model.Guardian;
import Model.School;
import Model.Student;
import db.DB_Connection;
import db.DB_Handler;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hp pc
 */
public class ApplicationController {
    
    
    //Hashini
//    public static void addNewObject(){
//    
//        Connection connection=null;
//       try{
//        connection=DB_Connection.getDBConnection().getConnection();
//      
//       
//       
//       } catch (ClassNotFoundException |  SQLException ex) {
//            if(connection != null){
//                try {
//                    connection.rollback();
//                } catch (SQLException ex1) {                    
//                    Logger.getLogger(ApplicationController.class.getName()).log(Level.SEVERE, null, ex1);
//                }
//            }
//        }finally{
//            try {
//                connection.setAutoCommit(true);
//            } catch (SQLException ex) {
//                Logger.getLogger(ApplicationController.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        } 
//    
//    }
    
    
    
    
   
    //Hashini
    public static boolean  addApplication(Application application, Student student, Guardian guardian,Application_School appSch ) throws SQLException {
        Connection connection = null;
        
        
        
        
        int result = 0;
        try {
            connection=DB_Connection.getDBConnection().getConnection();
            connection.setAutoCommit(false);
            
            Boolean guardianAdded = GuradianController.addNewGuardian(guardian);
            Boolean studentAdded = StudentController.addNewStudent(student);
            
            String sql="INSERT INTO application VALUES(?,?,?,?,?,?)";
            
            Date sqlDate=new Date();
            PreparedStatement PStatement=connection.prepareStatement(sql);
            PStatement.setString(1,application.getApplication_id());
            PStatement.setDate(2, (java.sql.Date) sqlDate);
            PStatement.setString(6,application.getUser_account_id());
            PStatement.setString(7,application.getStudent_id());
       
            result=PStatement.executeUpdate();
            Boolean application_schoolAdded=Application_SchoolController.addApplication_School(appSch);
                    
            if(result > 0 && studentAdded && guardianAdded){
                connection.commit();
            }else{
                connection.rollback();
            }                            
        } catch (ClassNotFoundException ex) {
            if(connection != null){
                try {
                    connection.rollback();
                } catch (SQLException ex1) {                    
                    Logger.getLogger(ApplicationController.class.getName()).log(Level.SEVERE, null, ex1);
                }
            }
        }finally{
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ApplicationController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } 
                
        return  true ? result>0 : false;
    }
    //Hashini
    
   
    public boolean updateApplication(Application application,String studentId) throws ClassNotFoundException, SQLException{
        Connection connection=DB_Connection.getDBConnection().getConnection();
        String sql="UPDATE application SET  date =?,user_account_id=? WHERE student_id=?";
        
        PreparedStatement PStatement=connection.prepareStatement(sql);
        PStatement.setString(1, application.getApplication_id());
       // PStatement.setInt(5, application.getStatus());       
        int result=PStatement.executeUpdate();        
       
        return true ? result>0 : false;
        
        
    }
  
    
//    public boolean removeApplication(String application_id) throws ClassNotFoundException, SQLException{
//        Connection connection=DB_Connection.getDBConnection().getConnection();
//        String sql="DELETE application WHERE application_id=?";
//        
//        PreparedStatement PStatement=connection.prepareStatement(sql);
//        PStatement.setString(1, application_id);
//        int result=PStatement.executeUpdate();
//       
//        return true ? result>0 :false;
//    }
//    public ArrayList<Application> getApplicationsByUser(String userAccount_id) throws ClassNotFoundException, SQLException{
//       
//        ArrayList<Application> listOfApplication=new ArrayList<>();
//        Connection connection=DB_Connection.getDBConnection().getConnection();
//        String sql="SELECT * FROM application WHERE application_id=?";
//        PreparedStatement PStatement=connection.prepareStatement(sql);
//        PStatement.setString(6, userAccount_id);
//        ResultSet resultSet=PStatement.executeQuery(sql);
//      
//        while(resultSet.next()){
//        Application application=new Application();
//        application.setApplication_id(resultSet.getString("application_id"));
//        application.setDate(resultSet.getDate("date"));
//        application.setLocation_marks(resultSet.getInt("location_marks"));
//        application.setSibling_marks(resultSet.getInt("sibling_marks"));
//        application.setStatus(resultSet.getInt("status"));
//        application.setUser_account_id(resultSet.getString("user_account_id"));
//        application.setStudent_id(resultSet.getString("student_id"));
//        application.setRequested_id(resultSet.getString("requested_school_id"));
//        
//        
//        }
//        
//        
//        return listOfApplication;
//    }
//    public ArrayList<Application> getApplicationsBySchool(String school_id) throws ClassNotFoundException, SQLException{
//       
//       ArrayList<Application> listOfApplication=new ArrayList<>();
//        Connection connection=DB_Connection.getDBConnection().getConnection();
//        String sql="SELECT * FROM application WHERE requested_school_id=?";
//        PreparedStatement PStatement=connection.prepareStatement(sql);
//        PStatement.setString(8, school_id);
//        ResultSet resultSet=PStatement.executeQuery(sql);
//      
//        while(resultSet.next()){
//        Application application=new Application();
//        application.setApplication_id(resultSet.getString("application_id"));
//        application.setDate(resultSet.getDate("date"));
//        application.setLocation_marks(resultSet.getInt("location_marks"));
//        application.setSibling_marks(resultSet.getInt("sibling_marks"));
//        application.setStatus(resultSet.getInt("status"));
//        application.setUser_account_id(resultSet.getString("user_account_id"));
//        application.setStudent_id(resultSet.getString("student_id"));
//        application.setRequested_id(resultSet.getString("requested_school_id"));
//        
//        
//        }
//        
//        
//        return listOfApplication;
//    }
//    public ArrayList<Application> getApplicationsByStudent(String student_id) throws ClassNotFoundException, SQLException{
//      
//      ArrayList<Application> listOfApplication=new ArrayList<>();
//        Connection connection=DB_Connection.getDBConnection().getConnection();
//        String sql="SELECT * FROM application WHERE student_id=?";
//        PreparedStatement PStatement=connection.prepareStatement(sql);
//        PStatement.setString(7, student_id);
//        ResultSet resultSet=PStatement.executeQuery(sql);
//      
//        while(resultSet.next()){
//        Application application=new Application();
//        application.setApplication_id(resultSet.getString("application_id"));
//        application.setDate(resultSet.getDate("date"));
//        application.setLocation_marks(resultSet.getInt("location_marks"));
//        application.setSibling_marks(resultSet.getInt("sibling_marks"));
//        application.setStatus(resultSet.getInt("status"));
//        application.setUser_account_id(resultSet.getString("user_account_id"));
//        application.setStudent_id(resultSet.getString("student_id"));
//        application.setRequested_id(resultSet.getString("requested_school_id"));
//        
//        
//        }
//        
//        
//        return listOfApplication;
//    }
    
    
      //Lahiru sandeepa
      //studentRegisterServlet
     public static void registerToSchool(ArrayList<String> studentIdList)throws ClassNotFoundException, SQLException {

        Connection connection=db.DB_Connection.getDBConnection().getConnection();
        for(String stId : studentIdList){
            String sql = "UPDATE application_school SET status ='2' WHERE  application_id = (SELECT application_id FROM application  WHERE student_id = '"+stId+"')";
            int resultset =DB_Handler.setData(connection, sql);        
        }    
    }
    
     //Lakshan Gamage
     public static void approveApplication(String application_id, String student_id, ArrayList<String> siblingList, Application_School application_School){
        Connection connection=null;
        try {
            connection=db.DB_Connection.getDBConnection().getConnection();
            connection.setAutoCommit(false);
            Boolean isSiblingsSuccess = false;
            Boolean ismarksSuccess = false;
            Boolean isAppUpdateSuccess = false;
            if(!siblingList.isEmpty()){
                isSiblingsSuccess = SiblingController.addSiblings(student_id, siblingList);
            }
            
            ismarksSuccess = Application_SchoolController.updateMarks(application_School);
            if(ismarksSuccess){
                String sql = "UPDATE application_school SET status ='1' WHERE  application_id =? and school_id = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, application_id);
                preparedStatement.setString(2, application_School.getSingle_school_id());
                int result = preparedStatement.executeUpdate();
                if(result>0){
                    isAppUpdateSuccess = true;
                    connection.commit();
                    connection.setAutoCommit(true);
                }
            }
            
            if(!isSiblingsSuccess || !ismarksSuccess || !isAppUpdateSuccess){
                connection.rollback();                   
            }
            
        } catch (SQLException | ClassNotFoundException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ApplicationController.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }finally{
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ApplicationController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
     
        //Lakshan Gamage
        
    public static Student getStudentLocation(String application_id) throws ClassNotFoundException, SQLException{
    
    Student student  = null;
    Connection connection=DB_Connection.getDBConnection().getConnection();
    String sql="SELECT student_id, guardian_id,gender, coordinate_x, coordinate_y FROM student WHERE student_id=(SELECT student_id from application where application_id=?)";
    PreparedStatement ps = connection.prepareStatement(sql);
    ps.setString(1, application_id);
    ResultSet result=ps.executeQuery();
   
    if(result.next()){
        student = new Student();
        student.setStudent_id(result.getString("student_id"));
        student.setCoordinate_x(result.getDouble("coordinate_x"));
        student.setCoordinate_y(result.getDouble("coordinate_y"));  
        student.setGuardian_id(result.getString("guardian_id"));
        student.setGender(result.getInt("gender"));
    } 
    return student;
   }
    
}
