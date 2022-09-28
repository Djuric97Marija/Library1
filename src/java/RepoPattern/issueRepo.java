/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RepoPattern;

import Controllers.deleteIssue;
import DAO.issueDAO;
import Models.Issue;
import java.io.IOException;
import java.io.InputStream;
import static java.lang.Class.forName;
import java.sql.Connection;
import static java.sql.DriverManager.getConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static java.sql.Statement.RETURN_GENERATED_KEYS;
import java.util.ArrayList;
import java.util.List;
import static java.util.logging.Level.SEVERE;
import static java.util.logging.Logger.getLogger;

/**
 *
 * @author Marija
 */
public class issueRepo implements issueDAO {

    Connection con;

    public issueRepo() {
        try {
            forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            getLogger(issueRepo.class.getName()).log(SEVERE, null, ex);
        }

        String URL = "jdbc:mysql://localhost:3306/library", USER = "root", PASS = "";
        try {
            con = getConnection(URL, USER, PASS);
        } catch (SQLException ex) {
            getLogger(issueRepo.class.getName()).log(SEVERE, null, ex);
        }
    }
    @Override
    public boolean insert(Issue issue) throws SQLException {
       
        String insert = "INSERT INTO issue(studentId, bookId, issueDate, returnDate)"
                        + "VALUES (?,?,?,?) ";
        try {
            PreparedStatement pst = con.prepareStatement(insert);
            
            pst.setInt(1, issue.getStudentId());
            pst.setInt(2, issue.getBookId());
            pst.setString(3, issue.getIssueDate());
            pst.setString(4, issue.getReturnDate());
            
            pst.executeUpdate();
            
            return true;
        } catch (SQLException ex) {
            return false;
        }
        
    }

 
    @Override
    public ArrayList<Issue> listActiveIssue() throws SQLException {

        ArrayList<Issue> issue = new ArrayList<>();
        try {

            String select = "SELECT i.issueId, i.studentId, i.bookId, i.issueDate, i.returnDate, b.name as 'name', b.author as 'author', s.firstName as 'firstName', s.lastName as 'lastName'"
                    + "FROM issue i JOIN book b ON i.bookId = b.bookId JOIN student s ON i.studentId = s.studentId WHERE returnDate > date(now())";

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(select);

            while (rs.next()) {
                Issue issues = new Issue();

                issues.setIssueId(rs.getInt("issueId"));
                issues.setStudentId(rs.getInt("studentId"));
                issues.setBookId(rs.getInt("bookId"));
                issues.setIssueDate(rs.getString("issueDate"));
                issues.setReturnDate(rs.getString("returnDate"));
                issues.book.setName(rs.getString("name"));
                issues.book.setAuthor(rs.getString("author"));
                issues.student.setFirstName(rs.getString("firstName"));
                issues.student.setLastName(rs.getString("lastName"));

                issue.add(issues);
            }

        } catch (SQLException ex) {
            getLogger(issueRepo.class.getName()).log(SEVERE, null, ex);
        } finally {
            con.close();
        }
        return issue;
    }

    @Override
    public boolean delete(String Id) throws SQLException {

        try {
            String delete = "delete from issue where issueId = " + Id;

            PreparedStatement psDelete = con.prepareStatement(delete);

            psDelete.executeUpdate();

        } catch (SQLException ex) {
            getLogger(deleteIssue.class.getName()).log(SEVERE, null, ex);
        }
        return true;
    }

    @Override
    public boolean updateIssue(Issue issue) throws SQLException {
        try {

            String update = "UPDATE issue SET placeno = ? WHERE narudzbenicaId = ?";

            PreparedStatement pst = con.prepareStatement(update);

            pst.setInt(1, issue.getIssueId());
            pst.setInt(2, issue.getStudentId());

            pst.executeUpdate();

            return true;

        } catch (SQLException e) {

            return false;

        }
    }

    @Override
    public ArrayList<Issue> listIssue() throws SQLException {

        ArrayList<Issue> i = new ArrayList<>();
        try {

            String select = "select * from issue";

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(select);

            while (rs.next()) {
                Issue issue = new Issue();

                issue.setIssueId(rs.getInt("issueId"));
                issue.setStudentId(rs.getInt("studentId"));
                issue.setBookId(rs.getInt("bookId"));
                issue.setIssueDate(rs.getString("issueDate"));
                issue.setReturnDate(rs.getString("returnDate"));

                i.add(issue);
            }

        } catch (SQLException ex) {
            getLogger(issueRepo.class.getName()).log(SEVERE, null, ex);
        } finally {
            con.close();
        }
        return i;
    }

    @Override
    public ArrayList<Issue> listAllIssue() throws SQLException {
       
        ArrayList<Issue> issue = new ArrayList<>();
        try {

            String select = "SELECT i.issueId, i.studentId, i.bookId, i.issueDate, i.returnDate, b.name as 'name', b.author as 'author', s.firstName as 'firstName', s.lastName as 'lastName'"
                    + "FROM issue i JOIN book b ON i.bookId = b.bookId JOIN student s ON i.studentId = s.studentId WHERE returnDate > date(now())";

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(select);

            while (rs.next()) {
                Issue issues = new Issue();

                issues.setIssueId(rs.getInt("issueId"));
                issues.setStudentId(rs.getInt("studentId"));
                issues.setBookId(rs.getInt("bookId"));
                issues.setIssueDate(rs.getString("issueDate"));
                issues.setReturnDate(rs.getString("returnDate"));
                issues.book.setName(rs.getString("name"));
                issues.book.setAuthor(rs.getString("author"));
                issues.student.setFirstName(rs.getString("firstName"));
                issues.student.setLastName(rs.getString("lastName"));

                issue.add(issues);
            }

        } catch (SQLException ex) {
            getLogger(issueRepo.class.getName()).log(SEVERE, null, ex);
        } finally {
            con.close();
        }
        return issue;
    }
}
