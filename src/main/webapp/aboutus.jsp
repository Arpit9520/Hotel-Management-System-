<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us - Hotel Management System</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f9f9f9;
      color: #2c3e50;
      line-height: 1.6;
    }

    nav {
      background-color: #2c3e50;
      position: sticky;
      top: 0;
      z-index: 999;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    .nav-container {
      max-width: 1100px;
      margin: auto;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 20px;
    }

    .nav-logo {
      color: #fff;
      font-size: 1.5rem;
      font-weight: bold;
      text-decoration: none;
    }

    .nav-links {
      list-style: none;
      display: flex;
      gap: 20px;
    }

    .nav-links li a {
      color: #fff;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s;
    }

    .nav-links li a:hover {
      color: #1abc9c;
    }

    header {
      background-color: #34495e;
      color: white;
      padding: 30px 0;
      text-align: center;
    }

    h1, h2, h3 {
      margin-bottom: 20px;
      color: #ffcc00;
      text-align: center;
    }

    .about, .qualities, .attractions {
      padding: 60px 20px;
    }

    .container {
      max-width: 1100px;
      margin: auto;
    }

    .about-intro {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      gap: 30px;
      margin-bottom: 50px;
    }

    .about-img {
      flex: 1;
    }

    .about-img img {
      width: 100%;
      max-width: 500px;
      border-radius: 10px;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
    }

    .about-text {
      flex: 1;
      font-size: 1.1rem;
    }

    p {
      margin-bottom: 20px;
      text-align: justify;
    }

    ul {
      list-style: none;
      padding: 0;
    }

    ul li {
      background: #ecf0f1;
      padding: 12px 20px;
      border-left: 6px solid #2980b9;
      margin-bottom: 10px;
      font-size: 1.05rem;
    }

    .qualities {
      background-color: #eaf2f8;
    }

    .attractions {
      background: url('image/jungle1.jpeg') no-repeat center center/cover;
      color: white;
    }

    .attractions ul li {
      background-color: rgba(0,0,0,0);
      border-left: 6px solid #ffcc00;
    }

    .attractions-content {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      gap: 30px;
      margin-top: 30px;
    }

    .attractions-video {
      flex: 1;
      text-align: left;
    }

    .attractions-video video {
      width: 100%;
      max-width: 480px;
      height: 270px;
      border-radius: 10px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.2);
    }

    .attractions-list {
      flex: 1;
    }

    .room-gallery {
      padding: 40px 20px;
      background-color: #ffffff;
    }

    .room-gallery h2 {
      margin-bottom: 20px;
    }

    .room-images {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
      justify-content: center;
      align-items: center;
    }

    .room-images img {
      width: 100%;
      height: 180px;
      object-fit: cover;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }

    .room-images img:hover {
      transform: scale(1.05);
    }

    footer {
      background-color: #2c3e50;
      color: white;
      text-align: center;
      padding: 20px 0;
      margin-top: 60px;
    }

    @media (max-width: 768px) {
      .about-intro {
        flex-direction: column;
      }

      .about-text, .about-img {
        width: 100%;
      }

      .nav-links {
        flex-direction: column;
        align-items: center;
      }
    }

    button {
      padding: 14px;
      margin: 20px auto;
      display: block;
      border: none;
      border-radius: 10px;
      background: linear-gradient(135deg, #89f7fe, #66a6ff);
      color: white;
      font-size: 17px;
      font-weight: 600;
      cursor: pointer;
      transition: background 0.3s ease, transform 0.2s ease;
    }

    button:hover {
      background: linear-gradient(135deg, #6fb1fc, #4364f7);
      transform: translateY(-2px);
    }
    .hotel-gallery {
  padding: 40px 20px;
  background-color: #ffffff;
}



.hotel-images {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
  justify-content: center;
  align-items: center;
}

.hotel-images img {
  width: 100%;
  height: 180px;
  object-fit: cover;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}

.hotel-images img:hover {
  transform: scale(1.05);
}
    
  </style>
</head>
<body>

<header>
  <h1>Royal Kingdom Resort</h1>
</header>

<section class="about">
  <div class="container">
    <div class="about-intro">
      <div class="about-img">
        <img src="image/royal kingdom.jpeg" alt="Hotel Interior">
      </div>
      <div class="about-text">
        <p>
          Welcome to our hotel! We provide exceptional service and comfortable accommodations to ensure you have a memorable stay. With a focus on guest satisfaction, our team is here to cater to all your needs.
        </p>
      </div>
    </div>

    <h1>Our Mission</h1>
    <p>Our mission is to provide an outstanding hospitality experience by offering quality service, personalized care, and a safe and comfortable environment for our guests.</p>

    <h1>Our Vision</h1>
    <p>We aspire to be the leading hotel brand known for excellence, innovation, and a commitment to sustainable practices in the hospitality industry.</p>

    <h1>Our Values</h1>
    <ul>
      <li><strong>Integrity:</strong> We uphold the highest standards of honesty and fairness in all our dealings.</li>
      <li><strong>Guest Satisfaction:</strong> We are committed to exceeding our guests' expectations.</li>
      <li><strong>Sustainability:</strong> We strive to be environmentally responsible in all our operations.</li>
      <li><strong>Innovation:</strong> We continuously seek new and better ways to serve our guests.</li>
    </ul>
  </div>
</section>

<section class="room-gallery">
  <h1>Room Facilities</h1>
  <div class="room-images">
    <img src="image/royal room1.jpeg" alt="Room 1">
    <img src="image/royal room2.jpeg" alt="Room 2">
    <img src="image/royal room3.jpeg" alt="Room 3">
    <img src="image/royal room4.jpeg" alt="Room 4">
    <img src="image/royal room5.jpeg" alt="Room 5">
    <img src="image/royal room6.jpeg" alt="Room 6">
    <img src="image/royal room7.jpeg" alt="Room 7">
    <img src="image/royal room8.jpeg" alt="Room 8">
    <img src="image/royal room9.jpeg" alt="Room 9">
    <img src="image/royal room10.jpeg" alt="Room 10">
  </div>
</section>
<selection class="hotel-gallery">
<h1>Hotel Gallery</h1>
<div class="hotel-images">
    <img src="image/royal image1.jpeg" alt="image 1">
    <img src="image/royal image 2.jpeg" alt="image 2">
    <img src="image/royal image3.jpeg" alt="image 3">
    <img src="image/royal image4.jpeg" alt="image 4">
    <img src="image/royal image5.jpeg" alt="image 5">
    <img src="image/royal image6.jpeg" alt="image 6">
    <img src="image/royal image7.jpeg" alt="image 7">
    <img src="image/royal image8.jpeg" alt="image 8">
    <img src="image/royal image9.jpeg" alt="image 9">
    <img src="image/royal image10.jpeg" alt="image 10">
    
</div>
</selection>
<section class="qualities">
  <h1>Why Choose Royal Kingdom Resort?</h3>
  <ul>
    <li>✔️ 24/7 Front Desk and Room Service</li>
    <li>✔️ Complimentary High-Speed Wi-Fi</li>
    <li>✔️ Multi-Cuisine In-House Restaurant</li>
    <li>✔️ Luxurious Rooms with Scenic Views</li>
    <li>✔️ Modern Gym and Spa Facilities</li>
    <li>✔️ Clean, Safe & Sanitized Environment</li>
    <li>✔️ Easy Online Room Booking System</li>
  </ul>
</section>

<section class="attractions">
  <h1>Nearby Attractions</h1>
  <div class="attractions-content">
    <div class="attractions-list">
      <ul>
        <li>🌴 Chuka Beach – Perfect for nature walks and relaxation</li>
        <li>🌊 Bifurcation Point – Scenic meeting of rivers, great photo spot</li>
        <li>🐅 Pilibhit Tiger Reserve – Explore rich wildlife and flora</li>
        <li>🌿 Gomti Udgam – The sacred origin point of Gomti River</li>
        <li>🚣️ Sarda Sagar Dam – A peaceful site with boating options</li>
        <li>🪳 Jungle Safari – Thrilling rides through dense forest zones</li>
      </ul>
    </div>
    <div class="attractions-video">
      <video controls>
        <source src="image/Chuka_Beach.mp4" type="video/mp4">
        Your browser does not support the video tag.
      </video>
    </div>
  </div>
</section>


<button type="button" onclick="document.location='Home.jsp'">Go Back</button>
<footer>
  <div style="max-width: 1100px; margin: auto; display: flex; flex-wrap: wrap; justify-content: space-between; padding: 20px;">
    <div style="flex: 1; min-width: 250px; padding: 10px;">
      <h3 style="color: #ffcc00;">Contact Details</h3>
      <p>Mathna Japti, Madhotanda Rd,<br>Uttar Pradesh 262001, India</p>
      <p>📞 +91-63997 54321</p>
      <p>✉️ <a href="mailto:info@royalkingdomresort.in" style="color: #fff;">info@royalkingdomresort.in</a></p>
    </div>

 
      <div style="flex: 1; min-width: 200px; padding: 10px;">
      <h3 style="color: #ffcc00;">Quick Links</h3>
       <a href="Home.jsp" style="color: white; ">Home</a>
       <a href="book room.jsp" style="color: white; ">Book Room</a>
       <a href="canteen.jsp" style="color: white; ">Canteen</a>
       
      
    </div>

    <div style="flex: 1; min-width: 200px; padding: 10px;">
      <h3 style="color: #ffcc00;">Follow Us</h3>
      <!-- Replace with actual links or icons -->
      <p>📘 Facebook</p>
      <p>📸 Instagram</p>
      <p>🐦 Twitter</p>
    </div>
  </div>

  <div style="border-top: 1px solid #777; margin-top: 20px; padding-top: 10px;">
    <p style="margin: 0;">&copy; 2025 Royal Kingdom Resort. All Rights Reserved.</p>
  </div>
</footer>


</body>
</html>
