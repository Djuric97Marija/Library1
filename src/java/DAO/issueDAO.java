/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Models.Issue;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Marija
 */
public interface issueDAO {
    
    boolean insert(Issue issue) throws SQLException;
    boolean delete(String Id) throws SQLException;
    boolean  updateIssue( Issue issue) throws SQLException;
    ArrayList<Issue> listIssue() throws SQLException;
    ArrayList<Issue> listAllIssue() throws SQLException;
    ArrayList<Issue> listActiveIssue() throws SQLException;
}
