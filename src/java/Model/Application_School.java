/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author Hashini
 */
public class Application_School {
    
    private String application_id;
    private ArrayList<String> school_id;
    private String single_school_id;
    private int status;
    private int location_marks;
    private int sibling_marks;

    public String getSingle_school_id() {
        return single_school_id;
    }

    public void setSingle_school_id(String single_school_id) {
        this.single_school_id = single_school_id;
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
     * @return the school_id
     */
    public ArrayList<String> getSchool_id() {
        return school_id;
    }

    /**
     * @param school_id the school_id to set
     */
    public void setSchool_id(ArrayList<String> school_id) {
        this.school_id = school_id;
    }

    /**
     * @return the status
     */
    public int getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * @return the location_marks
     */
    public int getLocation_marks() {
        return location_marks;
    }

    /**
     * @param location_marks the location_marks to set
     */
    public void setLocation_marks(int location_marks) {
        this.location_marks = location_marks;
    }

    /**
     * @return the sibling_marks
     */
    public int getSibling_marks() {
        return sibling_marks;
    }

    /**
     * @param sibling_marks the sibling_marks to set
     */
    public void setSibling_marks(int sibling_marks) {
        this.sibling_marks = sibling_marks;
    }
    
    
}
