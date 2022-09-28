<%-- 
    Document   : insertBook
    Created on : Sep 27, 2022, 1:14:49 AM
    Author     : Marija
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Thasadith&display=swap" rel="stylesheet">
        <link rel="shortcut icon" type="image/jpg" href="Slike/bouquet-icon-22.jpg"/>
        <link href="Styles/registracija.css" rel="stylesheet" id="bootstrap-css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Book</title>
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

        label{
            color: white;
        }
        .invalid-feedback{
            font-weight: bold;
        }
        .btn { 
            color: #ffffff;
            border-color: #ffffff; 
        } 
        .btn:hover{
            color: #BAB2B5;
            background-color: #eee2dc;     
        }
        .zoom:hover {
            transform: scale(1.75);
            z-index:10;}

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

    </style>
    <body style="font-family: 'Thasadith', sans-serif; background-image: linear-gradient(to bottom,#e1d3c1, #e1d3c1, #e1d3c1, #ffffff, #ffffff, #ffffff);" >
        <jsp:include page="navbar.jsp"/>  

        <%
            if (request.getSession().getAttribute("loggedRole") != null) {
                if (!(request.getSession().getAttribute("loggedRole").equals("1"))) {
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
        <%
            String result = (String) request.getAttribute("result");

            if (result != null)
                  if (result.equals("True")) {%>
        <script type="text/javascript">
            swal("Dobar  posao", "Nov aranžman je dodat!", "success")
                    .then(function () {
                        window.location = "index.jsp";
                    });

        </script>

        <%   } else if (result.equals("False")) {%>

        <script type="text/javascript">
            swal("Error", "Erorr", "error")
                    .then(function () {
                        window.location = "insertBook.jsp";
                    });
        </script>

        <% }%>

    <center><form action="insertBook" method="post" enctype="multipart/form-data" style="width: 550px; margin: 2% auto; opacity: 0.7; background: rgba(0,0,0,0.5); color: white;">
            <h3 style="color: white;  margin-top: 2%">Insert New Book</h3>   
            <div class="col-9" style="color:white;  margin: 2% auto">
                
                <label>Name of the Book</label>
                <input required style="background-color:white;" class="form-control" type="text" name="name">
                
                <label style="width:100px; height:20px; text-align:center">Author: </label>
                <input style="background-color:white;" class="form-control" type="text" required name="author">
                
                <label style="width:100px; height:20px; text-align:center">Genre: </label>
                <input style="background-color:white;" class="form-control" type="text" required maxlength="200" name="genre"> 
                
                <label style="width:100px; height:20px; text-align:center">Picture: </label>
                <input style="margin-left: 8%; text-align:center" class="form-control-file" type="file" required name="picture" id="profile-img">
                <img  src="" id="profile-img-tag" width="286px"/>
                
                <label style="width:100px; height:20px; text-align:center">Description: </label>
                <input style="background-color:white;" class="form-control" type="text" name="description" required>
                <br>
                
                <label style="width:100px; height:20px; text-align:center">Quantity:</label>
                <input style="background-color:white;" class="form-control" type="text" name="quantity" required>
                <br>
                <center><input style="width: 60%;height: 50%;" class ="btn-btn primary" type="submit" value="Insert"></center>
                <br>
            </div> 
        </form>
        <br><br>
    </center>

    <script>
        var form = document.querySelector('.needs-validation');
        form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        });
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#profile-img-tag').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        $("#profile-img").change(function () {
            readURL(this);
        });
    </script>
</body>
</html>