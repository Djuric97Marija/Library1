/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Student;
import RepoPattern.studentRepo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import static java.util.logging.Level.SEVERE;
import static java.util.logging.Logger.getLogger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Marija
 */
public class SignIn extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        try (PrintWriter out = response.getWriter()) {
            Student student = new Student();
            student.setFirstName(request.getParameter("firstName"));
            student.setLastName(request.getParameter("lastName"));
            student.setUsername(request.getParameter("username"));
            student.setEmail(request.getParameter("email"));
            student.setPass(request.getParameter("pass"));
            student.setPhoneNumber(request.getParameter("phoneNumber"));

            
            if(new studentRepo().insert(student)){
                request.setAttribute("result", "True");
                request.getRequestDispatcher("signIn.jsp").forward(request, response);
                HttpSession session = request.getSession();
                session.setAttribute("logged", student.getUsername());
                session.setAttribute("loggedRole", "2");
                }
            else{
                request.setAttribute("result", "False");
                request.getRequestDispatcher("signIn.jsp").forward(request, response);
            }
           
        } catch (SQLException ex) {
            getLogger(SignIn.class.getName()).log(SEVERE, null, ex);
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
