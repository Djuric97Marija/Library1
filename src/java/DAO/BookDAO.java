/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Models.Book;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Marija
 */
public interface BookDAO {
    boolean insert(Book book, Part part) throws SQLException;
    void picture(HttpServletRequest request, HttpServletResponse response, String bookId)
            throws ServletException, IOException, SQLException ;
    ArrayList<Book> list() throws SQLException;
    Book select(String Id) throws SQLException;
    boolean update(Book book, Part part) throws SQLException, IOException;
    void delete (String Id) throws SQLException;
    Book selectByUsername(String username) throws SQLException;
    
}
