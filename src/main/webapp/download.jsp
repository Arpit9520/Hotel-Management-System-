<%@ page language="java" contentType="text/csv; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<%@ page import="hotel.com.dbconnection" %>

<%
response.setHeader("Content-Disposition", "attachment; filename=booking_list.csv");
response.setContentType("text/csv");

try (
    Connection con = dbconnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM bookings");
    ResultSet rs = ps.executeQuery();
    PrintWriter writer = response.getWriter();
) {
    // Write CSV header
    writer.println("Name,Email,Phone Number,Check-in Date,Check-out Date,Guests,Room");

    // Write data rows
    while (rs.next()) {
        writer.println(
            rs.getString(1) + "," +
            rs.getString(2) + "," +
            rs.getString(3) + "," +
            rs.getString(4) + "," +
            rs.getString(5) + "," +
            rs.getString(6) + "," +
            rs.getString(7)
        );
    }

} catch (Exception e) {
    e.printStackTrace();
}
%>
