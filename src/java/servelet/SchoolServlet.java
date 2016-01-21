/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import Controller.SchoolController;
import Controller.UserAccountController;
import Model.School;
import Model.UserAccount;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lahiru Sandeepa
 */
@WebServlet(name = "SchoolServlet", urlPatterns = {"/SchoolServlet"})
public class SchoolServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        School school = new School();
        UserAccount newAccount = new UserAccount();
        //.................................................................................................................
        school.setSchool_name(request.getParameter("q17_schoolName"));
        school.setAddress_line_1(request.getParameter("q16_schoolAddress[addr_line1]"));
        school.setAddress_line_2(request.getParameter("q16_schoolAddress[addr_line2]"));
        school.setState(request.getParameter("q16_schoolAddress[state]"));
        school.setCity(request.getParameter("q16_schoolAddress[city]"));
      //  school.setPostalCode(null);
        school.setEmail(request.getParameter("q12_emailAddress"));
        school.setTelephone(request.getParameter("q18_telNumber"));
        
        
        school.setCoordinate_x(Double.valueOf(request.getParameter("cordinate_x")) );
        school.setCoordinate_y(Double.valueOf(request.getParameter("Cordinate_y")) );
        String schoolType = request.getParameter("q13_typeOf");
        
        if(schoolType.equalsIgnoreCase("Boys school" )){

        }else if (schoolType.equalsIgnoreCase("Girls School" )){

        }else if (schoolType.equalsIgnoreCase("Mix school" )){

        }       

      //  school.setFax(fax);
        //....................................................................................................................
        newAccount.setUsername(request.getParameter("q12_emailAddress"));
        newAccount.setUsername(request.getParameter("q17_schoolName"));
        newAccount.setPassword(request.getParameter("q20_password"));
        newAccount.setAccountType(1);
        newAccount.setTelephone(request.getParameter("q18_telNumber"));
        
        Logger.getLogger(SchoolServlet.class.getName()).log(Level.SEVERE, null,"name : "+request.getParameter("q17_schoolName") );
        try {
            SchoolController.addNewSchool(school);
            UserAccountController.addSchooluser(newAccount);
            response.sendRedirect("adminHome.jsp");
        } catch (ClassNotFoundException | SQLException ex) {
            //response.sendRedirect("addsclsuccessful.jsp");
            Logger.getLogger(SchoolServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("SchoolRegistrationForm.jsp?message=" + URLEncoder.encode(ex.getMessage(), "UTF-8"));
        }
        
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
