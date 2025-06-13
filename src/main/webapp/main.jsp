<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Hotel Management - Login</title>

  <!-- Google Fonts for better typography -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

  <style>
 
  
    /* Reset default margins */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      height: 100vh;
      background: url('image/images1.jpeg') no-repeat center center/cover;
      display: flex;
      justify-content: center;
      align-items: center;
      color: #fff;
    }

    .login-container {
      background: rgba(255, 255, 255, 0.1);
      border-radius: 15px;
      padding: 40px 30px;
      width: 100%;
      max-width: 400px;
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
      border: 1px solid rgba(255, 255, 255, 0.18);
      text-align: center;
      animation: fadeIn 1s ease-in;
    }

    @keyframes fadeIn {
      from {opacity: 0;}
      to {opacity: 1;}
    }

    .login-container h2 {
      margin-bottom: 25px;
      font-size: 2em;
      color: #ffce00;
      font-weight: 700;
    }

    .form-group {
      margin-bottom: 20px;
      text-align: left;
    }

    .form-group label {
      font-size: 1em;
      display: block;
      margin-bottom: 8px;
      color: #fffa;
    }

    .form-group input {
      width: 100%;
      padding: 12px;
      border: none;
      border-radius: 8px;
      background: rgba(255, 255, 255, 0.2);
      color: #fff;
      font-size: 1em;
      outline: none;
      transition: 0.3s;
    }

    .form-group input::placeholder {
      color: #eee;
    }

    .form-group input:focus {
      background: rgba(255, 255, 255, 0.3);
      border: 1px solid #ffce00;
    }

    .form-action {
      margin-top: 20px;
    }

    .login-btn {
      background-color: #ffce00;
      color: #000;
      font-size: 1.1em;
      padding: 12px;
      width: 100%;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-weight: 600;
      transition: background-color 0.3s, transform 0.3s;
    }

    .login-btn:hover {
      background-color: #e0b700;
      transform: translateY(-2px);
    }

    /* Responsive */
    @media (max-width: 600px) {
      .login-container {
        padding: 30px 20px;
      }

      .login-container h2 {
        font-size: 1.5em;
      }
    }
  </style>
</head>

<body>

  <div class="login-container">
    <form class="login-form" action="mainAction.jsp" method="post">
      <h2>Welcome </h2>
      <div class="form-group">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="Enter your username" required>
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>
      </div>
      <div class="form-action">
        <button type="submit" class="login-btn">Login</button>
      </div>
    </form>
  </div>

</body>
</html>
    