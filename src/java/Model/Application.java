/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Date;

/**
 *
 * @author hp pc
 */
public class Application {
    
    private String application_id;
    private Date date;    
   // private int status;    //set status
    private String user_account_id; 
    private String student_id;
   // private String requested_school_id;
    private String deadline_id;

    
    public Application(){
    }
    
    public Application(String application_id,Date date,int location_marks,int sibling_marks,int status,String user_account_id,String student_id,String deadline_id){
        this.application_id=application_id;
        this.date=date;
             // this.status=status;
        this.user_account_id=user_account_id;
        this.student_id=student_id;
       // this.requested_school_id=requested_school_id;
        
        
        
        
        
    }
    
    
    /**
     * @return the application_id
     */
    public String getApplication_id() {
        return application_id;
    }

    /**
     * @param application_id the application_id to set
     */
    public void setApplication_id(String application_id) {
        this.application_id = application_id;
    }

    /**
     * @return the date
     */
    public Date getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }

    
    /**
     * @return the status
     */
//    public int getStatus() {
//        return status;
//    }
//
//    /**
//     * @param status the status to set
//     */
//    public void setStatus(int status) {
//        this.status = status;
//    }

    /**
     * @return the user_account_id
     */
    public String getUser_account_id() {
        return user_account_id;
    }

    /**
     * @param user_account_id the user_account_id to set
     */
    public void setUser_account_id(String user_account_id) {
        this.user_account_id = user_account_id;
    }

    /**
     * @return the requested_id
     */
//    public String getRequested_id() {
//        return requested_school_id;
//    }
//
//    /**
//     * @param requested_id the requested_id to set
//     */
//    public void setRequested_id(String requested_id) {
//        this.requested_school_id = requested_id;
//    }

    /**
     * @return the student_id
     */
    public String getStudent_id() {
        return student_id;
    }

    /**
     * @param student_id the student_id to set
     */
    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }
    
    
}
