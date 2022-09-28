<%-- 
    Document   : pictureBook
    Created on : Sep 26, 2022, 12:42:02 PM
    Author     : Marija
--%>

<%@page import="RepoPattern.bookRepo"%>
<%new bookRepo().picture(request, response, request.getParameter("bookId")); %>