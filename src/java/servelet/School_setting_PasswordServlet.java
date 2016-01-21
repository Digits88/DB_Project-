/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import Controller.UserAccountController;
import Model.UserPassword;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
 * @author Yasiru
 */
@WebServlet(name = "School_setting_Password", urlPatterns = {"/School_setting_Password"})
public class School_setting_PasswordServlet extends HttpServlet {

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
         UserPassword user = new UserPassword();
        //String useremail = (String) session.getAttribute("userid");
        user.setUsername(request.getParameter("usersessionID"));
        user.setCurrantPassword(request.getParameter("q3_enterYour"));
        user.setNewPassword_enter1(request.getParameter("q4_enterYour4"));
        user.setNewPassword_enter2(request.getParameter("q5_reEnter"));
        
        System.out.println("schoolSetting Servlet :username "+user.getUsername()+"");
        try {
            if(UserAccountController.isUserExist(user) ){
                //user is exist

                if((user.getNewPassword_enter1().equals(user.getNewPassword_enter2()))){
                    UserAccountController.userPasswordUpdate(user);
                    response.sendRedirect("schoolHome.jsp");
                }else{
                    response.sendRedirect("school_setting_password.jsp?message=" +URLEncoder.encode("password error", "UTF-8"));
                }
                
            }else{
                //Incorrect username or password
               response.sendRedirect("school_setting_password.jsp?message=" +URLEncoder.encode("user account not exist: "+user.getUsername(), "UTF-8"));
               // response.sendRedirect("User_setting_Password.jsp");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserSetting_Serverlet.class.getName()).log(Level.SEVERE, null, ex);
             response.sendRedirect("school_setting_password.jsp?message=" + URLEncoder.encode(ex.getMessage(), "UTF-8"));
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
