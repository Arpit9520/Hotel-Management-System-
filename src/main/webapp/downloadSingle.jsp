<%@ page language="java" contentType="text/csv; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<%@ page import="hotel.com.dbconnection" %>

<%
String email = request.getParameter("email");

if (email != null && !email.trim().isEmpty()) {
    response.setHeader("Content-Disposition", "attachment; filename=booking_<%= email %>.csv");
    response.setContentType("text/csv");

    try (
        Connection con = dbconnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM bookings WHERE email = ?");
    ) {
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        PrintWriter writer = response.getWriter();

        writer.println("Name,Email,Phone Number,Check-in Date,Check-out Date,Guests,Room");

        if (rs.next()) {
            writer.println(String.format("\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\"",
                rs.getString(1), rs.getString(2), rs.getString(3),
                rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)
            ));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
} else {
    out.println("Invalid request.");
}
%>
