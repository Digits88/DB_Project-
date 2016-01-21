/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hp pc
 */
public class School {
        private String school_id;
        private String school_name;
        private String address_line_1;
        private String address_line_2;
        private String state;
        private String city;
        private double coordinate_x;
        private double coordinate_y;
        private  ArrayList<String> telephone = new ArrayList<>();
        private String email;
        private int typeofschool;
    
    public School(){
        
    }
    public School(String school_id,String school_name,String address_line_1,String address_line_2, String street_name,String city, double coordinate_x,double coordinate_y,ArrayList<String> telephone,String email, int typeofschool ){
        this.school_id = school_id;
        this.school_name =school_name;
        this.address_line_1 = address_line_1;
        this.address_line_2 = address_line_2;
        this.state = street_name;
        this.city = city;
        this.coordinate_x = coordinate_x;
        this.coordinate_y = coordinate_y;
        this.telephone = telephone;
        this.email = email;
        this.typeofschool = typeofschool;
        
    }

     public School(String school_id,String school_name,String address_line_1,String address_line_2, String street_name,String city, double coordinate_x,double coordinate_y,String email, int typeofschool ){
        this.school_id = school_id;
        this.school_name =school_name;
        this.address_line_1 = address_line_1;
        this.address_line_2 = address_line_2;
        this.state = street_name;
        this.city = city;
        this.coordinate_x = coordinate_x;
        this.coordinate_y = coordinate_y;
        this.email = email;
        this.typeofschool = typeofschool;
        
    }

    public String getSchool_id() {
        return school_id;
    }

    public void setSchool_id(String school_id) {
        this.school_id = school_id;
    }

    public String getSchool_name() {
        return school_name;
    }

    public void setSchool_name(String school_name) {
        this.school_name = school_name;
    }

    public String getAddress_line_1() {
        return address_line_1;
    }

    public void setAddress_line_1(String address_line_1) {
        this.address_line_1 = address_line_1;
    }

    public String getAddress_line_2() {
        return address_line_2;
    }

    public void setAddress_line_2(String address_line_2) {
        this.address_line_2 = address_line_2;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public double getCoordinate_x() {
        return coordinate_x;
    }

    public void setCoordinate_x(double coordinate_x) {
        this.coordinate_x = coordinate_x;
    }

    public double getCoordinate_y() {
        return coordinate_y;
    }

    public void setCoordinate_y(double coordinate_y) {
        this.coordinate_y = coordinate_y;
    }

    public ArrayList<String> getTelephone() {
        return telephone;
    }

    public void setTelephone(ArrayList telephone) {
        this.telephone = telephone;
    }
    
    public  void setTelephone(String telephone){
        if(telephone == null){
            this.telephone = new ArrayList<String>();
        }
        this.telephone.add(telephone);
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTypeofSchool() {
        return typeofschool;
    }

    public void setTypeofSchool(int TypeofSchool) {
        this.typeofschool = TypeofSchool;
    }
}
