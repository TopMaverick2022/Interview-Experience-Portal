<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Microsoft Interviewee Page</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

       .container {
            display: flex;
            flex-wrap: wrap;
            width:100%;
            padding: 10px;
            
        }

        .card {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin: 15px;
            padding: 20px;
            width: 1500px;
            transition: transform 0.2s;
        }


        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            margin-top: 0;
            color: #0056b3;
        }

        .card p {
            margin: 10px 0;
            line-height: 1.6;
        }
    </style>
</head>
<body>
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">Dear Hr/Interviewee You can also share your experiences by Logging in </a>
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
                        <a class="nav-link" href="../jsp/admin.jsp">Admin</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/xpdb", "root", "");
                Statement s = c.createStatement();
                ResultSet rs = s.executeQuery("SELECT name, companyname, interview_date, description FROM interviewee WHERE companyname = 'Microsoft'");

                while (rs.next()) {
        %>
                    <div class="card">
                        <h3><strong>Interviewee Name:</strong> : <%= rs.getString(1) %></h3>
                        <p><strong>Company</strong> <%= rs.getString(2) %></p>
                        <p><strong>Interview Date</strong> <%= rs.getString(3) %></p>
                        <p><strong>Experience</strong> <%= rs.getString(4) %></p>
                    </div>
        <%
                }
                c.close();
            } catch (ClassNotFoundException e) {
                out.println("<p style='color: red;'>Error: Driver not found.</p>");
            } catch (SQLException e) {
                out.println("<p style='color: red;'>Database error: " + e.getMessage() + "</p>");
            } catch (Exception e) {
                out.println("<p style='color: red;'>Unexpected error: " + e.getMessage() + "</p>");
            }
        %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
