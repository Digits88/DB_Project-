/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author hp pc
 */
public class Guardian {
   private String nic;
   private String studentID;
   private String fullName;
   private String firstName;
   private String middleInitials;
   private String surname;
   private String Occupation;
   private String residentAddressline_1;
   private String residentAddressline_2;
   private String residentStreetName;
   private String residentCity;
   private String workAddressline_1;
   private String workAddressline_2;
   private String workStreetName;
   private String workCity;
   private String homeTP;
   private ArrayList<String> mobileTP;
   private ArrayList<String> officeTP;

    public Guardian() {
    }

    public Guardian(String nic, String studentID, String fullName, String firstName, String middleInitials, String surname, String residentAddressline_1, String residentAddressline_2, String residentStreetName, String residentCity, String workAddressline_1, String workAddressline_2, String workStreetName, String workCity, String Occupation, String homeTP, ArrayList<String> mobileTP, ArrayList<String> officeTP) {
        this.nic = nic;
        this.studentID = studentID;
        this.fullName = fullName;
        this.firstName = firstName;
        this.middleInitials = middleInitials;
        this.surname = surname;
        this.residentAddressline_1 = residentAddressline_1;
        this.residentAddressline_2 = residentAddressline_2;
        this.residentStreetName = residentStreetName;
        this.residentCity = residentCity;
        this.workAddressline_1 = workAddressline_1;
        this.workAddressline_2 = workAddressline_2;
        this.workStreetName = workStreetName;
        this.workCity = workCity;
        this.Occupation = Occupation;
        this.homeTP = homeTP;
        this.mobileTP = mobileTP;
        this.officeTP = officeTP;
    }

    public Guardian(String nic, ArrayList<String> mobileTP) {
        this.nic = nic;
        this.mobileTP = mobileTP;
    }

    

    public void setNic(String nic) {
        this.nic = nic;
    }
    
//    public void setStudentID(String studentID) {
//        this.studentID = studentID;
//    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setMiddleInitials(String middleInitials) {
        this.middleInitials = middleInitials;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public void setResidentAddressline_1(String residentAddressline_1) {
        this.residentAddressline_1 = residentAddressline_1;
    }

    public void setResidentAddressline_2(String residentAddressline_2) {
        this.residentAddressline_2 = residentAddressline_2;
    }

    public void setResidentStreetName(String residentStreetName) {
        this.residentStreetName = residentStreetName;
    }

    public void setResidentCity(String residentCity) {
        this.residentCity = residentCity;
    }

    public void setWorkAddressline_1(String workAddressline_1) {
        this.workAddressline_1 = workAddressline_1;
    }

    public void setWorkAddressline_2(String workAddressline_2) {
        this.workAddressline_2 = workAddressline_2;
    }

    public void setWorkStreetName(String workStreetName) {
        this.workStreetName = workStreetName;
    }

    public void setWorkCity(String workCity) {
        this.workCity = workCity;
    }
//    public void setRelationship(String relationship) {
//        this.relationship = relationship;
//    }


    public void setOccupation(String Occupation) {
        this.Occupation = Occupation;
    }

    

    public String getNic() {
        return nic;
    }
    
    public String getStudentID() {
        return studentID;
    }

    public String getFullName() {
        return fullName;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getMiddleInitials() {
        return middleInitials;
    }

    public String getSurname() {
        return surname;
    }

    public String getResidentAddressline_1() {
        return residentAddressline_1;
    }

    public String getResidentAddressline_2() {
        return residentAddressline_2;
    }

    public String getResidentStreetName() {
        return residentStreetName;
    }

    

    public String getResidentCity() {
        return residentCity;
    }

    public String getWorkAddressline_1() {
        return workAddressline_1;
    }

    public String getWorkAddressline_2() {
        return workAddressline_2;
    }

    public String getWorkStreetName() {
        return workStreetName;
    }

    public String getWorkCity() {
        return workCity;
    }

    public String getOccupation() {
        return Occupation;
    }

    public String getHomeTP() {
        return homeTP;
    }

    public ArrayList<String> getMobileTP() {
        return mobileTP;
    }

    public ArrayList<String> getOfficeTP() {
        return officeTP;
    }

    public void setHomeTP(String homeTP) {
        this.homeTP = homeTP;
    }

    public void setMobileTP(ArrayList<String> mobileTP) {
        this.mobileTP = mobileTP;
    }

    public void setOfficeTP(ArrayList<String> officeTP) {
        this.officeTP = officeTP;
    }

    
    
//    public String getRelationship() {
//        return relationship;
//    }

    
   
   
}
