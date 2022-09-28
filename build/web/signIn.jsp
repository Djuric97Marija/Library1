<%-- 
    Document   : signIn
    Created on : Sep 17, 2022, 7:57:40 PM
    Author     : Marija
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="sr">  
    <head>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Thasadith&display=swap" rel="stylesheet">    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/jpg" href="pictures/icon.png"/>
        <title>Sign In</title>
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
            label{
                color: #AC3B61;
                font-weight: bold;
            }
            .vl {
                border-left: 2px solid grey}

            .zoom:hover {
                transform: scale(1.75);
                z-index:10;}

            .background-image {
                position: fixed;
                background-repeat: no-repeat;
                background-image: linear-gradient(to bottom,#e1d3c1, #e1d3c1,#e1d3c1, #ffffff, #ffffff, #ffffff);
                background-size: cover;
                width: 100%;
                height: 100%;
                z-index: -1;
            }
            #lista {
                background: #AC3B61;
            }
            #lista:hover {
                background: #AC3B61;
            }
            .button-m {

                background-color: #e1d3c1;
                border:#e1d3c1;
                transition-duration: 0.4s;
            }
            .button-m:hover {
                background-color: #AC3B61;  
                color: white;
            }
        </style>
    </head>
    <body style="font-family: 'Thasadith', sans-serif;"> 
        <%@include file="navbar.jsp" %>
        <%    
            HttpSession session2 = request.getSession();

            if (session2.getAttribute("logged") != null) {
                response.sendRedirect("index.jsp");
            }
        %>

        <%
            String rezultat = (String) request.getAttribute("result");

            if (rezultat != null)
                if (rezultat.equals("True")) {%>
        <script type="text/javascript">
            swal("Welcome", "Signed in!", "success")
                    .then(function () {
                        window.location = "index.jsp";
                    });

        </script>

        <%   } else if (rezultat.equals("False")) {%>

        <script type="text/javascript">
            swal("Error", "error")
                    .then(function () {
                        window.location = "signIn.jsp";
                    });
        </script>

        <% }%>

    <center>
        <form action="SignIn" style="padding: 9px; margin-bottom: 1%; background-color: #AC3B61; margin-left: -7%; margin-top: -1%; opacity: 0.7; width: 24rem; background: rgba(0,0,0,0.5); color: white">
            <h2>Sign in</h2>
            <table>
                <tr>
                    <td style="margin: 10px; padding: 10px;"> Username:</td>
                    <td style="margin: 10px; padding: 10px;"><input oninvalid="this.setCustomValidity('Have to fill in input!')" class="form-control" required minLength="5" maxLength="19" type="text" name="username"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 10px;"> Password:</td>
                    <td style="margin: 10px; padding: 10px;"><input oninvalid="this.setCustomValidity('Have to fill in input!')" class="form-control" required minLength="4" maxLength="19"  type="password" type="text" name="pass"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 10px;">First Name:</td>
                    <td style="margin: 10px; padding: 10px;"><input oninvalid="this.setCustomValidity('Have to fill in input!)" class="form-control" required minLength="2" maxLength="19"  type="text" name="firstName"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 10px;">Last Name:</td>
                    <td style="margin: 10px; padding: 10px;"><input oninvalid="this.setCustomValidity('Have to fill in input!')" class="form-control" required minLength="3" maxLength="19"  type="text" name="lastName"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 10px;">Email:</td>
                    <td style="margin: 10px; padding: 10px;"><input  oninvalid="this.setCustomValidity('Have to fill in input!')" class="form-control" required minLength="8" maxLength="19" type="text" name="email"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 10px;">Phone Number:</td>
                    <td style="margin: 10px; padding: 10px;"><input oninvalid="this.setCustomValidity('Have to fill in input!')" class="form-control" required minLength="6"  maxLength="19" type="text" name="phoneNumber"></td>
                </tr>
            </table><br>
            <input class ="button-m" type="submit" style=" height:3rem;  width: 13rem; border: 1px; margin-bottom: 1rem;" value="Sign in" class="btn btn-success" >
        </form>
    </center>
</body>
</html>