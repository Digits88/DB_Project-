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
public class Student {
private String student_id;
private String full_name;
private String first_name ;
private String middle_innitials;
private String surname;
private int gender;
private String guardian_id;
private Date birthday;
private String address_line_1;
private String address_line_2;
private String street_name;
private String city;
private double coordinate_x;
private double coordinate_y;
private String telephone;
private String school_id;
private String relationship;

public Student(){
    
}
public Student(String student_id, String full_name, String first_name, String middle_innitials, String surname, String guardian_id, Date birthday, String address_line_1, String address_line_2, String street_name, String city, double coordinate_x, double coordinate_y, String telephone, String school_id,String relationship) {
    this.student_id = student_id;
    this.full_name = full_name;
    this.first_name = first_name;
    this.middle_innitials = middle_innitials;
    this.surname = surname;
    this.guardian_id = guardian_id;
    this.birthday = birthday;
    this.address_line_1 = address_line_1;
    this.address_line_2 = address_line_2;
    this.street_name = street_name;
    this.city = city;
    this.coordinate_x = coordinate_x;
    this.coordinate_y = coordinate_y;
    this.telephone = telephone;
    this.school_id = school_id;
    this.relationship=relationship;
}

  
    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getMiddle_innitials() {
        return middle_innitials;
    }

    public void setMiddle_innitials(String middle_innitials) {
        this.middle_innitials = middle_innitials;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getGuardian_id() {
        return guardian_id;
    }

    public void setGuardian_id(String guardian_id) {
        this.guardian_id = guardian_id;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
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

    public String getStreet_name() {
        return street_name;
    }

    public void setStreet_name(String street_name) {
        this.street_name = street_name;
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

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getSchool_id() {
        return school_id;
    }

    public void setSchool_id(String school_id) {
        this.school_id = school_id;
    }

    /**
     * @return the relationship
     */
    public String getRelationship() {
        return relationship;
    }

    /**
     * @param relationship the relationship to set
     */
    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }

    /**
     * @return the gender
     */
    public int getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(int gender) {
        this.gender = gender;
    }
  
  
}

