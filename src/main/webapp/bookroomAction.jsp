<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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


String name = null;
String email = null;
String phone = null;
String checkin = null;
String checkout = null;
String guests = null;
String room = null;

if(request.getParameter("name")!=null)
{
	name = request.getParameter("name");
}
else
{
	// goto to error page
}

if(request.getParameter("email")!=null)
{
	email = request.getParameter("email");
}
else
{
	// goto to error page
}
if(request.getParameter("phone")!=null)
{
	phone = request.getParameter("phone");
}
else
{
	// goto error page
}

if(request.getParameter("checkin")!=null)
{
	checkin = request.getParameter("checkin");
}
else
{
	// goto error page
}

if(request.getParameter("checkout")!=null)
{
	checkout = request.getParameter("checkout");
}
else
{
	// goto error page
}
if(request.getParameter("guests")!=null)
{
	guests = request.getParameter("guests");
}
else
{
	// goto error page
}
if(request.getParameter("room")!=null)
{
	room = request.getParameter("room");
}
else
{
	// goto error page
}

try(
		Connection con = dbconnection.getConnection();
		PreparedStatement ps1 = con.prepareStatement("insert into bookings values(?,?,?,?,?,?,?)");
		
)
{
	ps1.setString(1,name);
	ps1.setString(2,email);
	ps1.setString(3,phone);
	ps1.setString(4,checkin);
	ps1.setString(5,checkout);
	ps1.setString(6,guests);
	ps1.setString(7,room);

	
	int i = ps1.executeUpdate();
	
	if(i>0)
	{

		request.getRequestDispatcher("Home.jsp").include(request, response);
	}
	else
	{
		out.print("<h3> User Not Created </h3>");
		request.getRequestDispatcher("appointment.jsp").include(request, response);
	}
	
	
}
catch(Exception e)
{
	out.print(e);
}


%>

<button onclick="document.location='Home.jsp'">Go to Back</button>
</body>
</html>



