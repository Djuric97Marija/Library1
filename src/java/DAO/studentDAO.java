/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import Models.Student;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author Marija
 */
public interface studentDAO {
    
    boolean insert(Student student) throws SQLException;

    boolean login(String username, String password) throws SQLException;

    Student select(String Id) throws SQLException;

    Student selectByUsername(String username) throws SQLException;

    String Role(String username, String password) throws SQLException;

    void delete(String Id) throws SQLException;

    ArrayList<Student> list() throws SQLException;

    boolean update(Student student) throws SQLException;

  
}
