/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Book;
import RepoPattern.BookRepo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Marija
 */
@MultipartConfig(maxFileSize = 161772716)
public class InsertBook extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try {
            Book book = new Book();

            book.setName(request.getParameter("name"));
            book.setAuthor(request.getParameter("author"));
            book.setDescription(request.getParameter("description"));
            book.setGenre(request.getParameter("genre"));
            Part part = request.getPart("picture");
            book.setQuantity(request.getParameter("quantity"));
            
            if (new BookRepo().insert(book, part)) {
                request.setAttribute("result", "True");
                request.getRequestDispatcher("allBooks.jsp").forward(request, response);
            } else {
                request.setAttribute("result", "False");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (NumberFormatException ex) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(InsertBook.class.getName()).log(Level.SEVERE, null, ex);
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
