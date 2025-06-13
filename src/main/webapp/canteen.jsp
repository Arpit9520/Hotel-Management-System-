<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Canteen Menu</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f1f5f9;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #007bff;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
        }

        .navbar-title {
            font-size: 2em;
            font-weight: bold;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-size: 1em;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: #d1eaff;
        }

        .go-back {
            margin: 20px 40px 0;
        }

        .go-back button {
            background-color: #6c757d;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1em;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .go-back button:hover {
            background-color: #5a6268;
        }

        .menu-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 40px;
        }

        .menu-item {
            background-color: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }

        .menu-item:hover {
            transform: translateY(-5px);
        }

        .menu-item img {
            max-width: 100%;
            border-radius: 10px;
            height: 150px;
            object-fit: cover;
        }

        .menu-item h3 {
            margin: 15px 0 10px;
            font-size: 1.2em;
            color: #333;
        }

        .menu-item p {
            color: #666;
            font-size: 1em;
        }

        .menu-item .price {
            color: #28a745;
            font-size: 1.1em;
            font-weight: bold;
            margin-top: 10px;
        }

        footer {
            background-color: #f8f9fa;
            text-align: center;
            padding: 15px;
            font-size: 0.9em;
            color: #777;
        }
    </style>
</head>
<body>
    <!-- Header Navbar -->
    <div class="navbar">
        <div class="navbar-title">Restaurant Menu</div>
        <div class="nav-links">
            <a href="register.jsp">Customer_register</a>
            <a href="login.jsp">Customer_login</a>
        </div>
    </div>

    <!-- Menu Items -->
    <div class="menu-container">
        <div class="menu-item">
            <img src="image/veg sandwich.jpg" alt="Veg Sandwich">
            <h3>Veg Sandwich</h3>
            <p>Fresh vegetables layered in toasted bread.</p>
            <div class="price">₹40</div>
        </div>

        <div class="menu-item">
            <img src="image/paneer roll.jpeg" alt="Paneer Roll">
            <h3>Paneer Roll</h3>
            <p>Spicy paneer wrapped in soft paratha.</p>
            <div class="price">₹60</div>
        </div>

        <div class="menu-item">
            <img src="image/cold drink.jpeg" alt="Cold Drink">
            <h3>Cold Drink</h3>
            <p>Chilled refreshing beverage of your choice.</p>
            <div class="price">₹30</div>
        </div>

        <div class="menu-item">
            <img src="image/french fries.jpeg" alt="French Fries">
            <h3>French Fries</h3>
            <p>Golden crispy potato fries.</p>
            <div class="price">₹50</div>
        </div>

        <div class="menu-item">
            <img src="image/veg burger.jpeg" alt="Burger">
            <h3>Burger</h3>
            <p>Soft bun with patty, cheese and veggies.</p>
            <div class="price">₹70</div>
        </div>
    </div> 
    <!-- Go Back Button -->
    <div class="go-back" style="text-align: center; margin-top: 20px;">
    <button onclick="history.back()">← Go Back</button>
</div>
    
</body>
</html>
