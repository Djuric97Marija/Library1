<%-- 
    Document   : allBooks
    Created on : Sep 26, 2022, 12:26:16 PM
    Author     : Marija
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="RepoPattern.BookRepo"%>
<%@page import="Models.Book"%>
<!DOCTYPE html>
<html lang="sr">
    <head>
        <link rel="shortcut icon" type="image/jpg" href="pictures/icon.png"/>   
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Thasadith&display=swap" rel="stylesheet">
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Books</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Crimson+Text:300,400,700|Rubik:300,400,700,900" rel="stylesheet">
        <link rel="stylesheet" href="Styles/atlantis/atlantis/css/styles-merged.css">
        <link rel="stylesheet" href="Styles/atlantis/atlantis/css/style.min.css">
        <meta name="description" content="Free Bootstrap Theme by uicookies.com">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <script src="jQuery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"> 
        <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
        <script src="Styles/atlantis/atlantis/js/vendor/html5shiv.min.js"></script>
        <script src="Styles/atlantis/atlantis/js/vendor/respond.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 

    </head>
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

        .crop {
            height: 500px;
            width: 400px;
            overflow: hidden;
        }
        .crop img {
            height: 500px;
            width: 300px;
        }

        .zoom {
            transition: transform .9s; 
            opacity: 90%;
        }
        .zoom:hover {
            transform: scale(1.5);
            opacity: 100%;
            margin-bottom: 1px;
            margin-right: 5px;
        }
        footer {
            text-align: center;
            padding: 3px;
            background-color: #4e555b;
            color: white;
        }

    </style>
    <body style="font-family: 'Thasadith', sans-serif;">
        <%@include file="navbar.jsp" %> 
        <%
            String result = (String) request.getAttribute("result");
            if (result != null)
                 if (result.equals("True")) {%>
        <script type="text/javascript">
            swal("Reservation", "Success!", "success")
                    .then(function () {
                        window.location = "allBooks.jsp";
                    });
        </script>
        <%   } else if (result.equals("False")) {%>
        <script type="text/javascript">
            swal("Error", "Error explained", "error")
                    .then(function () {
                        window.location = "index.jsp";
                    });
        </script>
        <% }%>
        <br>
    <br>
    <%         String loggedRole = "";
        if (request.getSession().getAttribute("loggedRole") != null) {
            loggedRole = "" + (request.getSession().getAttribute("loggedRole"));
        }%>

    <ul id="myUL" class="list-unstyled">
        <%  for (Book book : new BookRepo().list()) {
                {
        %>
        <li>
            <div style=" display: inline-block; margin-left: 14%;height: 110%;" class="col-md-4 col-sm-6 col-xs-12">
                <div id="myUL" style="height: 110%; width:400px; margin-bottom:5%; margin-top: 10%;">
                    <div class="crop">
                        <img class="zoom" style="border-radius: 4px;" alt="Picture" src="pictureBook.jsp?bookId=<%=book.getBookId()%>"/> 
                    </div> 
                    <div style="width:400px; margin-left: -6%;" id="myUL" class="text">
                        <a>
                            <h5><p class="card-text" style="color: black;"><%=book.getName()%></p></h5>
                            <p style="margin-bottom:10%;">Author: <strong><%=book.getAuthor()%></strong></p>
                            <p><div><%=book.getDescription()%></div></p>
                        </a>
                    </div>

                    <br> <%  if (loggedRole.equals("2")) {%> 
                    <div>
                        <a href="${pageContext.request.contextPath}/makeIssue.jsp?bookId=<%=book.getBookId()%>" class="btn btn-secondary" >Reservation</a>
                    </div>
                    
                    <%}%>
                    
                </div>
            </div>
        </li>
        <%}
                
            }%>
    </ul>
    <a style="margin-left: 90%; " href="#top">
        <img alt="Vrh" src="pictures/icon.png" style="float: inside;" width="100" height="100"></a> 


    <script>

        window.scrollTo(x - value, y - value);

    </script>

    <script src="Styles/atlantis/atlantis/js/scripts.min.js"></script>
    <script src="Styles/atlantis/atlantis/js/main.min.js"></script>
    <script src="Styles/atlantis/atlantis/js/custom.js"></script>

</body>
</html>