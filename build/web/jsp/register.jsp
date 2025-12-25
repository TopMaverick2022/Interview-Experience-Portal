<%-- 
    Document   : register
    Created on : 11-Dec-2024, 7:18:55 pm
    Author     : bala
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register User</title>
    
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .register-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        .register-card h4 {
            font-weight: bold;
            margin-bottom: 20px;
            color: #343a40;
        }
        .btn-success {
            background-color: #28a745;
            border: none;
        }
        .btn-success:hover {
            background-color: #218838;
        }
        label {
            font-weight: 600;
        }
        input:focus, select:focus {
            box-shadow: 0 0 5px rgba(40, 167, 69, 0.5);
            border-color: #28a745;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">WELCOME TO THE JOB INTERVIEW EXPERIENCE PORTAL </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../login.html">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="jsp/admin.jsp">Admin</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="register-card">
                    <h4 class="text-center">Register</h4>
                    <form  method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="mb-3">
                            <label for="role" class="form-label">Role</label>
                            <select class="form-control" id="role" name="role" required>
                                <option value="interviewee">Interviewee</option>
                                <option value="hr">HR</option>
                            </select>
                        </div>
                        <button class="btn btn-success w-100">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
   

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = request.getParameter("role");

    Connection con = null;
    PreparedStatement pst = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/xpdb", "root", "");

        String query = "INSERT INTO users(name, email, password, role) VALUES (?, ?, ?, ?)";
        pst = con.prepareStatement(query);
        pst.setString(1, name);
        pst.setString(2, email);
        pst.setString(3, password);
        pst.setString(4, role);
        pst.executeUpdate();
        response.sendRedirect("../login.html");
        
    } catch (Exception e) {
        
    } finally {
        if (pst != null) pst.close();
        if (con != null) con.close();
    }
%>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
