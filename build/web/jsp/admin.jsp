<%-- 
    Document   : admin
    Created on : 13-Dec-2024, 11:17:18 am
    Author     : bala
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Basic styling for the form */
           .frm{
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                justify-content: center;
                align-items: center;

                margin-top:190px;
                margin-left:650px;
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 300px;
                text-align: center;
      
            }
           
            input {
                width: 85%;
                padding-bottom:7px;
                padding-left:7px;
                padding-right: 7px;
                padding-top:7px;
                margin-right:15px;
                margin-bottom: 20px;
                margin-top:20px;
                margin-left:10px; 
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            button {
                background: #007BFF;
                color: #fff;
                border: none;
                padding: 10px 15px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }
            button:hover {
                background: #0056b3;
            }

            /* Popup modal styling */
            .popup {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
            }
            .popup-content {
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 300px;
            }
            .popup-content h3 {
                margin: 0 0 15px;
                color: #d9534f;
            }
            .popup-content button {
                background: #d9534f;
                color: #fff;
                border: none;
                padding: 10px 15px;
                border-radius: 4px;
                cursor: pointer;
            }
            .popup-content button:hover {
                background: #c9302c;
            }
        </style>
        <script>
            // Function to show the popup
            function showErrorPopup() {
                document.getElementById('errorPopup').style.display = 'flex';
            }

            // Function to hide the popup
            function closePopup() {
                document.getElementById('errorPopup').style.display = 'none';
            }
        </script>
    </head>
    <body >
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">WELCOME TO THE JOB INTERVIEW EXPERIENCE PORTAL </a>
            
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../index.html">Home</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="jsp/admin.jsp">Admin</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../index.html">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
       
        <form  class="frm" method="post">
            <table>Enter UserId: <input id="uname" name="username" required />
                Enter Password:<input id="pwd" type="password" name="password" required /><br>
            <button id="btn" type="submit">Login</button></table> 
        </form>

        <!-- Popup Modal -->
        <div id="errorPopup" class="popup">
            <div class="popup-content">
                <h3>Invalid username or password</h3>
                <button onclick="closePopup()">Close</button>
            </div>
        </div>

        <%
            String name = request.getParameter("username");
            String pwd = request.getParameter("password");

            if (name != null && pwd != null) {
                if (name.equals("admin") && pwd.equals("pass123")) {
                    response.sendRedirect("adminpage.jsp");
                } else {
        %>
                    <script>
                        showErrorPopup();
                    </script>
        <%
                }
            }
        %>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

