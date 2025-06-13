<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<%@ page import="hotel.com.dbconnection" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String username = null;
String password = null;

if (request.getParameter("username") != null) {
    username = request.getParameter("username");
}

if (request.getParameter("password") != null) {
	password = request.getParameter("password");
}

try (Connection conn = dbconnection.getConnection();
     PreparedStatement ps = conn.prepareStatement("SELECT * FROM hotel WHERE username = ? AND password = ?")) {

    ps.setString(1, username);
    ps.setString(2, password);

    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        request.setAttribute("username", username);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    } else {
        request.getRequestDispatcher("Error.jsp").forward(request, response);
    }
} catch (Exception e) {
    out.print(e);
}
%>

</body>
</html>