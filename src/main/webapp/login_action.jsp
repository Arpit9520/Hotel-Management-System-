<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="hotel.com.dbconnection" %>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

String username = request.getParameter("username");
String password = request.getParameter("password");

try {
    con = dbconnection.getConnection(); // Ensure this method returns a valid Connection object

    ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
    ps.setString(1, username);
    ps.setString(2, password);
    rs = ps.executeQuery();

    if(rs.next()) {
        session.setAttribute("userid", rs.getInt("id"));
        session.setAttribute("username", username);
        response.sendRedirect("Food_menu.jsp");
    } else {
        out.println("<h3>Invalid credentials. <a href='login.jsp'>Try again</a>.</h3>");
    }

} catch(Exception e) {
    out.println("<h3>Error: " + e.getMessage() + "</h3>");
    e.printStackTrace();
} finally {
    try { if(rs != null) rs.close(); } catch(Exception e) {}
    try { if(ps != null) ps.close(); } catch(Exception e) {}
    try { if(con != null) con.close(); } catch(Exception e) {}
}
%>
