<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hotel Management</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  text-decoration: none;
  font-family: 'Montserrat', sans-serif;
}

body {
  background-color: #001f33;
  color: #ffffff; n
  overflow-x: hidden;
}

/* Navbar */
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: rgba(0, 51, 102, 0.9);
  padding: 20px 50px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.3);
  position: sticky;
  top: 0;
  z-index: 999;
}

.logo a {
  font-size: 30px;
  font-weight: 700;
  color: #ffcc00;
  letter-spacing: 1px;
}

.nav-links a {
  margin-left: 30px;
  font-size: 18px;
  color: #ffffff;
  padding-bottom: 5px;
  transition: color 0.3s, border-bottom 0.3s;
}

.nav-links a:hover {
  color: #ffcc00;
  border-bottom: 2px solid #ffcc00;
}

/* Hero Section */
.hero-section {
  
background: url('image/royal-tra (1).png')no-repeat center center/cover;
  height: 100vh;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.center-text h2 {
  font-size: 60px;
  color: #ffcc00;
  text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.8);
}

/* Common Section Styles */
.qualities, .attractions {
  background-color: #002b4d;
  padding: 50px 30px;
  text-align: center;
}

.qualities h3, .attractions h3 {
  font-size: 32px;
  color: #ffcc00;
  margin-bottom: 25px;
}

.qualities ul, .attractions ul {
  list-style: none;
  max-width: 800px;
  margin: 0 auto;
  padding: 0;
  font-size: 20px;
}

.qualities ul li, .attractions ul li {
  margin-bottom: 12px;
  color: #e6e6e6;
}

/* Responsive Design */
@media (max-width: 768px) {
  .navbar {
    flex-direction: column;
    gap: 15px;
    padding: 15px 20px;
  }

  .nav-links a {
    margin-left: 0;
  }

  .center-text h2 {
    font-size: 40px;
    padding: 0 20px;
  }

  .qualities h3, .attractions h3 {
    font-size: 24px;
  }

  .qualities ul li, .attractions ul li {
    font-size: 16px;
  }
  .attractions {
  background: url('images/tiger reserve.jpeg') no-repeat center center/cover;
  padding: 50px 30px;
  text-align: center;
  color: #ffffff;
  background-attachment: fixed;
}
  
}
</style>
</head>

<body>

 <!-- Full Navbar -->
    <nav class="navbar">
        <div class="logo"><a href="#">Royal Kingdom Resort</a></div>
        <div class="nav-links">
            <a href="aboutus.jsp">About Us</a>
            <a href="book room.jsp">Book Room</a>
            <a href="showallcustomer.jsp">Show Bookings</a>
            <a href="canteen.jsp">Food_facility</a>
            <a href="main.jsp">Log Out</a>
        </div>
    </nav>

<!-- Hero Section -->
<div class="hero-section">
  <div class="center-text">
    <h2>Welcome to Royal Kingdom Resort</h2>
  </div>
</div>

<!-- Qualities Section -->
<div class="qualities">
  <h3>Why Choose Royal Kingdom Resort?</h3>
  <ul>
    <li>✔️ 24/7 Front Desk and Room Service</li>
    <li>✔️ Complimentary High-Speed Wi-Fi</li>
    <li>✔️ Multi-Cuisine In-House Restaurant</li>
    <li>✔️ Luxurious Rooms with Scenic Views</li>
    <li>✔️ Modern Gym and Spa Facilities</li>
    <li>✔️ Clean, Safe & Sanitized Environment</li>
    <li>✔️ Easy Online Room Booking System</li>
  </ul>
</div>

<!-- Attractions Section -->
<div class="attractions">
<p style="background-image: url('tiger reserve.jpeg');">
  <h3>Nearby Attractions</h3>
  <ul>
    <li>🌴 Chuka Beach – Perfect for nature walks and relaxation</li>
    <li>🌊 Bifurcation Point – Scenic meeting of rivers, great photo spot</li>
    <li>🐅 Pilibhit Tiger Reserve – Explore rich wildlife and flora</li>
    <li>🌿 Gomti Udgam – The sacred origin point of Gomti River</li>
    <li>🚣‍♂️ Sarda Sagar Dam – A peaceful site with boating options</li>
    <li>🦓 Jungle Safari – Thrilling rides through dense forest zones</li>
  </ul>
</div>

</body>
</html>
