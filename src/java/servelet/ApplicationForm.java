/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import Controller.ApplicationController;
import Controller.AutoGenerateId;
import Controller.GuradianController;
import Controller.StudentController;
import Model.Application;
import Model.Application_School;
import Model.Guardian;
import Model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.rmi.NotBoundException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Hashini
 */
@WebServlet(name = "ApplicationForm", urlPatterns = {"/ApplicationForm"})
public class ApplicationForm extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ApplicationForm</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ApplicationForm at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
            //Hashini
            
            //student object
            //create new student,Guardian
            String firstName = request.getParameter("q4_name[first]");
            String middleName = request.getParameter("q4_name[middle]");
            String lastName = request.getParameter("q4_name[last]");
            String nic = request.getParameter("NIC");
            String relationship = request.getParameter("q29_relationship");
            String adressline1 = request.getParameter("q5_addresshome[addr_line1]");
            String addressline2 = request.getParameter("q5_addresshome[addr_line2]");
            String street = request.getParameter("q5_addresshome[city]");
            String city = request.getParameter("q5_addresshome[state]");
            String homeTel = request.getParameter("q6_homeNumber[phone]");
            String tel1 = request.getParameter("q7_cellularNumber7[phone]");
            String tel2 = request.getParameter("q30_cellularNumber30[phone]");
            String occupaton = request.getParameter("q32_occupation");
            String workAddressline1 = request.getParameter("q33_addresswork[addr_line1]");
            String workAddressline2 = request.getParameter("q33_addresswork[addr_line2]");
            String workStreet = request.getParameter("q33_addresswork[city]");
            String workCity = request.getParameter("q33_addresswork[state]");
            String workTel1 = request.getParameter("q9_workNumber9[phone]");
            String workTel2 = request.getParameter("q31_workNumber[phone]");
            
            //guardian details
            Guardian guardian=new Guardian();
            
            guardian.setFullName(firstName+" "+middleName+" "+lastName);
            guardian.setFirstName(firstName);
            guardian.setMiddleInitials(middleName);
            guardian.setSurname(lastName);
            guardian.setNic(nic);
            guardian.setResidentAddressline_1(adressline1);
            guardian.setResidentAddressline_2(addressline2);
            guardian.setResidentStreetName(street);
            guardian.setResidentCity(city);
            guardian.setHomeTP(homeTel);
            ArrayList<String> mobileList = new ArrayList<>();
            mobileList.add(tel2);
            mobileList.add(tel1);
            guardian.setMobileTP(mobileList);
            guardian.setOccupation(occupaton);
            guardian.setWorkAddressline_1(workAddressline1);
            guardian.setWorkAddressline_2(workAddressline2);
            guardian.setWorkStreetName(workStreet);
            guardian.setWorkCity(workCity);
            ArrayList<String> workTpList = new ArrayList<>();
            workTpList.add(workTel1);
            workTpList.add(workTel2);
            guardian.setOfficeTP(workTpList);
            
            String stFirstName = request.getParameter("q4_fullName4[first]");
            String stMiddleName = request.getParameter("q4_fullName4[first]");
            String stLastName = request.getParameter("q4_fullName4[first]");
            String date=request.getParameter("q8_birthday8[day]");
            String month=request.getParameter("q8_birthday8[month]");
            String year=request.getParameter("q8_birthday8[year]");
            String birthday=date+"/"+month+"/"+year;
            DateFormat df=new SimpleDateFormat("MM/dd/yyyy");
            Date bDay = null;
            try{
                bDay=df.parse(birthday);
            }catch(ParseException e){
                response.sendRedirect("index.htm?message=" + URLEncoder.encode(e.getMessage(), "UTF-8"));
            }
            String stAddressline1 = request.getParameter("q9_address[addr_line1]");
            String stAddressline2 = request.getParameter("q9_address[addr_line2]");
            String ststreet = request.getParameter("q9_address[city]");
            String stcity = request.getParameter("q9_address[state]");
            String stTel = request.getParameter("q6_phoneNumber6[phone]");
            String gender = request.getParameter("q12_availabilityOf");
            String[] schoolids = request.getParameterValues("q11_school");
            
            
            
            Student student=new Student();
            
            String student_id=AutoGenerateId.autoGenerateId("student","stu_","student_id");
            student.setStudent_id(student_id);
            student.setFull_name(stFirstName+" "+stMiddleName+" "+stLastName);
            student.setFirst_name(stFirstName);
            student.setMiddle_innitials(stMiddleName);
            student.setSurname(stLastName);
            if(gender.equalsIgnoreCase("female")){
                student.setGender(1);
            }
            else{
                student.setGender(0);
            }
            student.setBirthday(bDay);
            student.setAddress_line_1(stAddressline1);
            student.setAddress_line_2(stAddressline2);
            student.setCity(stcity);
            student.setStreet_name(stLastName);
            student.setTelephone(stTel);
            student.setRelationship(relationship);
            student.setGuardian_id(nic);
            student.setCoordinate_x(Double.parseDouble("6.2461"));
            student.setCoordinate_y(Double.parseDouble("80.3833"));
            
            Application app=new Application();
            
            String application_id=AutoGenerateId.autoGenerateId("application","app_","application_id");
            app.setApplication_id(application_id);
            java.sql.Date sqlDate2 = new java.sql.Date(new Date().getTime());
            app.setDate(sqlDate2);           
            app.setUser_account_id(request.getParameter("user_id"));
            app.setStudent_id(student_id);                        
        
            
            Application_School appSch=new Application_School();
            appSch.setApplication_id(application_id);
            ArrayList<String> schoolidList = new ArrayList<>();
            for (int i = 0; i < schoolids.length; i++) {
                schoolidList.add(schoolids[i]);
            }
            appSch.setSchool_id(schoolidList);
            
            boolean guardianAvailability=GuradianController.checkGuardian(nic);
            boolean studentAvailability=StudentController.checkGuardian(lastName, nic);
            
            
            
            if(guardianAvailability && studentAvailability){
                
                
              //  String userId=
                        //     if(userId=currentuser ID)
                        //pop up msg
                        //else
                        //update guardian
                        //add student
                        //add application
                        
                        }
            else if(guardianAvailability==true && studentAvailability==false){
                //add student
                //add application
                
                //update guardian
                
            }
            else if (guardianAvailability==false && studentAvailability==false){
                //add guardian
                
                //add student
                //add application
                boolean result=ApplicationController.addApplication(app, student, guardian,appSch);
                
            }
            
            
            
            response.sendRedirect("index.htm");
            
            
        }catch(ClassNotFoundException | SQLException ex){
            response.sendRedirect("index.htm?message=" + URLEncoder.encode(ex.getMessage(), "UTF-8"));
        }
        
       
      
        
        
       
    }

    /**
     *
     * @param request
     * @param response
     */
    
    
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
            processRequest(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
            processRequest(request, response);
       
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
