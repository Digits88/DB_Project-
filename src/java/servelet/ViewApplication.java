/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yasiru
 */
public class ViewApplication extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewApplication</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewApplication at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    out.println("<html>");
    out.println("<head><title>All Employees</title></head>");
    out.println("<body>");
    out.println("<center><h1>All Employees</h1>");
    Connection conn = null;
    Statement stmt = null;
    try {
      Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            try {
                conn = DriverManager.getConnection("jdbc:odbc:Employees");
            } catch (SQLException ex) {
                Logger.getLogger(ViewApplication.class.getName()).log(Level.SEVERE, null, ex);
            }
      stmt = conn.createStatement();
      String orderBy = request.getParameter("sort");
      if ((orderBy == null) || orderBy.equals("")) {
        orderBy = "SSN";
      }
      String orderByDir = request.getParameter("sortdir");
      if ((orderByDir == null) || orderByDir.equals("")) {
        orderByDir = "asc";
      }
      String query = "SELECT Employees.SSN, Employees.Name, " + "Employees.Salary, "
          + "Employees.Hiredate, Location.Location " + "FROM Location " + "INNER JOIN Employees "
          + "ON Location.Loc_Id = Employees.Loc_Id " + "ORDER BY " + orderBy + " " + orderByDir
          + ";";
      ResultSet rs = stmt.executeQuery(query);
      while (rs.next()) {
        long employeeSSN = rs.getLong("SSN");
        String employeeName = rs.getString("Name");
        long employeeSalary = rs.getLong("Salary");
        Date employeeHiredate = rs.getDate("Hiredate");
        String employeeLocation = rs.getString("Location");
        out.print(employeeSSN + "::");
        out.print(employeeName + "::");
        out.print(employeeSalary + "::");
        out.print(employeeHiredate + "::");
        out.print(employeeLocation + "::");
      }
    } catch (SQLException e) {
      out.println("An error occured while retrieving " + "all employees: " 
          + e.toString());
    } catch (ClassNotFoundException e) {
      throw (new ServletException(e.toString()));
    } finally {
      try {
        if (stmt != null) {
          stmt.close();
        }
        if (conn != null) {
          conn.close();
        }
      } catch (SQLException ex) {
      }
    }
    out.println("</center>");
    out.println("</body>");
    out.println("</html>");
    out.close();
        
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
