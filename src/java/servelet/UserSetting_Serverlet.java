
package servelet;

import Controller.UserAccountController;
import Model.UserPassword;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jboss.weld.servlet.SessionHolder;
import javax.jms.Session;

/**
 *
 * @author Lahiru Sandeepa
 */
@WebServlet(name = "UserSetting_Serverlet", urlPatterns = {"/UserSetting_Serverlet"})
public class UserSetting_Serverlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserPassword user = new UserPassword();
        //String useremail = (String) session.getAttribute("userid");
        user.setUsername(request.getParameter("usersessionID"));
        user.setCurrantPassword(request.getParameter("q3_enterYour"));
        user.setNewPassword_enter1(request.getParameter("q4_enterYour4"));
        user.setNewPassword_enter2(request.getParameter("q5_reEnter"));
        
        System.out.println("USerSetting Servlet :username "+user.getUsername()+"");
        try {
            if(UserAccountController.isUserExist(user) ){
                //user is exist

                if((user.getNewPassword_enter1().equals(user.getNewPassword_enter2()))){
                    UserAccountController.userPasswordUpdate(user);
                    response.sendRedirect("userHome.jsp");
                }else{
                    response.sendRedirect("User_setting_Password.jsp?message=" +URLEncoder.encode("password error", "UTF-8"));
                }
                
            }else{
                //Incorrect username or password
               response.sendRedirect("User_setting_Password.jsp?message=" +URLEncoder.encode("user account not exist: "+user.getUsername(), "UTF-8"));
               // response.sendRedirect("User_setting_Password.jsp");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserSetting_Serverlet.class.getName()).log(Level.SEVERE, null, ex);
             response.sendRedirect("User_setting_Password.jsp?message=" + URLEncoder.encode(ex.getMessage(), "UTF-8"));
        }
        
        
      
    }
        
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
