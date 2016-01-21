/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.School;
import db.DB_Connection;
import db.DB_Handler;
import java.rmi.NotBoundException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author hp pc
 */
public class SchoolController {
    
    /*
    add new school to the database...
    */
    public static boolean addNewSchool(School school) throws ClassNotFoundException, SQLException{   
        
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        String last_index = AutoGenerateId.autoGenerateId("school", "scl-", "school_id");
        //System.out.println("last index:"+last_index);
        String sql = "INSERT INTO school(school_id,name,address_line_1,address_line_2,street_name,city,coordinate_x,coordinate_y,email) VALUES(?,?,?,?,?,?,?,?,?)";
        PreparedStatement pStatement = connection.prepareStatement(sql);
        pStatement.setString(1, last_index);
        pStatement.setString(2, school.getSchool_name() );
        pStatement.setString(3, school.getAddress_line_1());
        pStatement.setString(4, school.getAddress_line_2());
        pStatement.setString(5, school.getState());
        pStatement.setString(6, school.getCity());
        pStatement.setDouble(7, 4.56);
        pStatement.setDouble(8, 48.24);        
        pStatement.setString(9, school.getEmail());
        
        
        return pStatement.execute();
        //return  true ? result>0 : false;   
    }
    /*
        remove school record from the database
    */
    public static boolean removeSchool(String school_id) throws ClassNotFoundException, SQLException{   
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        String sql = "DELETE from school WHERE student_id = '"+school_id+"'";
        int result = DB_Handler.setData(connection, sql);
        return  true ? result > 0 : false;
    }
    
    /*
        update details about school
        problem in updating telephone numbers... inseart genarated table id!!
        
    */
    public static boolean updateSchool(School school) throws SQLException, ClassNotFoundException{   
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        String sql = "UPDATE school SET school_name ='"+school.getSchool_name() +"', address_line_1 ='"+school.getAddress_line_1()+"',address_line_2='"+school.getAddress_line_2() +"',street_name = '"+school.getState()+"',city ='"+school.getCity() +"',cordinate_x = '"+Double.toString(school.getCoordinate_x())+"',cordinate_y = '"+Double.toString(school.getCoordinate_y()) +"',email = '"+school.getEmail() +"' WHERE school_id = '"+school.getSchool_id()+"'";
        int result = DB_Handler.setData(connection, sql);
        
        for (String tel : school.getTelephone()){
            String sql2 = "UPDATE telephone set school_id ='"+school.getSchool_id()+"', telephone = '"+tel+"' WHERE school_id = '"+school.getSchool_id()+"'";
            result = DB_Handler.setData(connection, sql2);
        }
        
        return  true ? result > 0 : false;
    }
    
    /*
        get all the school details
    */
    public static ArrayList<School> getSchoolList() throws ClassNotFoundException, SQLException{
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        ArrayList<School> schoolList = new ArrayList<>();        
        String sql = "SELECT * FROM school ";
        ResultSet resultset = DB_Handler.getData(connection, sql);
        while(resultset.next()){
            ArrayList<String> telephoneList = new ArrayList<>();
            School scl = new School(resultset.getString(1), resultset.getString(2), resultset.getString(3), resultset.getString(4), resultset.getString(5), resultset.getString(6), resultset.getDouble(7), resultset.getDouble(8), resultset.getString(10), resultset.getInt(11));
            schoolList.add(scl);
            sql = "SELECT number FROM schol_telephone WHERE school_id = '"+scl.getSchool_id()+"'";
            ResultSet resultset2 = DB_Handler.getData(connection, sql);
            while (resultset2.next()) {
                telephoneList.add(resultset2.getString("number"));
            }
            scl.setTelephone(telephoneList);
            schoolList.add(scl);
        }
        return schoolList;
    }
    
    
    /*
        search one school and get data...
    */
    public static School getSchool(String school_id) throws ClassNotFoundException, SQLException{
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        School scl=null;        
        String sql = "SELECT * FROM school WHERE school_id = '"+school_id+"' ";
        ResultSet resultset = DB_Handler.getData(connection, sql);
        while(resultset.next()){
               ArrayList<String> telephoneList = new ArrayList<>();
                scl = new School(resultset.getString(1), resultset.getString(2), resultset.getString(3), resultset.getString(4), resultset.getString(5), resultset.getString(6), resultset.getDouble(7), resultset.getDouble(8), resultset.getString(10), resultset.getInt(11));
                
                sql = "SELECT telephone FROM telephone WHERE school_id = '"+scl.getSchool_id()+"'";
                ResultSet resultset2 = DB_Handler.getData(connection, sql);
                while (resultset2.next()) {
                    telephoneList.add(resultset2.getString("telephone"));
                }
                scl.setTelephone(telephoneList);
               
        }
        return scl;
    
    }
    
    
    //Hashini call in Student_Application.jsp
    public static ArrayList<School> getFemaleSchools() throws ClassNotFoundException, SQLException{
    
    ArrayList<School> listOfSchools=new ArrayList<>();
    Connection connection=DB_Connection.getDBConnection().getConnection();
    String sql="SELECT name, school_id FROM school WHERE school_type=1 or school_type=0";
    ResultSet result=DB_Handler.getData(connection, sql);
    School s ;
    while(result.next()){
        s = new School();
        s.setSchool_id(result.getString("school_id"));
        s.setSchool_name(result.getString("name"));
        listOfSchools.add(s);    
    } 
    
    
    
    return listOfSchools;
    }
    
   //Lahiru sandeepa 
    //register student for school : get school name from email 
    public  static String getschoolname(String email) throws ClassNotFoundException, SQLException{
        Connection connection=DB_Connection.getDBConnection().getConnection();
        String sql="SELECT name FROM school WHERE email = '"+email+"'";
         ResultSet result=DB_Handler.getData(connection, sql);
        if(result.next()){
            return result.getString("name");
        }
        
        return null;
        
    }
    
    
    //Lakshan Gamage
   public static School getSchoolLocation(String school_id) throws ClassNotFoundException, SQLException{
    
    School school  = null;
    Connection connection=DB_Connection.getDBConnection().getConnection();
    String sql="SELECT coordinate_x, coordinate_y FROM school WHERE school_id=?";
    PreparedStatement ps = connection.prepareStatement(sql);
    ps.setString(1, school_id);
    ResultSet result=ps.executeQuery();
   
    if(result.next()){
        school = new School();
        school.setSchool_id(school_id);
        school.setCoordinate_x(result.getDouble("coordinate_x"));
        school.setCoordinate_y(result.getDouble("coordinate_y"));        
    } 
    return school;
   }
   //Lakshan Gamage
   public static ArrayList<School> getSchoolLocationList(int gender) throws ClassNotFoundException, SQLException{
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        ArrayList<School> schoolList = new ArrayList<>();  
        String sql = "SELECT coordinate_x, coordinate_y FROM school where school_type = ? or school_type = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, gender);
        preparedStatement.setInt(2, 2);
        
        ResultSet resultset = preparedStatement.executeQuery();
        School school = null;
        while(resultset.next()){
            school = new School();
            school.setCoordinate_x(resultset.getDouble("coordinate_x"));
            school.setCoordinate_y(resultset.getDouble("coordinate_y"));
            schoolList.add(school);
        }
        return schoolList;
    }
   
   //Lakshan Gamage
   public static String getSchoolId(String schoolEmail) throws ClassNotFoundException, SQLException{
    
    String schoolId  = null;
    Connection connection=DB_Connection.getDBConnection().getConnection();
    String sql="SELECT school_id FROM school WHERE email = ?";
    PreparedStatement ps = connection.prepareStatement(sql);
    ps.setString(1, schoolEmail);
    ResultSet result=ps.executeQuery();
   
    if(result.next()){
        schoolId = result.getString("school_id");
    } 
    return schoolId;
   }
    
}
