<%-- 
    Document   : profile
    Created on : Sep 19, 2022, 8:41:12 PM
    Author     : Marija
--%>
<%@page import="Models.Issue"%>
<%@page import="RepoPattern.IssueRepo"%>
<%@page import="Models.Student"%>
<%@page import="RepoPattern.StudentRepo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Thasadith&display=swap" rel="stylesheet">
        <link rel="shortcut icon" type="image/jpg" href="pictures/icon.png"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title> 
    </head>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#Tabela').DataTable();
        });
    </script>
    <style>
        ::-webkit-scrollbar {
            width: 10px;
        }
        /* Track */
        ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 5px grey;
            border-radius: 1px;
        }
        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #4e555b;
            border-radius: 7px;
        }
        .background-image {
            position: fixed;
            background-repeat: no-repeat;
            background-image: linear-gradient(to bottom,#e1d3c1, #e1d3c1, #e1d3c1, #ffffff, #ffffff, #ffffff);
            background-size: cover;
            width: 100%;
            height: 100%;
            z-index: -1;
        }
        .btn-primary {

            background-color: #e1d3c1;
            border:#e1d3c1;
            transition-duration: 0.4s;
        }
        .btn-primary:hover {
            background-color: #AC3B61;  
            color: white;
        }
        .td 
        { background-color: #e1d3c1;}
        .responsive-table{
            th {
                border-radius: 3px;
                padding: 25px 30px;
                display: flex;
                justify-content: space-between;
                margin-bottom: 25px;

            }

        }
    </style>
    <body style="font-family: 'Thasadith', sans-serif; color:white;">
        <%@include file="navbar.jsp" %>
        <%
            String result = (String) request.getAttribute("result");

            if (result != null)
               if (result.equals("True")) {%>
        <script type="text/javascript">
            swal("Reservation", "Success!", "success")
                    .then(function () {
                        window.location = "profile.jsp";
                    });

        </script>

        <%   } else if (result.equals("False")) {%>

        <script type="text/javascript">
            swal("Error", "Error", "error")
                    .then(function () {
                        window.location = "index.jsp";
                    });
        </script>

        <% }%>
        <%  String loggedRole = "";
            if (request.getSession().getAttribute("loggedRole") != null) {
                loggedRole = "" + (request.getSession().getAttribute("loggedRole"));
            }
            String Id = request.getParameter("studentId");
            Student student = new StudentRepo().select(Id);
        %>
        <form style="margin-left: 10%; margin-top: -2%; margin-bottom: 5%; opacity: 0.7; width: 70rem; background: rgba(0,0,0,0.7); color: white">
            <h2 align="center" style="padding:4%; margin-top: 5%;">My profile</h2>
            <input value="<%=request.getParameter("studentId")%>" name="studentId" type="hidden">  
            <table style="margin-left: 20%; margin-bottom: 2%; margin-top: -5%" align="center">
                <tr>
                    <td style="margin: 10px; padding: 20px;"><label>First Name: </label></td>
                    <td style="margin: 10px;"><input type="text" readonly="true"  class="form-control" placeholder="First Name" value="<%= student.getFirstName()%>" name="firstName"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 20px;"><label>Last Name: </label></td>
                    <td style="margin: 10px;"><input required readonly="true"  type="text" class="form-control" placeholder="Last Name" value="<%= student.getLastName()%>"  name="lastName"></td>                
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 20px;"><label>Username: </label></td>
                    <td style="margin: 10px;"><input required type="text" readonly="true" class="form-control" placeholder="Username" value="<%= student.getUsername()%>"  name="username"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 20px;"><label>E-mail:</label></td>
                    <td style="margin: 10px;"><input type="text" required readonly="true" class="form-control" placeholder="E-mail:" value="<%= student.getEmail()%>" name="email"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 20px;"><label>Phone Number</label></td>
                    <td style="margin: 10px;"><input type="text" required readonly="true" class="form-control" placeholder="Phonenumber" value="<%= student.getPhoneNumber()%>" name="phoneNumber"></td>
                </tr>
            </table> 
            <% if (loggedRole.equals("2")) {%>
            <table style="width: 100%">
                <tbody style="opacity: 0.7; background: rgba(0,0,0,0.5); color: white"> 
                <thead>  
                    <tr>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Issue ID</td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Book Name</td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Author</td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">First Name</td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Last Name</td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Issue Date</td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Return Date</td>
                    </tr>
                </thead>
                <%
                    Student stud = new StudentRepo().selectByUsername((String) request.getSession().getAttribute("logged"));
                    for (Issue issue : new IssueRepo().listActiveIssue()) {
                        if (stud.getStudentId() == issue.getStudentId()) {
                %>
                <tr>
                    <td style="width:130px;" class="align-middle text-center" scope="col"><%=issue.getIssueId()%></td>
                    <td style="width:130px;" class="align-middle text-center" scope="col"><%=issue.book.getName()%></td>
                    <td style="width:130px;" class="align-middle text-center" scope="col"><%=issue.book.getAuthor()%></td>
                    <td style="width:130px;" class="align-middle text-center" scope="col"><%=issue.student.getFirstName()%></td>
                    <td style="width:130px;" class="align-middle text-center" scope="col"><%=issue.student.getLastName()%></td>
                    <td style="width:130px;" class="align-middle text-center" scope="col"><%=issue.getIssueDate()%></td>
                    <td style="width:130px;" class="align-middle text-center" scope="col"><%=issue.getReturnDate()%></td>
                </tr>
                </tbody> 
                <%
                            }
                        }
                    }
                %>
            </table>
        </form>
    </body>
</html>