<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="hotel.com.dbconnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f7f9fc;
            padding: 50px;
        }
        h2 {
            color: #333;
        }
        .confirmation-message {
            background-color: #28a745;
            color: white;
            padding: 20px;
            margin: 20px;
            border-radius: 10px;
            font-size: 1.2em;
        }
    </style>
</head>
<body>

    <h2>Payment Confirmation</h2>

    <%
    String cardNumber = request.getParameter("card_number");
    String expiryDate = request.getParameter("expiry_date");
    String cvv = request.getParameter("cvv");
    int userId = 1; // Replace with session-based user ID in production

    // Here you should ideally integrate with a payment gateway API for actual payment processing.

    // If payment is successful (simulating with a condition for now)
    boolean paymentSuccessful = true; // In a real scenario, this would come from a payment gateway API response.

    if(paymentSuccessful) {
        Connection con = null;
        PreparedStatement ps = null;
        Statement stmt = null;

        try {
            con = dbconnection.getConnection(); // Initialize connection

            // Update the order status as paid
            String updateOrderStatusQuery = "UPDATE orders SET status = 'Paid' WHERE user_id = ?";
            ps = con.prepareStatement(updateOrderStatusQuery);
            ps.setInt(1, userId);
            ps.executeUpdate();

            // Clear the cart after successful payment
            stmt = con.createStatement();
            stmt.executeUpdate("DELETE FROM cart WHERE user_id = " + userId);
        } catch(Exception e) {
            out.println("<div class='error-message'>Error: " + e.getMessage() + "</div>");
        } finally {
            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(stmt != null) stmt.close(); } catch(Exception e) {}
            try { if(con != null) con.close(); } catch(Exception e) {}
        }
    %>
        <div class="confirmation-message">
            Payment Successful! Your order has been placed successfully.
        </div>
        <p><a href=" Food_menu.jsp">Go back to the menu</a></p>
        <p><a href=" menu.jsp">Go back to the Home page</a></p>
    <% } else { %>
        <div class="error-message">
            Payment failed. Please try again.
        </div>
        <p><a href="place_order.jsp">Try again</a></p>
    <% } %>

</body>
</html>
