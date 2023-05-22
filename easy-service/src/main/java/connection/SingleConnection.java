package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnection {
	private static String url = "jdbc:mysql://aws.connect.psdb.cloud/ecm_01?sslMode=VERIFY_IDENTITY";
	private static String user = "[2x1mksdljkgemlqr0u82]";
	private static String password = "[jnteste]";
	private static Connection connection = null;
	
	static{
		conectar(); /*desta forma de qualquer lugar que eu chamar esta classe , a conexao do banco sera sucedida*/
	}
	public SingleConnection() {
		conectar();
	}
	private static void conectar() {
		try {
			if(connection==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection= DriverManager.getConnection(
						"jdbc:mysql://aws.connect.psdb.cloud/ecm_01?sslMode=VERIFY_IDENTITY",
						"nsglnb2rejz2r008xt0d",
						"pscale_pw_6sNWzPRj5W1mdg3DLzB4jwXUnZBpuWnmZo4k42pRASm"
						
						);
				connection.setAutoCommit(false);
				System.out.println("conexao  deu boa");
				
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	public static Connection getConn() {
		return connection;
	}
	
	

}
