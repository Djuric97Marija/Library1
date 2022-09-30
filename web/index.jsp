<%-- 
    Document   : index
    Created on : Sep 17, 2022, 1:18:26 PM
    Author     : Marija
--%>

<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.util.*"%>
<%@page import="java.util.ArrayList"%>

<html lang="sr">
    <head>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Thasadith&display=swap" rel="stylesheet">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Library</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Crimson+Text:300,400,700|Rubik:300,400,700,900" rel="stylesheet">
        <link rel="stylesheet" href="Styles/atlantis/atlantis/css/styles-merged.css">
        <link rel="stylesheet" href="Styles/atlantis/atlantis/css/style.min.css">
        <meta name="description" content="Free Bootstrap Theme by uicookies.com">
        <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
        <link rel="shortcut icon" type="image/jpg" href="pictures/icon.png"/>
        <script src="Styles/atlantis/atlantis/js/vendor/html5shiv.min.js"></script>
        <script src="Styles/atlantis/atlantis/js/vendor/respond.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <style> 
        #poruka{
            text-align: center;
            margin-top: 50px;
            color: #000;
        }
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
    </style>
    <style type="text/css">
        #container { width: 500px;}

        #image {width: 170%; opacity: 90%; }

        #text { text-align: justify; align-content: center;  margin-left: 15%; }    

        .zoom {
            padding: 50px;
            transition: transform .6s; 
            width:  120%;
            opacity: 800%;
        }
        .background-image {
            position: fixed;
            background-repeat: no-repeat;
            background-image: linear-gradient(to bottom,#e1d3c1, #e1d3c1,#ffffff, #ffffff, #ffffff, #ffffff);
        }
        .zoom:hover {
            transform: scale(1.2);
            opacity: 100%;
        }
        footer {
            text-align: center;
            padding: 3px;
            background-color: #4e555b;
            color: white;
        }
    </style>
    <body style="font-family: 'Thasadith', sans-serif;">
        <a id="top"></a>
        <%@ include file="navbar.jsp" %> 
        <section class="probootstrap-slider flexslider">
            <ul class="slides">
                <li style="background-image: url(pictures/book1.jpeg)" class="overlay">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-10 col-md-offset-1">
                                <div class="probootstrap-slider-text text-center">
                                    <h1 class="probootstrap-heading probootstrap-animate">WELCOME!</h1>
                                    <div class="probootstrap-animate probootstrap-sub-wrap">Library</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li style="background-image: url(pictures/photo.jpeg)" class="overlay">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-10 col-md-offset-1">
                                <div class="probootstrap-slider-text text-center">
                                    <h1 class="probootstrap-heading probootstrap-animate">Best Books!</h1>
                                    <div class="probootstrap-animate probootstrap-sub-wrap">Create reservation online!</div>
                                </div>
                            </div>
                        </div>
                    </div>          
                </li>
            </ul>
        </section>
        <br>
        <br> <br> <br> <br>
        <section style="margin-left: 15%;">
            <br>
            <div  class="zoom" id="container">
                <a style="color: #939393; margin-left: 15%; font:initial; font-size: x-large; text-decoration: none;"  href="allBooks.jsp"> 
                    <img id="image" border="1" alt="Slika" src="pictures/book2.jpeg">
                    <br>  <br>  <p id="text">Books</p> </a> 
            </div>
            <br>
            <div class="zoom" id="container">
                <a style="color: #939393; margin-left: 15%; font:initial; font-size: x-large; text-decoration: none;"   href="signIn.jsp.jsp"> 
                    <img  id="image" border="1" alt="Slika" src="pictures/niceBooks.jpg">
                    <br> <br>  <p id="text">Sign In for reservations </p> </a>  
            </div>
        </section>
        <a style="margin-left: 90%; " href="#top">
            <img alt="Vrh" src="pictures/icon.png" style="float: inside;" width="100" height="100"></a> 
        <br><br>    <br><br>  

        <footer role="contentinfo" class="probootstrap-footer">
            <!-- START: footer -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <h2>Why choose us?</h2>
                    <br><br>    
                </div>
                <div class="col-md-4">
                    <div class="service left-icon left-icon-sm probootstrap-animate">
                        <div class="icon">
                            <i class="icon-check"></i>
                        </div>
                        <div class="text">
                            <h3>Over 1000 books in one place!</h3>
                            <p class="mt40"><p>All books that you can think off</p>
                            <p><a href="index.jsp" class="link-with-icon">More <i class=" icon-chevron-right"></i></a></p>
                        </div>  
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service left-icon left-icon-sm probootstrap-animate">
                        <div class="icon">
                            <i class="icon-check"></i>
                        </div>
                        <div class="text">
                            <h3>How to Reserve</h3>
                            <p class="mt40"> Explain how to reserve  
                            </p> <p><a href="index.jsp" class="link-with-icon">More<i class=" icon-chevron-right"></i></a></p>
                        </div>  
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service left-icon left-icon-sm probootstrap-animate">
                        <div class="icon">
                            <i class="icon-check"></i>
                        </div>
                        <div class="text">
                            <h3>Books</h3>
                            <p class="mt40">About Books <p><a href="index.jsp" class="link-with-icon">More <i class=" icon-chevron-right"></i></a></p>
                        </div>  
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="container">
        <div class="row mt40">
            <div class="col-md-12 text-center">
                <ul class="probootstrap-footer-social">
                    <li"><a style="color: white;" href=""><i class="icon-twitter"></i></a></li>
                    <li"><a style="color: white;" href=""><i class="icon-facebook"></i></a></li>
                    <li"><a style="color: white;" href=""><i class="icon-instagram2"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<!-- END: footer -->

<%            String Name = (String) request.getSession().getAttribute("logged");
    if (request.getAttribute("firstLogin") != null)
        if (request.getAttribute("firstLogin").equals("True")) {%>
<script type="text/javascript">
            swal("Welcome  <%=Name%>!", "Succes! ", "success")
                    .then(function () {
                        window.location = "index.jsp";
                    });

</script>
<%   }
    if (request.getAttribute("firstLogin") != null)
        if (request.getAttribute("firstLogin").equals("False")) {%>
<script type="text/javascript">
    swal("Error!", "Podaci su netačni! ", "error")
            .then(function () {
                window.location = "index.jsp";
            });
    $(window).on('load', function () {
        $('#exampleModal').modal('show');
    });
</script>
<%}
%>
<script src="Styles/atlantis/atlantis/js/scripts.min.js"></script>
<script src="Styles/atlantis/atlantis/js/main.min.js"></script>
<script src="Styles/atlantis/atlantis/js/custom.js"></script>
<script>
    window.scrollTo(x - value, y - value);
</script>
</body>
</html>