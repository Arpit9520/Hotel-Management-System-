<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ page import="java.sql.*" %>
<%
Connection con = null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelmanagement", "root", "dishu@123"); // Set your MySQL password
} catch(Exception e) {
    out.println("Connection Error: " + e);
}
%>