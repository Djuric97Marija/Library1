/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RepoPattern;

import Models.Book;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import static java.lang.Class.forName;
import java.sql.Blob;
import java.sql.Connection;
import static java.sql.DriverManager.getConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import static java.util.logging.Level.SEVERE;
import static java.util.logging.Logger.getLogger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Marija
 */
public class bookRepo {
    
     Connection con;
    public bookRepo() {
        try {
            forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            getLogger(bookRepo.class.getName()).log(SEVERE, null, ex);
        }
        
        String URL =  "jdbc:mysql://localhost:3306/library", USER = "root", PASS = "";
        try {
            con = getConnection(URL, USER, PASS);
        } catch (SQLException ex) {
            getLogger(bookRepo.class.getName()).log(SEVERE, null, ex);
        }
        
    }
    public boolean insert(Book book, Part part) throws SQLException {
       
        String insert = "INSERT INTO book(name, author, description, genre, picture, quantity)"
                        + "VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement pst = con.prepareStatement(insert);
            
            pst.setString(1, book.getName());
            pst.setString(2, book.getAuthor());
            pst.setString(3, book.getDescription());
            pst.setString(4, book.getGenre());
            InputStream is = part.getInputStream();
            pst.setBlob(5,is);        
            pst.setString(6, book.getQuantity());
            
            pst.executeUpdate();
           
            return true;
        } catch (SQLException ex) {
            return false;
        } catch (IOException ex) {
           
            getLogger(bookRepo.class.getName()).log(SEVERE, null, ex);
            return false;
        }
        
    }

    public void picture(HttpServletRequest request, HttpServletResponse response, String bookId) throws ServletException, IOException, SQLException {
        
    Statement stmt;
            try {

                stmt = con.createStatement();
                byte[] imgData = null;
                ResultSet rs = stmt.executeQuery("select picture from book where bookId = " + bookId);
                while (rs.next()) 
                {
                    Blob image = rs.getBlob(1);
                    imgData = image.getBytes(1,(int)image.length());
                }
                response.setContentType("image/jpg");
                try (OutputStream o = response.getOutputStream()) {
                    o.write(imgData);
                    o.flush();
                }
            } catch (SQLException ex) {

            }
            finally{
                con.close();
            }
   
    }

    public ArrayList<Book> list() throws SQLException {
        
     ArrayList<Book> books = new ArrayList<>();
        try {
           
             String select = "select * from book";
        
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(select);
             
             while(rs.next()){
                 Book book = new Book();
                 book.setBookId(rs.getInt("bookId"));
                 book.setName(rs.getString("name"));
                 book.setAuthor(rs.getString("author"));
                 book.setDescription(rs.getString("description"));
                 book.setGenre(rs.getString("genre"));
                 book.setPicture(rs.getBlob("picture"));
                 book.setQuantity(rs.getString("quantity"));
       
                 books.add(book);
             }
        } catch (SQLException ex) {
            getLogger(bookRepo.class.getName()).log(SEVERE, null, ex);
        }
        return books; 
    }

    public Book select(String Id) throws SQLException {
    
        Book book = new Book();
        try {
            String select = "select * from book where bookId = " + Id;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(select);

            while(rs.next()){
                book.setBookId(rs.getInt("bookId"));
                book.setName(rs.getString("name"));
                book.setAuthor(rs.getString("author"));
                book.setDescription(rs.getString("description"));
                book.setPicture(rs.getBlob("picture"));
                book.setGenre(rs.getString("genre"));
                book.setQuantity(rs.getString("quantity"));
             
            }
        } catch (SQLException ex) {
            getLogger(bookRepo.class.getName()).log(SEVERE, null, ex);
        }
        finally{
            con.close();
        }
        return book;
    
    }
 /*    @Override
    public boolean update(Book book, Part part) throws SQLException, IOException {
       
        String slika = "slika = ?,";
        
        String update = "update buket "
                      + "set naziv = ?,"
                      + "cena = ?,"
                      + "vrsta = ?,";
              
        if (part.getSize()!=0)
            update += slika;
        
                 update += "opis = ?"+
                  "where buketId = ?";     
                
        try {
            PreparedStatement pst = con.prepareStatement(update);

            pst.setString(1, buket.getNaziv());
            pst.setInt(2, buket.getCena());
            pst.setString(3, buket.getVrsta());
            
            InputStream is;
            if(part.getSize()!=0){
                is = part.getInputStream();
                pst.setBlob(4, is);
                pst.setString(5,buket.getOpis());
                pst.setInt(6, buket.getBuketId());
            }
            else{
                pst.setString(4, buket.getOpis());
                pst.setInt(5, buket.getBuketId());
            }
            pst.executeUpdate();
            
            return true;
            
        } catch (SQLException e) {
          return false;
        }
    }

    @Override
    public void brisanje(String Id) throws SQLException {
        
    try {
          
            String delete = "delete from  buket where buketId = " + Id;
            PreparedStatement ps  = con.prepareStatement(delete);

            ps.executeUpdate();
  
        } catch (SQLException ex) {
            getLogger(buketRepo.class.getName()).log(SEVERE, null, ex);
        }
        
    }
  
     @Override
    public Buket selectByUsername(String username) throws SQLException {
    
         Buket buket = new Buket();
        try {
            String select = "select * from buket where naziv = '" + username +"'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(select);

            while(rs.next()){
                buket.setBuketId(rs.getInt("buketId"));
                buket.setNaziv(rs.getString("naziv"));
                buket.setCena(rs.getInt("cena"));
                buket.setVrsta(rs.getString("vrsta"));
                buket.setSlika(rs.getBlob("slika"));
                buket.setOpis(rs.getString("opis"));
                }
        
        } catch (SQLException ex) {
            getLogger(buketRepo.class.getName()).log(SEVERE, null, ex);
        }
        finally{
            con.close();
        }
       
        return buket;
    }
*/
}
