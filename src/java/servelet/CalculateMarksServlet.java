package servelet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Controller.ApplicationController;
import Controller.SchoolController;
import Controller.StudentController;
import Model.Application_School;
import Model.School;
import Model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lakshan
 */
public class CalculateMarksServlet extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            String app_id = request.getParameter("newid");
            String schoolEmail = (String) request.getSession().getAttribute("userid");            
            String school_id = SchoolController.getSchoolId(schoolEmail);
            School school = SchoolController.getSchoolLocation(school_id);
            Student studentLocation = ApplicationController.getStudentLocation(app_id);
            ArrayList<School> schoolList = SchoolController.getSchoolLocationList(studentLocation.getGender());
            int dist_marks = 10;
            double dist = distance(studentLocation.getCoordinate_x(), studentLocation.getCoordinate_y(), school.getCoordinate_x(), school.getCoordinate_y(), "K");
            for (School tempschool : schoolList) {
                double tempDist = distance(studentLocation.getCoordinate_x(), studentLocation.getCoordinate_y(), tempschool.getCoordinate_x(), tempschool.getCoordinate_y(), "K");
                if(tempDist<dist){
                    dist_marks-=1;
                    if(dist_marks==0){
                        break;
                    }
                }
            }
            ArrayList<String> siblingList = StudentController.getSiblingList(studentLocation.getGuardian_id(), school_id);
            int siblingMarks = 0;
            if(!siblingList.isEmpty()){
                siblingMarks = 10;                
            }
            Application_School application_School = new Application_School();
            application_School.setLocation_marks(dist_marks);
            application_School.setSibling_marks(siblingMarks);
            application_School.setSingle_school_id(school_id);
            ApplicationController.approveApplication(app_id,studentLocation.getStudent_id(),siblingList,application_School);
            response.sendRedirect("school_View_Application.jsp");
        }   catch (ClassNotFoundException ex) {
            response.sendRedirect("index.htm?message=" + URLEncoder.encode(ex.getMessage(), "UTF-8"));
        } catch (SQLException ex) {
           response.sendRedirect("index.htm?message=" + URLEncoder.encode(ex.getMessage(), "UTF-8"));
        }
    }
    private double distance(double lat1, double lon1, double lat2, double lon2, String unit) {
            double theta = lon1 - lon2;
            double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
            dist = Math.acos(dist);
            dist = rad2deg(dist);
            dist = dist * 60 * 1.1515;
            if (unit == "K") {
                    dist = dist * 1.609344;
            } else if (unit == "N") {
                    dist = dist * 0.8684;
            }

            return (dist);
    }
    private double deg2rad(double deg) {
            return (deg * Math.PI / 180.0);
    }
    private double rad2deg(double rad) {
            return (rad * 180 / Math.PI);
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
