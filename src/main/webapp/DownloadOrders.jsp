<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="hotel.com.dbconnection" %>
<%
    response.setContentType("text/csv");
    response.setHeader("Content-Disposition", "attachment; filename=orders.csv");

    Connection con = dbconnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM cart");
    ResultSet rs = ps.executeQuery();

    out.println("Session ID,Item ID,Quantity");
    while (rs.next()) {
        out.println(rs.getString("session_id") + "," + rs.getInt("item_id") + "," + rs.getInt("quantity"));
    }
%>
