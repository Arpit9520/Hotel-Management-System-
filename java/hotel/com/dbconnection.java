package hotel.com;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbconnection {
    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelmanagement","root","Arpit@95");

		}
		return conn;

	}
  

