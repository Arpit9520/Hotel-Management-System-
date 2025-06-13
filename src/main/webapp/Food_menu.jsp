<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="hotel.com.dbconnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Canteen Menu</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('image/food-background.jpg');
            background-size: cover;
            background-position: center;
        }

        .menu-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 70%;
            max-width: 900px;
            text-align: center;
        }

        h2 {
            font-size: 2.5em;
            color: #333;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
            color: #333;
        }

        table th {
            background-color: #007bff;
            color: white;
            font-size: 1.2em;
        }

        table td {
            background-color: #f9f9f9;
            font-size: 1.1em;
        }

        table tr:nth-child(even) td {
            background-color: #f1f1f1;
        }

        input[type="number"] {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1em;
            width: 80px;
        }

        input[type="checkbox"] {
            width: 20px;
            height: 20px;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 5px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        .footer {
            margin-top: 20px;
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
    </style>
</head>
<body>
    <div class="menu-container">
        <h2>Our Restaurant Menu</h2>
        <form action="add_to_cart.jsp" method="post">
            <table>
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Select</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        Connection con = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            con = dbconnection.getConnection(); 
                            stmt = con.createStatement();
                            rs = stmt.executeQuery("SELECT * FROM menu");
                            while(rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("item_name") %></td>
                        <td><%= rs.getDouble("price") %></td>
                        <td><input type="number" name="qty_<%=rs.getInt("id")%>" min="1" value="1" /></td>
                        <td><input type="checkbox" name="item" value="<%=rs.getInt("id")%>" /></td>
                    </tr>
                    <% 
                            }
                        } catch(Exception e) {
                            out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
                        } finally {
                            try { if(rs != null) rs.close(); } catch(Exception e) {}
                            try { if(stmt != null) stmt.close(); } catch(Exception e) {}
                            try { if(con != null) con.close(); } catch(Exception e) {}
                        }
                    %>
                </tbody>
            </table>
            <input type="submit" value="Add to Cart" />
        </form>
        <div class="footer">
            <p>Looking for more? <a href="menu.jsp">Order More Items</a></p>
        </div>
    </div>
</body>
</html>
