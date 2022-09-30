<%-- 
    Document   : studentList
    Created on : Sep 27, 2022, 1:39:50 AM
    Author     : Marija
--%>
<%@page import="Models.Student"%>
<%@page import="RepoPattern.StudentRepo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Students</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Thasadith&display=swap" rel="stylesheet">
        <link rel="shortcut icon" type="image/jpg" href="Slike/bouquet-icon-22.jpg"/>
        <link href="Styles/registracija.css" rel="stylesheet" id="bootstrap-css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   </head>
    <style>
        label{
            color: #AC3B61;
        }
        #Tabela_info{
            color: #AC3B61;
        }
        #Tabela tbody tr{
            background: #EDC7B7;
            color: #123C69;
        }
        #Tabela tbody tr:hover{
            background: #123C69;
            color:#EDC7B7;

        }
        .table-hover thead tr{
            color: #AC3B61;
        }
        #Tabela label{
            color: #AC3B61;

        }
        .fa-trash-alt{
            color: red;
        }
        .fa-trash-alt:hover{
            color: #cc0000;
        }
        .background-image {
            position: fixed;
            background-image: linear-gradient(to bottom,#e1d3c1, #e1d3c1,#ffffff, #ffffff, #ffffff, #ffffff);
            background-repeat: no-repeat;
            background-size: cover;
            width: 100%;
            height: 100%;
            z-index: -1;
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
    <body style="font-family: 'Thasadith', sans-serif; color:white;background-image: linear-gradient(to bottom,#e1d3c1, #e1d3c1, #e1d3c1, #ffffff, #ffffff, #ffffff);">
        <%@ include file="navbar.jsp" %> 
        <%
            String result = (String) request.getAttribute("result");

            if (result != null)
                 if (result.equals("True")) {%>
        <script type="text/javascript">
            swal("Deleted!", "Successfuly", "success")
                    .then(function () {
                        window.location = "studentList.jsp";
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
        <%
            if (request.getSession().getAttribute("loggedRole") != null) {
                if (!request.getSession().getAttribute("loggedRole").equals("1")) {
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
        <div style="opacity: 0.7; background: rgba(0,0,0,0.5); width:1500px;height:400px; color: white">
            <h2 style=" margin-bottom: 1%; margin-left: 15%; margin-top: 1%;" align="center">Students</h2>       
            <div align="center" style="color: white;">
                <table align="center" class="responsive-table" style="background: rgba(0,0,0,0.3); width:1400px;height:300px; font-size: 19px;">       
                    <tr style="color: white;">
                        <td style="width:130px;" class="align-middle text-center" scope="col"> </td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Name </td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Last Name</td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Username</td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Email</td>
                        <td style="width:130px;" class="align-middle text-center" scope="col">Phone Number</td>
                    </tr>
                    <tbody>
                        <%
                            int i = 1;
                            for (Student student : new StudentRepo().list())
                                {%>
                        <tr style="color: white; margin-bottom: 15%;">
                            <td style="width:130px;" class="align-middle text-center"><%= i++%></td>
                            <td style="width:130px;" class="align-middle text-center"><%=student.getFirstName()%></td>
                            <td style="width:130px;" class="align-middle text-center"><%=student.getLastName()%></td>
                            <td style="width:130px;" class="align-middle text-center"><%=student.getUsername()%></td>
                            <td style="width:130px;" class="align-middle text-center"><%=student.getEmail()%></td>
                            <td style="width:130px;" class="align-middle text-center"><%=student.getPhoneNumber().replace("-", " ")%></td> 
                  
                            <td style="width:130px;" class="align-middle text-center"> 
                        <a href="${pageContext.request.contextPath}/DeleteStudent?studentId=<%=student.getStudentId()%>">
                            <i style="color: red; font-size: larger; border-width: thin;" class="fa fa-trash-alt">Remove</i>                                  
                        </a>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                    
            </div>
        </div>
                     </form>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#Tabela').DataTable();
            });
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    </body>
</html>