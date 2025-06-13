<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="hotel.com.dbconnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Booking List</title>

<!-- Google Fonts for stylish text -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('image/booking-bg.jpg') no-repeat center center/cover;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.container {
    background: rgba(255, 255, 255, 0.95);
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 8px 16px rgba(0,0,0,0.2);
    width: 90%;
    max-width: 1100px;
    overflow-x: auto;
}

/* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
}

table thead {
    background-color: #004080;
    color: #fff;
}

table th, table td {
    padding: 15px;
    text-align: center;
    border: 1px solid #ddd;
    font-size: 16px;
}

table tr:nth-child(even) {
    background-color: #f2f2f2;
}

table tr:hover {
    background-color: #e0f7fa;
}

/* Header */
h1 {
    text-align: center;
    margin-bottom: 20px;
    color: #004080;
    font-size: 32px;
}

/* Back Button Styling */
.back-btn {
    display: inline-block;
    margin-top: 20px;
    padding: 12px 24px;
    background-color: #004080;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-size: 18px;
    transition: background-color 0.3s ease;
    text-align: center;
}

.back-btn:hover {
    background-color: #0059b3;
}
</style>
</head>

<body>

<div class="container">
    <h1>Booking List</h1>

    <table>
        <thead>
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Phone Number</th>
        <th>Check-in Date</th>
        <th>Check-out Date</th>
        <th>Guests</th>
        <th>Room</th>
        
    </tr>
</thead>


        <tbody>
            <%
            try (
                Connection con = dbconnection.getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM bookings");
                ResultSet rs = ps.executeQuery();
            ) {
                while (rs.next()) {
            %>
            <tr>
    <td><%= rs.getString(1) %></td>
    <td><%= rs.getString(2) %></td>
    <td><%= rs.getString(3) %></td>
    <td><%= rs.getString(4) %></td>
    <td><%= rs.getString(5) %></td>
    <td><%= rs.getString(6) %></td>
    <td><%= rs.getString(7) %></td>
   
</tr>

            <%
                }
            } catch (Exception e) {
                out.print("Error: " + e.getMessage());
            }
            %>
        </tbody>
    </table>

    <!-- Go Back Button -->
    <div style="text-align: center;">
        <a href="Home.jsp" class="back-btn">Go Back</a>
    </div>
    
    

</div>

</body>
</html>
