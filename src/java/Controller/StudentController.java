/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.School;
import Model.Student;
import db.DB_Connection;
import db.DB_Handler;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author hp pc
 */
public class StudentController {
    
    //Hashini
    public static boolean addNewStudent(Student student) throws ClassNotFoundException, SQLException{  
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        String sql = "INSERT INTO student VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Date sqlDate = new Date(student.getBirthday().getTime());
        PreparedStatement pStatement = connection.prepareStatement(sql);
        pStatement.setString(1, student.getStudent_id());
        pStatement.setString(2, student.getFull_name());
        pStatement.setString(3, student.getFirst_name());
        pStatement.setString(4, student.getMiddle_innitials());
        pStatement.setString(5, student.getSurname());
        pStatement.setInt(6, student.getGender());
        pStatement.setString(7, student.getGuardian_id());
        pStatement.setDate(8, (Date) student.getBirthday());
        pStatement.setString(9, student.getAddress_line_1());
        pStatement.setString(10, student.getAddress_line_2());
        pStatement.setString(11, student.getStreet_name());
        pStatement.setString(12, student.getCity());
        pStatement.setDouble(13, student.getCoordinate_x());
        pStatement.setDouble(14, student.getCoordinate_y());
        pStatement.setString(15, student.getTelephone());
        pStatement.setString(16,student.getRelationship());
       // pStatement.setString(15, student.getSchool_id());
        int result = pStatement.executeUpdate();
        return  true ? result>0 : false;   
        
    }
    
    //update student
     public static void updateStudent(Student student,String guardianId) throws ClassNotFoundException, SQLException{
       
        Connection connection=db.DB_Connection.getDBConnection().getConnection();
        String sql = "UPDATE student SET full_name=?,first_name=?,middle_innitials=?,surname=?,gender=?,birthday=?,address_line_1=?, address_line_2=?,street_name=?, city=?,coordinate_x=?,coordinate_y=?,telephone=?,guardian_relationship=? WHERE guardian_id=?";
        PreparedStatement pStatement = connection.prepareStatement(sql);
        pStatement.setString(1, student.getFull_name());
        pStatement.setString(2, student.getFirst_name());
        pStatement.setString(3, student.getMiddle_innitials());
        pStatement.setString(4, student.getSurname());
        pStatement.setInt(5, student.getGender());
        pStatement.setDate(6, (Date) student.getBirthday());
        pStatement.setString(7, student.getAddress_line_1());
        pStatement.setString(8, student.getAddress_line_2());
        pStatement.setString(9, student.getStreet_name());
        pStatement.setString(10, student.getCity());
        pStatement.setDouble(11, student.getCoordinate_x());
        pStatement.setDouble(12, student.getCoordinate_y());
        pStatement.setString(13, student.getTelephone());
        pStatement.setString(14,student.getRelationship());
        pStatement.setString(15,guardianId);
        //int result = pStatement.executeUpdate();
        pStatement.executeUpdate();
    }
    
    
    
    //check student availability
     
      public static boolean checkGuardian(String fullName,String guardianId ) throws ClassNotFoundException, SQLException{
        
       
        Connection connection=db.DB_Connection.getDBConnection().getConnection();
        String sql = "SELECT * FROM student WHERE full_name=? and guardian_id=?";
        PreparedStatement pStatement = connection.prepareStatement(sql);
        pStatement.setString(1, fullName);
        pStatement.setString(2, guardianId);
        ResultSet resultSet=pStatement.executeQuery();
        if(resultSet.next()){
        return true;
        }
        return false;
    }
     
     
     
     
    
//    public static Student getStudentDetails(String student_id) throws ClassNotFoundException, SQLException{
//        Student student = null;
//        Connection connection = db.DB_Connection.getDBConnection().getConnection();
//        
//        String sql = "SELECT * FROM student where student_id = '"+student_id+"' ";
//        ResultSet resultSet = DB_Handler.getData(connection, sql);
//        if(resultSet.next()){
//            java.util.Date date = resultSet.getDate("birthday");            
//            student =  new Student(resultSet.getString("student_id"), resultSet.getString("full_name"), 
//                    resultSet.getString("first_name"), resultSet.getString("middle_innitials"),
//                    resultSet.getString("surname"), resultSet.getString("guardian_id"), date, 
//                    resultSet.getString("address_line_1"), resultSet.getString("address_line_2"), 
//                    resultSet.getString("street_name"), resultSet.getString("city"),
//                    resultSet.getDouble("coordinate_x"), resultSet.getDouble("coordinate_y"),
//                    resultSet.getString("telephone"), resultSet.getString("school_id"));
//        }
//        return student;
//    }
//    public static ArrayList<Student> getStudentsBySchool(String school_id) throws ClassNotFoundException, SQLException{
//        Connection connection = db.DB_Connection.getDBConnection().getConnection();
//        ArrayList<Student> studentList = new ArrayList<>();
//        String sql = "SELECT * FROM student where school_id = '"+school_id+"'";
//        ResultSet resultSet = DB_Handler.getData(connection, sql);
//        if(resultSet.next()){
//            java.util.Date date = resultSet.getDate("birthday");            
//            Student student =  new Student(resultSet.getString("student_id"), resultSet.getString("full_name"), 
//                    resultSet.getString("first_name"), resultSet.getString("middle_innitials"),
//                    resultSet.getString("surname"), resultSet.getString("guardian_id"), date, 
//                    resultSet.getString("address_line_1"), resultSet.getString("address_line_2"), 
//                    resultSet.getString("street_name"), resultSet.getString("city"),
//                    resultSet.getDouble("coordinate_x"), resultSet.getDouble("coordinate_y"),
//                    resultSet.getString("telephone"), resultSet.getString("school_id"));
//            studentList.add(student);
//        }
//        return studentList;
//    }
//    public static ArrayList<Student> getSiblings(String student_id) throws ClassNotFoundException, SQLException{
//        ArrayList<String> siblingList = SiblingController.getSiblingByStudent(student_id);
//        Connection connection = db.DB_Connection.getDBConnection().getConnection();
//        ArrayList<Student> studentList = new ArrayList<>();        
//        String sql = "SELECT * FROM student where school_id = ?";
//        PreparedStatement pStatement = null;
//        ResultSet resultSet = null;
//        for (String sibling_id : siblingList) {
//            pStatement = connection.prepareStatement(sql);
//            pStatement.setString(1, sibling_id);
//            resultSet =  pStatement.executeQuery();
//            if(resultSet.next()){
//                java.util.Date date = resultSet.getDate("birthday");
//                Student student =  new Student(resultSet.getString("student_id"), resultSet.getString("full_name"), 
//                    resultSet.getString("first_name"), resultSet.getString("middle_innitials"),
//                    resultSet.getString("surname"), resultSet.getString("guardian_id"), date, 
//                    resultSet.getString("address_line_1"), resultSet.getString("address_line_2"), 
//                    resultSet.getString("street_name"), resultSet.getString("city"),
//                    resultSet.getDouble("coordinate_x"), resultSet.getDouble("coordinate_y"),
//                    resultSet.getString("telephone"), resultSet.getString("school_id"));
//                studentList.add(student);
//            }                     
//        }        
//        return studentList;
//    }

    //Lakshan Gamage
      
    public static ArrayList<String> getSiblingList(String guardian_id, String school_id) throws ClassNotFoundException, SQLException{
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        ArrayList<String> siblingList = new ArrayList<>();        
        String sql = "SELECT student_id FROM student WHERE guardian_id = ? and school_id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, guardian_id);
        preparedStatement.setString(2, school_id);
        ResultSet resultset = preparedStatement.executeQuery();
        String student = null;
        while(resultset.next()){            
            student=resultset.getString("student_id");            
            siblingList.add(student);
        }
        return siblingList;
    }
}
