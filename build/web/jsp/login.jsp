<%-- 
    Document   : login.jsp
    Created on : 11-Dec-2024, 10:57:09 am
    Author     : bala
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                        <a class="nav-link" href="jsp/admin.jsp">Admin</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../login.html">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
       <%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = request.getParameter("role");

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/xpdb", "root", "");

        String query = "SELECT * FROM users WHERE email=? AND password=? AND role=?";
        pst = con.prepareStatement(query);
        pst.setString(1, email);
        pst.setString(2, password);
        pst.setString(3, role);
        rs = pst.executeQuery();

        if (rs.next()) {
            
            if(role.equals("interviewee")){
            response.sendRedirect("interviewee.jsp");
            }
            else{
            response.sendRedirect("hr.jsp");
            }
        } else {
            response.sendRedirect("../error.html");
        }
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        if (rs != null) rs.close();
        if (pst != null) pst.close();
        if (con != null) con.close();
    }
%>

    </body>
</html>
