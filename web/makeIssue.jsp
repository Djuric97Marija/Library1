<%-- 
    Document   : makeIssue
    Created on : Sep 26, 2022, 7:31:14 PM
    Author     : Marija
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Book"%>
<%@page import="RepoPattern.IssueRepo"%>
<%@page import="Models.Issue"%>
<%@page import="java.util.ArrayList"%>
<%@page import="RepoPattern.BookRepo"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Thasadith&display=swap" rel="stylesheet">    
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Make Issue</title> 
        <link rel="shortcut icon" type="image/jpg" href="pictures/icon.png"/>
        <style>
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
                background-image: linear-gradient(to bottom,#e1d3c1, #e1d3c1,#ffffff, #ffffff, #ffffff, #ffffff);
                background-size: cover;
                width: 100%;
                height: 100%;
                z-index: -1;
            }
            #lista{
                background: #AC3B61;
            }
            #lista:hover{
                background: #AC3B61;
            }

        </style>
    </head>
    <body style="font-family: 'Thasadith', sans-serif; color:black;">
        <%@include file="navbar.jsp" %>  
        <form id="form" action="InsertIssue" method="post" style="color: #e1d3c1; margin-left: 550px; margin-right: 500px">
            <%
                String loggedRole = "";
                if (request.getSession().getAttribute("loggedRole") != null) {
                    loggedRole = "" + request.getSession().getAttribute("loggedRole");
                }
                if ((request.getSession().getAttribute("logged")) != null) {%>
            
        <%
            String id = request.getParameter("bookId");
            Book book = new BookRepo().select(id);
        %> 

        <div class="row" style="opacity: 0.8; background: rgba(0,0,0,0.5); color: white;">         
            <input value="<%=request.getParameter("bookId")%>" name="bookId" type="hidden">
            <div class="col " style="margin-top: 15px; color: white;">
                <h4 align="center" style="color: whitesmoke;">Reservation of - <%= book.getName()%></h4>
                <div class="form-group">
                    <label style="color: whitesmoke;">Name</label>
                    <input type="text" name="name" value="<%=book.getName()%>" placeholder="Name" class="form-control">
                </div>
                <div class="form-group">
                    <label style="color: whitesmoke;">Author</label>
                    <input type="text" name="author" value="<%=book.getAuthor()%>" placeholder="Author" class="form-control">
                </div>
                <div class="form-group">
                    <label style="color: whitesmoke;">Description</label>
                    <p><%= book.getDescription()%></p>
                </div>
            </div>
            <div style="margin-top:2%; margin-left: 3%; margin-bottom:2%" class="form-group">
                <img style=" margin-bottom:3%" height="400" width="350" src="pictureBook.jsp?bookId=<%=book.getBookId()%>" /> 
            </div> 
            <h2>Reservation For:</h2>
            <tr>
                <td style="padding-top:2%"></td>
                <td style="margin: 10px; padding: 10px;"><input type="date" required  class="form-control"  name="issueDate"></td>
            </tr>
            <br><br>
            <tr>
                <td style="padding-top:2%"></td>
                <td style="margin: 10px; padding: 10px;"><input type="date" required  class="form-control"  name="returnDate"></td>
            </tr>
            <br> <br>
            <input form="form" align="center" id ="button-a" type="submit" style="height:3rem; background-color: #4e555b; width: 13rem; border: 1px; margin-top: 1rem; margin-bottom: 1rem; margin-left: 1rem;" value="Make Reservation" class="btn-primary" >
        </div>

        <%  }
        %>
    </form>
</body>
</html>
