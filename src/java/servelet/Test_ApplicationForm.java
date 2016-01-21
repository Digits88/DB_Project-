/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import java.io.IOException;
import java.rmi.NotBoundException;
import java.sql.SQLException;
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
@WebServlet(name = "Test_ApplicationForm", urlPatterns = {"/Test_ApplicationForm"})
public class Test_ApplicationForm extends HttpServlet {
    
    
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, NotBoundException {
        response.setContentType("text/html;charset=UTF-8");
      
      
      //Student
       String firstName=(request.getParameter("q8_fullName[first]"));
       String middleName=(request.getParameter("q8_fullName[middle]"));
       String lastName=(request.getParameter("q8_fullName[last]"));
       String fullName=(request.getParameter("q8_fullName[first]"));
       String gender=(request.getParameter("genderT"));
       String date=request.getParameter("q8_birthday8[day]");
       String month=request.getParameter("q8_birthday8[month]");
       String year=request.getParameter("q8_birthday8[year]");            
       
      
       
        
       
        String setAddress_line_1=request.getParameter("q12_address[addr_line1]");
       String setAddress_line_2=request.getParameter("q12_address[addr_line2]");
       String setCity=request.getParameter("q12_address[city]");
       String setCoordinate_x=request.getParameter("lat");
       String setCoordinate_y=request.getParameter("lng");
       String setTelephone=request.getParameter("q6_phoneNumber6[area]");
       String setRelationship=request.getParameter("relationsip");
        
          System.out.println(fullName);
       
        
      //guardian
        
        
     //appplication
     
        
     //application_school   
      
      
      
      
      
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ApplicationForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ApplicationForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NotBoundException ex) {
            Logger.getLogger(ApplicationForm.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ApplicationForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ApplicationForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NotBoundException ex) {
            Logger.getLogger(ApplicationForm.class.getName()).log(Level.SEVERE, null, ex);
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
