package Storage;
import java.sql.*;

public class Data {

	public Connection cn;
	public Statement st;
	public ResultSet rs;
	
	public Data()
	{
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
           
            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/careforudb","root","root");
			
		}
		catch(Exception ex) {}
	}
}
