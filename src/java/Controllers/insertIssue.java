/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Book;
import Models.Issue;
import Models.Student;
import RepoPattern.bookRepo;
import RepoPattern.issueRepo;
import RepoPattern.studentRepo;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Marija
 */
public class insertIssue extends HttpServlet {

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
        
        
    }

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
        try {
            Issue issue = new  Issue();
            
            Student s = new studentRepo().selectByUsername((String) request.getSession().getAttribute("logged"));
            issue.setStudentId(s.getStudentId());
             
            issue.setBookId(parseInt(request.getParameter("bookId")));
            issue.setIssueDate(request.getParameter("issueDate"));
            issue.setReturnDate(request.getParameter("returnDate"));
            
            if(new issueRepo().insert(issue)){
               request.setAttribute("result", "True");
               request.getRequestDispatcher("allBooks.jsp").forward(request, response);
            }
            else{
                  request.setAttribute("result", "False");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }catch(NumberFormatException  ex){
             request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(insertIssue.class.getName()).log(Level.SEVERE, null, ex);
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
