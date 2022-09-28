/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RepoPattern;

import DAO.studentDAO;
import Models.Student;
import static java.lang.Class.forName;
import java.sql.Connection;
import java.sql.DriverManager;
import static java.sql.DriverManager.getConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import static java.util.logging.Level.SEVERE;
import java.util.logging.Logger;
import static java.util.logging.Logger.getLogger;

/**
 *
 * @author Marija
 */
public class studentRepo implements studentDAO{

    Connection con;
    public studentRepo() {
        try {
            forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            getLogger(studentRepo.class.getName()).log(SEVERE, null, ex);
        }
        
        String URL =  "jdbc:mysql://localhost:3306/library", USER = "root", PASS = "";
        try {
            con = getConnection(URL, USER, PASS);
        } catch (SQLException ex) {
            getLogger(studentRepo.class.getName()).log(SEVERE, null, ex);
        }
        
    }
    
    @Override
    public boolean login(String username, String password) throws SQLException {
        
     String check = "select * from student where username = '" + username+ "' and pass = '"+ password+"'";
        
        PreparedStatement pst;        
        try {
            pst = con.prepareStatement(check);
            ResultSet rs =  pst.executeQuery(check);
            while(rs.next())
                return true;
        
        } catch (SQLException ex) {
            getLogger(studentRepo.class.getName()).log(SEVERE, null, ex);
        }
        finally{
            con.close();
        }
        
        return false;
    }

    @Override
    public String Role(String username, String password) throws SQLException {
    String select = "select roleId from student where pass = '"+ password + "' and username = '" + username + "'";
        Statement st;
        try {
            st = con.createStatement();
            ResultSet rs = st.executeQuery(select);

            while(rs.next())
                return rs.getString("roleId");
            
        } catch (SQLException ex) {
            getLogger(studentRepo.class.getName()).log(SEVERE, null, ex);
        }
        finally{
            con.close();
        }       
        return "Error";       
    }

    @Override
    public Student select(String Id) throws SQLException {
    
            Student student = new Student();
        try {
            String select = "select * from student where studentId = " + Id;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(select);

             while(rs.next()){
                student.setStudentId(rs.getInt("studentId"));
                student.setFirstName(rs.getString("firstName"));
                student.setLastName(rs.getString("lastName"));
                student.setUsername(rs.getString("username"));
                student.setEmail(rs.getString("email"));
                student.setPhoneNumber(rs.getString("phoneNumber"));
                student.setRoleId(rs.getInt("roleId"));
                }
        
        } catch (SQLException ex) {
            getLogger(studentRepo.class.getName()).log(SEVERE, null, ex);
        }
        finally{
            con.close();
        }   
        return student;
    }

    @Override
    public Student selectByUsername(String username) throws SQLException {
    
         Student student = new Student();
        try {
            String select = "select * from student where username = '" + username +"'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(select);

            while(rs.next()){
                student.setStudentId(rs.getInt("studentId"));
                student.setFirstName(rs.getString("firstName"));
                student.setLastName(rs.getString("lastName"));
                student.setUsername(rs.getString("username"));
                student.setEmail(rs.getString("email"));
                student.setPhoneNumber(rs.getString("phoneNumber"));
                student.setRoleId(rs.getInt("roleId"));
                }
        
        } catch (SQLException ex) {
            getLogger(studentRepo.class.getName()).log(SEVERE, null, ex);
        }
        finally{
            con.close();
        }
        
        return student;
    }

    @Override
    public boolean insert(Student student) throws SQLException {
        
    try {
            String insertToStudent = "INSERT INTO `student`(firstName, lastName, username, email, pass, phoneNumber, roleId)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement pst = con.prepareStatement(insertToStudent);
            
            pst.setString(1, student.getFirstName());
            pst.setString(2, student.getLastName());
            pst.setString(3, student.getUsername());
            pst.setString(4, student.getEmail());
            pst.setString(5, student.getPass());
            pst.setString(6, student.getPhoneNumber());
            //set in tabel student where 2 is for roleName, because student is 2, librarian is 1
            pst.setInt(7, 2);
            
            pst.executeUpdate();
           
           return true;
        } catch (SQLException e) {
        } 
        return false;
    }

    @Override
    public void delete(String Id) throws SQLException {
    
          try {
            String delete = "delete from  student where studentId = " + Id;
            PreparedStatement ps  = con.prepareStatement(delete);

            ps.executeUpdate();
  
        } catch (SQLException ex) {
            getLogger(studentRepo.class.getName()).log(SEVERE, null, ex);
        }
    }

    @Override
    public ArrayList<Student> list() throws SQLException {
       
        ArrayList<Student> studenti = new ArrayList<>();
        try {
           
             String select = "select * from student where roleId = 2 ";
        
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(select);
             
             while(rs.next()){
                Student student = new Student();
                student.setStudentId(rs.getInt("studentId"));
                student.setFirstName(rs.getString("firstName"));
                student.setLastName(rs.getString("lastName"));
                student.setUsername(rs.getString("username"));
                student.setEmail(rs.getString("email"));
                student.setPhoneNumber(rs.getString("phoneNumber"));
                student.setRoleId(rs.getInt("roleId"));
                studenti.add(student);
             }
        } catch (SQLException ex) {
            getLogger(studentRepo.class.getName()).log(SEVERE, null, ex);
        }
        finally{
           con.close();
        }
        return studenti; 
    }

    @Override
    public boolean update(Student student) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
   
}
