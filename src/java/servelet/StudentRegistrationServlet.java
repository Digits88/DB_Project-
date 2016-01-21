/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import Controller.ApplicationController;
import Controller.StudentController;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lahiru Sandeepa
 */
@WebServlet(name = "StudentRegistrationServlet", urlPatterns = {"/StudentRegistrationServlet"})
public class StudentRegistrationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
        int noOfCheckBoxs = Integer.parseInt(request.getParameter("checkboxCount"));
        String[] checkboxvalues = request.getParameterValues("checkbox");
        ArrayList<String> studentIdList = new ArrayList();
       
        for(int x = 0 ; x< noOfCheckBoxs ; x++){
            if(checkboxvalues[x]!= null){
                 System.out.println("selected student list : StudentRegistrationServlet : line 37 : "+ checkboxvalues[x] + " " );
                 studentIdList.add(checkboxvalues[x]);
            }
        }
        
        try {
            ApplicationController.registerToSchool(studentIdList);
            response.sendRedirect("schoolHome.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(StudentRegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
             response.sendRedirect("Register_Grade_1_Students.jsp?message=" + URLEncoder.encode(ex.getMessage(), "UTF-8"));
        }
        
    }

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StudentRegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StudentRegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
