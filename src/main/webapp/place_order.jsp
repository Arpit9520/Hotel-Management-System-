<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="hotel.com.dbconnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Order</title>
    <style>
        /* Your existing CSS unchanged */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f9fc;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
        }
        h2 { color: #333; margin-bottom: 30px; }
        .order-summary, .payment-form {
            width: 80%;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-bottom: 20px;
        }
        table { width: 100%; border-collapse: collapse; }
        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th { background-color: #007bff; color: white; }
        td { background-color: #f9f9f9; }
        .total-container {
            font-size: 1.3em;
            padding: 10px;
            background-color: #f1f1f1;
            margin-top: 10px;
            text-align: right;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<h2>Place Your Order</h2>

<!-- Order Summary -->
<div class="order-summary">
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

        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            // Fallback for testing only
            userId = 1; // ⚠️ Remove in production
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
        <b>Grand Total: ₹<%= grandTotal %></b>
    </div>
</div>

<!-- Payment Form -->
<div class="payment-form">
    <h3>Select Payment Method</h3>
    <form action="process_payment.jsp" method="post" id="paymentForm">
        <label><input type="radio" name="payment_method" value="card" checked onclick="showPaymentFields('card')"> Credit/Debit Card</label><br>
        <label><input type="radio" name="payment_method" value="upi" onclick="showPaymentFields('upi')"> UPI</label><br>
        <label><input type="radio" name="payment_method" value="cod" onclick="showPaymentFields('cod')"> Cash on Delivery</label><br><br>

        <!-- Card Fields -->
        <div id="cardFields">
            <label>Card Number:</label><input type="text" name="card_number"><br><br>
            <label>Expiry Date (MM/YY):</label><input type="text" name="expiry_date"><br><br>
            <label>CVV:</label><input type="text" name="cvv"><br><br>
        </div>

        <!-- UPI Field -->
        <div id="upiField" style="display: none;">
            <label>UPI ID:</label><input type="text" name="upi_id"><br><br>
        </div>

        <input type="submit" value="Confirm Order">
    </form>
</div>

<script>
function showPaymentFields(method) {
    document.getElementById('cardFields').style.display = (method === 'card') ? 'block' : 'none';
    document.getElementById('upiField').style.display = (method === 'upi') ? 'block' : 'none';
}
</script>

</body>
</html>
