<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<%@ page import="hotel.com.dbconnection" %>

<%
Connection con = null;
PreparedStatement ps = null;
try {
    con = dbconnection.getConnection(); // Ensure this method is static and returns a Connection object

    String[] items = request.getParameterValues("item");
    int userId = 1; // static user for demo/testing

    if (items != null) {
        for (String itemId : items) {
            int qty = Integer.parseInt(request.getParameter("qty_" + itemId));
            ps = con.prepareStatement("INSERT INTO cart (user_id, item_id, quantity) VALUES (?, ?, ?)");
            ps.setInt(1, userId);
            ps.setInt(2, Integer.parseInt(itemId));
            ps.setInt(3, qty);
            ps.executeUpdate();
            ps.close(); // Close after each insert to avoid connection leakage
        }
    }
    response.sendRedirect("Cart.jsp");

} catch (Exception e) {
    out.println("<h3>Error: " + e.getMessage() + "</h3>");
} finally {
    try { if (ps != null) ps.close(); } catch (Exception e) {}
    try { if (con != null) con.close(); } catch (Exception e) {}
}
%>
