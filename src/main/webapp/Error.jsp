<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <link rel="stylesheet" href="styles.css">
</head>
<style>

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    text-align: center;
}

.error-container {
    background-color: #fff;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 500px;
}

.error-title {
    font-size: 2em;
    color: #e74c3c;
    margin-bottom: 20px;
}

.error-message {
    font-size: 1.2em;
    color: #555;
    margin-bottom: 30px;
}

.go-back {
    font-size: 1.1em;
    color: #3498db;
    text-decoration: none;
    padding: 10px 20px;
    border: 2px solid #3498db;
    border-radius: 5px;
    transition: background-color 0.3s, color 0.3s;
}

.go-back:hover {
    background-color: #3498db;
    color: #fff;
}
</style>
<body>
    <div class="error-container">
        <h1 class="error-title">Oops! Something went wrong.</h1>
        <a href="main.jsp" class="go-back">Go Back</a>
    </div>
</body>
</html>
