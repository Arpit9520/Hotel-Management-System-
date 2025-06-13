<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Canteen Menu</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #f4f4f4, #e8f5e9);
      color: #333;
    }

    header {
      background: linear-gradient(to right, #2e7d32, #66bb6a);
      color: white;
      padding: 1rem 2rem;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      position: sticky;
      top: 0;
      z-index: 1000;
    }

    nav {
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
    }

    .logo h1 {
      font-size: 2rem;
      font-weight: bold;
    }

    .nav-links {
      display: flex;
      gap: 20px;
      align-items: center;
    }

    .nav-links a,
    .nav-links button {
      text-decoration: none;
      font-size: 1rem;
      padding: 10px 16px;
      border-radius: 5px;
      border: none;
      transition: background 0.3s, color 0.3s;
    }

    .nav-links a {
      color: white;
    }

    .nav-links a:hover {
      background-color: rgba(255, 255, 255, 0.2);
    }

    .nav-links .book-order {
      background-color: #1b5e20;
      color: white;
    }

    .nav-links .book-order:hover {
      background-color: #33691e;
    }

    .nav-links .go-back {
      background-color: #9e9e9e;
      color: white;
    }

    .nav-links .go-back:hover {
      background-color: #757575;
    }

    section {
      padding: 60px 20px;
      text-align: center;
    }

    #menu h2 {
      font-size: 2.8rem;
      margin-bottom: 40px;
      color: #2e7d32;
    }

    .menu-items {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
      gap: 30px;
      justify-items: center;
    }

    .menu-item {
      background-color: #ffffff;
      padding: 20px;
      border-radius: 12px;
      width: 250px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .menu-item:hover {
      transform: translateY(-7px);
      box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
    }

    .menu-item h3 {
      font-size: 1.6rem;
      margin-bottom: 10px;
      color: #00796b;
    }

    .menu-item p {
      font-size: 0.95rem;
      margin-bottom: 10px;
    }

    .price {
      color: #e64a19;
      font-weight: bold;
      font-size: 1.2rem;
    }

    footer {
      background: #388e3c;
      color: white;
      text-align: center;
      padding: 12px;
      position: fixed;
      width: 100%;
      bottom: 0;
    }
  </style>
</head>
<body>

<header>
  <nav>
    <div class="logo">
      <h1>Canteen</h1>
    </div>
    <div class="nav-links">
      <a href="#menu">Menu</a>
      <a href="BookOrder.jsp" class="book-order">Book Order</a>
      <button class="go-back" onclick="location.href='Home.jsp'">Go Back</button>
    </div>
  </nav>
</header>

<section id="menu">
  <h2>Our Delicious Menu</h2>
  <div class="menu-items">
    <div class="menu-item">
      <h3>Veg Burger</h3>
      <img src="image/veg burger.jpeg" alt="Veg Burger" width="200" height="100">
      <p>Freshly grilled patty with lettuce, tomato, and special sauce in a soft bun.</p>
      <p class="price">Rs79</p>
    </div>
    <div class="menu-item">
      <h3>Chicken Wrap</h3>
      <img src="image/chicken wrap.jpeg" alt="Chicken Wrap" width="200" height="100">
      <p>Grilled chicken, crunchy veggies, and a tangy sauce wrapped in a soft tortilla.</p>
      <p class="price">Rs199</p>
    </div>
    <div class="menu-item">
      <h3>Cheese Sandwich</h3>
      <img src="image/cheese.jpeg" alt="Cheese Sandwich" width="200" height="100">
      <p>A hearty sandwich filled with melted cheese and your choice of toppings.</p>
      <p class="price">Rs149</p>
    </div>
    <div class="menu-item">
      <h3>Veg Pizza</h3>
      <img src="image/veg pizza.jpeg" alt="Veg Pizza" width="200" height="100">
      <p>A delicious pizza topped with fresh vegetables, mozzarella cheese, and tomato sauce.</p>
      <p class="price">Rs229</p>
    </div>
    <div class="menu-item">
      <h3>French Fries</h3>
      <img src="image/french fries.jpeg" alt="French Fries" width="200" height="100">
      <p>Crispy, golden fries seasoned to perfection. Perfect as a side dish.</p>
      <p class="price">Rs99</p>
    </div>
    <div class="menu-item">
      <h3>Chocolate Cake</h3>
      <img src="image/chocolate cake.jpeg" alt="Chocolate Cake" width="200" height="100">
      <p>Rich and moist chocolate cake topped with creamy chocolate frosting.</p>
      <p class="price">Rs299</p>
    </div>
    <div class="menu-item">
      <h3>Pasta Alfredo</h3>
      <img src="image/pasta.jpeg" alt="Pasta Alfredo" width="200" height="100">
      <p>Creamy white sauce pasta with mushrooms, herbs, and parmesan cheese.</p>
      <p class="price">Rs199</p>
    </div>
  </div>
</section>

<footer>
  <p>&copy; 2025 Canteen. All Rights Reserved.</p>
</footer>

</body>
</html>
    