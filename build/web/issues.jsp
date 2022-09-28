<%-- 
    Document   : issues
    Created on : Sep 26, 2022, 11:42:47 PM
    Author     : Marija
--%>

<%@page import="RepoPattern.issueRepo"%>
<%@page import="Models.Issue"%>
<%@page import="RepoPattern.studentRepo"%>
<%@page import="Models.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
    <head>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Thasadith&display=swap" rel="stylesheet">
        <link rel="shortcut icon" type="image/jpg" href="pictures/icon.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Issues</title> 
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
            String result = (String) request.getAttribute("result2");

            if (result != null)
                if (result.equals("True")) {%>
        <script type="text/javascript">
            swal("Reservation", "Success!", "success")
                    .then(function () {
                        window.location = "issues.jsp";
                     });

        </script>
        <%   } else if (result.equals("False")) {%>
        <script type="text/javascript">
            swal("Greška", "Uneli ste postojeće podatke", "error")
                    .then(function () {
                        window.location = "index.jsp";
                    });
        </script>
      

        <% }
            String loggedRole = "";
            if (request.getSession().getAttribute("loggedRole") != null) {
                loggedRole = "" + (request.getSession().getAttribute("loggedRole"));
            }
            String Id = request.getParameter("studentId");
            Student student = new studentRepo().select(Id);
        %>
        <form style="margin-left: 10%; margin-top: 2%; margin-bottom: 10%; opacity: 0.7; width: 70rem; background: rgba(0,0,0,0.7); color: white">

            <h2 align="center" style="padding:2%;">My Reservations</h2>
            <input value="<%=request.getParameter("studentId")%>" name="studentId" type="hidden">  
            <% if (loggedRole.equals("2")) {%>
            <table style="width: 100%; margin-bottom: 6%;">
                <tbody style="opacity: 0.7;margin-bottom: 6%; background: rgba(0,0,0,0.5); color: white"> 
                <thead style="font-size: x-large; font: bold;">  
                    <tr>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Book Name</td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Author</td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">First Name</td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Last Name</td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Issue Date</td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Return Date</td>
                    </tr>
                </thead>
                <%
                    Student stud = new studentRepo().selectByUsername((String) request.getSession().getAttribute("logged"));
                    for (Issue issue : new issueRepo().listActiveIssue()) {
                        if (stud.getStudentId() == issue.getStudentId()) {
                %>
                <tr>
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
            <br><br>
            <% if (loggedRole.equals("1")) {
            %>
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
                    for (Issue issue : new issueRepo().listAllIssue()) {

                %>
                <tr>
                    <td style="width:130px;" class="align-middle text-center" scope="col"><%=issue.getIssueId()%></td>
                    <td style="width:130px;" class="align-middle text-center" scope="col"><%=issue.book.getName()%></td>
                    <td style="width:130px;" class="align-middle text-center" scope="col"><%=issue.book.getAuthor()%></td>
                    <td style="width:130px;" class="align-middle text-center" scope="col"><%=issue.student.getFirstName()%></td>
                    <td style="width:130px;" class="align-middle text-center" scope="col"><%=issue.student.getLastName()%></td>
                    <td style="width:130px;" class="align-middle text-center" scope="col"><%=issue.getIssueDate()%></td>
                    <td style="width:130px;" class="align-middle text-center" scope="col"><%=issue.getReturnDate()%></td>
                    <td style="width:130px;" class="align-middle text-center"> 
                        <a href="${pageContext.request.contextPath}/deleteIssue?issueId=<%=issue.getIssueId()%>">
                            <i style="color: red; font-size: larger; border-width: thin;" class="fa fa-trash-alt">Returned</i>                                  
                        </a>
                    </td>
                </tr>
                </tbody>
                <% }
                    }
                %>
                
            </table>
                <br><br>
        </form>
    </body>
</html>