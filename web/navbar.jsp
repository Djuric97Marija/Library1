<%-- 
    Document   : navbar
    Created on : Sep 17, 2022, 3:05:51 PM
    Author     : Marija
--%>

<%@page import="RepoPattern.studentRepo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="sr">
    <head>
        <title>Library</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Thasadith&display=swap" rel="stylesheet">
        <link rel="shortcut icon" type="image/jpg" href="Slike/bouquet-icon-22.jpg"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <script src="jQuery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"> 
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.1.0/css/all.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.1.0/css/all.css">
        <meta http-equiv="X-UA-Copatible" content="ie-etge; ">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Free Bootstrap Theme by uicookies.com">
        <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
        <script src="Styles/atlantis/atlantis/js/vendor/html5shiv.min.js"></script>
        <script src="Styles/atlantis/atlantis/js/vendor/respond.min.js"></script>     
    </head>
    <style>

        .logo{
            color: #faebd7;
            border: 55px black;
            text-transform: uppercase;
            letter-spacing: 5px;
            font-size: 20px;
        }
        .logo a{
            text-decoration: none;
        }
        *{
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
        }
        nav{
            display: flex;
            justify-content:center;
            align-items: center;
            min-height: 8vh;
            font-family: 'Thasadith', sans-serif;
            height:130px;
        }
        .navbar-nav{
            display: flex;
            justify-content:center;
            width: auto;
            letter-spacing: 5px;

        }
        .navbar-nav li{
            list-style: none;
        }

        .navbar-nav a{
            letter-spacing: 3px;
            font-weight: bold;
            font-size: 14px;
            font-style: oblique;
        }

        .dropdown-menu{
            display: list-item;
            cursor: pointer;
            transition-delay: 3s;
        }
        .dropdown-menu div{
            width: 25px;
            height: 3px; 
            background-color: #faebd7;
            margin: 5px;
        }
        .nav-item a{
            align-items: center;
            color: #eee;
        }
        .navbar-nav a:hover {
            color: black;
            border-radius: 10px;
        }
        .background-image {
            position: fixed;
            background-repeat: no-repeat;
            background-size: cover;
            width: 100%;
            height: 100%;
            z-index: -1;
        } 
        ul {
            padding: 0;
            list-style: none;
        }
        ul li {
            display: inline-block;
            position: relative;
            line-height: 21px;
            text-align: left;
        }
        ul li a {
            display: block;
            padding: 8px 25px;
            color: #333;
            text-decoration: none;
        }
        ul li a:hover {
            color: #fff;
            background: #939393;
        }
        ul li ul.dropdown {
            min-width: 100%; /* Set width of the dropdown */
            background: #e1d3c1;
            display: none;
            position: absolute;
            z-index: 999;
            left: 0;
        }
        ul li:hover ul.dropdown {
            display: block; /* Display the dropdown */
        }
        ul li ul.dropdown li {
            display: block;
        }    </style>
    <body style="font-family: 'Thasadith', sans-serif;"> 
        <div class="background-image"></div>
        <%
            Boolean pom = false;
            if (request.getSession().getAttribute("logged") != null) {
                pom = true;
            }
        %> 
        <nav style="background-color:#e1d3c1;width: auto; color: whitesmoke; justify-content:center; font-size: x-large; margin-bottom:-4%; margin-top: -2%;" class="navbar navbar-expand-lg navbar-dark">
            <ul style="list-style-type: none;">
                <li class="nav-item" > 
                    <a style="background-color:#e1d3c1;" class="nav-link" href="allBooks.jsp">All Books</a>
                </li>
                <li class="nav-item">
                    <a style="background-color:#e1d3c1;" class="nav-link" href="index.jsp"> About Library <span class="sr-only">(current)</span></a>
                </li>
                <%
                    if (!pom) {%>
                <li class="nav-item"><a  style="background-color:#e1d3c1;"class="nav-link" href="" data-toggle="modal" data-target="#exampleModal" >Login</a></li>

                <li class="nav-item"><a style="background-color:#e1d3c1;" class="nav-link" href="signIn.jsp">Sign in</a></li>    
                    <% } else {%>
                <li class="nav-item"><a style="background-color:#e1d3c1;" class="nav-link" href="Logout">Logout</a></li>
                    <%   }     %>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel" style="color: #939393;">Login</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="Login" method="post">
                                <div class="modal-body">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon1" for="validationServer03">Username: </span>
                                        </div>
                                        <input required name="username" type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon1">Password: </span>
                                        </div>
                                        <input id="myInput" required name="password" type="Password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1"><br>
                                        <%
                                            String loginError = "" + request.getAttribute("firstLogin");
                                            if (loginError != null)
                                                if (loginError.equals("False")) {%>
                                        <div class="invalid-feedback">
                                            Error
                                            <%}
                                            %> 
                                        </div>
                                        <span class="input-group-text" id="basic-addon1"><input type="checkbox" onclick="myFunction()"> - Show password</span>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">Login</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--this is the end for login-->
                <%if (pom) {%>
                <%
                    String loggedRole = "";
                    if (request.getSession().getAttribute("loggedRole") != null) {
                        loggedRole = "" + request.getSession().getAttribute("loggedRole");
                    }
                    if ((request.getSession().getAttribute("logged")) != null) {%>
                <li class="nav-item">
                    <a class="nav-link" style="background-color:#e1d3c1;" href="${pageContext.request.contextPath}/profile.jsp?studentId=<%=new studentRepo().selectByUsername("" + request.getSession().getAttribute("logged")).getStudentId()%>">My Profile</a>          
                </li> 
                <li class="nav-item"><a  style="background-color:#e1d3c1;"class="nav-link" href="issues.jsp" data-target="#exampleModal" >Check Reservations</a></li>

                <%}
                    if (loggedRole.equals("1")) {
                %>
                <li class="nav-item"><a  style="font-size: x-large; background-color: #e1d3c1;"  href="insertBook.jsp">Insert New Book</a></li>
                <li class="nav-item"><a  style="font-size: x-large; background-color: #e1d3c1;"  href="studentList.jsp">Students</a>
                    <%
                        }
                    %>

                    <%
                        if (loggedRole.equals("2")) {
                    %> 
                    <a style="margin-top:-1%; background-color:#e1d3c1; list-style: none; color: #eee; text-decoration: none;" href="index.jsp">
                        <img style="color: #155724;" alt="Cart" src="pictures/icon.png" width="auto" height="35"> <span class="sr-only">(current)</span></a>    
                        <%  }
                            }
                            if (!pom) { %>
                <li style="background-color:#e1d3c1;">
                    <a style="background-color:#e1d3c1; color: #eee; text-decoration: none;" href="index.jsp">
                        <img style="color: #155724;" alt="Cart" src="pictures/icon.png" width="auto" height="35"><span class="sr-only">(current)</span></a>    
                </li>
                <% }%>
            </ul>
        </nav>
        <nav style="background-color:#e1d3c1;" class="navbar navbar-expand-lg navbar-dark">
            <div style="background-color:#e1d3c1; margin-left: 600px;" class="logo">
                <a href="index.jsp"><h1 style="color: #eee;"> Library</h1></a>
            </div>
        </nav>
        <main>
            <div class="background"></div>
            <div class="foreground"></div>
        </main>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
                                        function myFunction() {
                                            var x = document.getElementById("myInput");
                                            if (x.type === "password") {
                                                x.type = "text";
                                            } else {
                                                x.type = "password";
                                            }
                                        }
        </script>
    </body>
</html>

