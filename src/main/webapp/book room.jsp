<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Book a Room</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #f6d365, #fda085, #fbc2eb, #a6c1ee);
      background-size: 400% 400%;
      animation: gradientBG 15s ease infinite;
      margin: 0;
      padding: 0;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    @keyframes gradientBG {
      0% {background-position: 0% 50%;}
      50% {background-position: 100% 50%;}
      100% {background-position: 0% 50%;}
    }

    .container {
      background: #ffffff;
      padding: 40px 50px;
      border-radius: 20px;
      width: 100%;
      max-width: 500px;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
      box-sizing: border-box;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .container:hover {
      transform: translateY(-8px);
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
    }

    h1 {
      margin-bottom: 30px;
      text-align: center;
      font-size: 34px;
      font-weight: 700;
      color: #333;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      font-size: 16px;
      color: #555;
      margin-bottom: 8px;
      font-weight: 500;
    }

    input, select {
      padding: 14px;
      margin-bottom: 20px;
      border: none;
      border-radius: 10px;
      background: linear-gradient(135deg, #fdfbfb, #ebedee);
      font-size: 15px;
      box-shadow: inset 0 0 5px rgba(0,0,0,0.1);
      transition: all 0.3s ease;
    }

    input:focus, select:focus {
      background: linear-gradient(135deg, #e0c3fc, #8ec5fc);
      border: none;
      outline: none;
      box-shadow: 0 0 10px rgba(142,197,252,0.6);
      color: #333;
    }

    button {
      padding: 14px;
      margin-bottom: 15px;
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

    button:last-of-type {
      background: linear-gradient(135deg, #ff758c, #ff7eb3);
      margin-top: 8px;
    }

    button:last-of-type:hover {
      background: linear-gradient(135deg, #f857a6, #ff5858);
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Book a Room</h1>
    <form action="bookroomAction.jsp" method="POST">
      <label for="name">Full Name:</label>
      <input type="text" id="name" name="name" placeholder="Enter your full name" required>

      <label for="email">Email Address:</label>
      <input type="email" id="email" name="email" placeholder="Enter your email" required>

      <label for="phone">Phone Number:</label>
      <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" minlength="10" maxlength="10" required>

      <label for="checkin">Check-in Date:</label>
      <input type="date" id="checkin" name="checkin" required>

      <label for="checkout">Check-out Date:</label>
      <input type="date" id="checkout" name="checkout" required>

      <label for="guests">Number of Guests:</label>
      <input type="number" id="guests" name="guests" min="1" max="10" required>

      <label for="room">Room Type:</label>
      <select id="room" name="room" required>
        <option value="" disabled selected>Select a room type</option>
        <option value="single">Single Room - ₹1000/night</option>
        <option value="double">Double Room - ₹1800/night</option>
        <option value="suite">Suite - ₹3000/night</option>
      </select>

      <label for="payment-method">Payment Method:</label>
      <select id="payment-method" name="paymentMethod" required>
        <option value="" disabled selected>Select payment method</option>
        <option value="credit">Credit Card</option>
        <option value="debit">Debit Card</option>
        <option value="upi">UPI</option>
      </select>

      <div id="card-details" style="display: none;">
        <label for="card-number">Card Number:</label>
        <input type="text" id="card-number" name="cardNumber" placeholder="Enter card number">

        <label for="card-expiry">Expiry Date:</label>
        <input type="month" id="card-expiry" name="cardExpiry">

        <label for="card-cvv">CVV:</label>
        <input type="password" id="card-cvv" name="cardCvv" placeholder="Enter CVV" maxlength="3">
      </div>

      <div id="upi-details" style="display: none;">
        <label for="upi-id">UPI ID:</label>
        <input type="text" id="upi-id" name="upiId" placeholder="example@upi">
      </div>

      <button type="submit">Book Now</button>
      <button type="button" onclick="document.location='Home.jsp'">Go Back</button>
    </form>

    <script>
      // Payment option toggle
      const paymentSelect = document.getElementById('payment-method');
      const cardDetails = document.getElementById('card-details');
      const upiDetails = document.getElementById('upi-details');

      paymentSelect.addEventListener('change', function () {
        if (this.value === 'credit' || this.value === 'debit') {
          cardDetails.style.display = 'block';
          upiDetails.style.display = 'none';
        } else if (this.value === 'upi') {
          upiDetails.style.display = 'block';
          cardDetails.style.display = 'none';
        } else {
          cardDetails.style.display = 'none';
          upiDetails.style.display = 'none';
        }
      });

   // Set check-in date to only today, and checkout within 5 days from today
      const checkinInput = document.getElementById("checkin");
      const checkoutInput = document.getElementById("checkout");

      const today = new Date();
      const todayStr = today.toISOString().split('T')[0];

      const maxCheckout = new Date();
      maxCheckout.setDate(today.getDate() + 5);
      const maxCheckoutStr = maxCheckout.toISOString().split('T')[0];

      checkinInput.value = todayStr;
      checkinInput.min = todayStr;
      checkinInput.max = todayStr;

      checkoutInput.min = todayStr;
      checkoutInput.max = maxCheckoutStr;

      checkoutInput.addEventListener("change", () => {
        const selectedCheckout = new Date(checkoutInput.value);
        if (selectedCheckout < today || selectedCheckout > maxCheckout) {
          alert("Checkout date must be within 5 days from today.");
          checkoutInput.value = "";
        }
      });
    </script>
  </div>
</body>
</html>
