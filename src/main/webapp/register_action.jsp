<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="hotel.com.dbconnection" %>

<%
Connection con = null;
PreparedStatement checkUser = null;
PreparedStatement ps = null;
ResultSet rs = null;

String username = request.getParameter("username");
String password = request.getParameter("password");

try {
    con = dbconnection.getConnection(); // Replace with your actual method to get DB connection

    // Check if user already exists
    checkUser = con.prepareStatement("SELECT * FROM users WHERE username = ?");
    checkUser.setString(1, username);
    rs = checkUser.executeQuery();

    if(rs.next()) {
        out.println("<h3>User already exists. Please <a href='login.jsp'>login here</a>.</h3>");
    } else {
        ps = con.prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)");
        ps.setString(1, username);
        ps.setString(2, password); // Consider hashing in production
        int i = ps.executeUpdate();
        if(i > 0) {
            out.println("<h3>Registration successful! <a href='login.jsp'>Login here</a>.</h3>");
        } else {
            out.println("<h3>Registration failed. Try again.</h3>");
        }
    }
} catch(Exception e) {
    out.println("<h3>Error: " + e.getMessage() + "</h3>");
    e.printStackTrace();
} finally {
    try { if(rs != null) rs.close(); } catch(Exception e) {}
    try { if(checkUser != null) checkUser.close(); } catch(Exception e) {}
    try { if(ps != null) ps.close(); } catch(Exception e) {}
    try { if(con != null) con.close(); } catch(Exception e) {}
}
%>
