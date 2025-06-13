<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="hotel.com.dbconnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: #f7f9fc;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
        }

        h2 {
            color: #333;
            margin-bottom: 30px;
            font-size: 2.5em;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 20px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            color: #333;
        }

        th {
            background-color: #007bff;
            color: white;
            font-size: 1.1em;
        }

        td {
            background-color: #f9f9f9;
        }

        tr:last-child td {
            font-weight: bold;
            background-color: #f1f1f1;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        .footer {
            margin-top: 30px;
            text-align: center;
            color: #333;
            font-size: 1.1em;
        }

        .footer a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .footer a:hover {
            color: #0056b3;
        }

        .total-container {
            font-size: 1.2em;
            padding: 10px 20px;
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            margin-top: 20px;
            text-align: right;
            width: 80%;
            border-radius: 5px;
        }

        .total-container b {
            font-size: 1.3em;
        }
    </style>
</head>
<body>
    <h2>Your Cart</h2>
    <table>
        <thead>
            <tr>
                <th>Item</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
           <%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

// Get user ID from session or fallback for testing
Integer userId = (Integer) session.getAttribute("userId");
if (userId == null) {
    userId = 1; // ⚠️ Use session in production, hardcoded only for local testing
}

double grandTotal = 0;
boolean hasItems = false;

try {
    con = dbconnection.getConnection();

    String sql = "SELECT m.item_name, m.price, c.quantity " +
                 "FROM cart c JOIN menu m ON c.item_id = m.id " +
                 "WHERE c.user_id = ?";
    ps = con.prepareStatement(sql);
    ps.setInt(1, userId);
    rs = ps.executeQuery();

    while (rs.next()) {
        hasItems = true;
        String itemName = rs.getString("item_name");
        double price = rs.getDouble("price");
        int quantity = rs.getInt("quantity");
        double total = price * quantity;
        grandTotal += total;
%>
<tr>
    <td><%= itemName %></td>
    <td><%= price %></td>
    <td><%= quantity %></td>
    <td><%= total %></td>
</tr>
<%
    }

    if (!hasItems) {
%>
<tr>
    <td colspan="4">Your cart is empty.</td>
</tr>
<%
    }

} catch (Exception e) {
%>
<tr>
    <td colspan="4" style="color:red;">Error: <%= e.getMessage() %></td>
</tr>
<%
} finally {
    try { if (rs != null) rs.close(); } catch (Exception e) {}
    try { if (ps != null) ps.close(); } catch (Exception e) {}
    try { if (con != null) con.close(); } catch (Exception e) {}
}
%>


        </tbody>
    </table>
    <div class="total-container">
        <b>Grand Total: <%= grandTotal %></b>
    </div>
    <form action="place_order.jsp" method="post">
        <input type="submit" value="Place Order" />
    </form>

    <div class="footer">
        <p>Looking for more? <a href="menu.jsp">Continue Shopping</a></p>
    </div>
</body>
</html>


