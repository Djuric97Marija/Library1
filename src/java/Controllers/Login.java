package Controllers;

import Models.Student;
import RepoPattern.StudentRepo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import static java.util.logging.Level.SEVERE;
import java.util.logging.Logger;
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
public class Login extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Student s = new Student();
            HttpSession  session = request.getSession();
             
            String  username = request.getParameter("username");
            String password = request.getParameter("password");
            String loggedRole = new StudentRepo().Role(username, password);
            
            if(new StudentRepo().login(username, password)){
                session.setAttribute("logged", username); 
                session.setAttribute("loggedRole", loggedRole);
                request.setAttribute("firstLogin", "True");
                session.setAttribute("s", s);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            else{
                request.setAttribute("firstLogin", "False");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            
        } catch (SQLException ex) {
            getLogger(Login.class.getName()).log(SEVERE, null, ex);
        }    
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
    }




    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

