package poolfact;

import java.sql.*;

public class ConnectionFactory {

	public static final int ODBC = 1;
	public static final int ORACLE = 2;
	public static final int MSSQL = 3;
	public static final int MYSQL = 4;
	public static final int MARIADB = 5;

	private String url = "yunshll.cafe24.com";
	private String port = "3306";
	private String dbname = "디비명";
	private String dbuser = "유저명";
	private String pswd = "패스워드";
	private String unicode = "true";
	private String encode = "euc_kr"; // utf-8

	public ConnectionFactory() {
		// TODO Auto-generated constructor stub
	}

	public Connection getConnection(int dbms) throws SQLException {
		Connection conn = null;

		/*
		 * if(dbms==ConnectionFactory.ODBC) { try {
		 * Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		 * conn=DriverManager.getConnection("jdbc:odbc:dbdsn","id","password"); } catch
		 * (ClassNotFoundException cnfe) { // TODO: handle exception
		 * System.out.println(cnfe); } }
		 * 
		 * else if(dbms==ConnectionFactory.ORACLE) { try {
		 * Class.forName("oracle.jdbc.driver.OracleDriver");
		 * conn=DriverManager.getConnection("jdbc:oracle:thin:@"+url+":"+port+":"+dbname
		 * ,dbuser,pswd); } catch (ClassNotFoundException e) { // TODO: handle exception
		 * System.out.println(e); } }
		 * 
		 * else if(dbms==ConnectionFactory.MSSQL) { try {
		 * Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
		 * conn=DriverManager.getConnection("jdbc:microsoft:sqlserver://localhost:1433",
		 * "novel","jsp"); } catch (ClassNotFoundException e) { // TODO: handle
		 * exception System.out.println(e); } }
		 * 
		 * else if(dbms==ConnectionFactory.MYSQL) { try { String dbURL =
		 * "jdbc:mysql://yunshll.cafe24.com:3306/yunshll?characterEncoding=UTF-8&serverTimezone=UTC&autoReconnect=true";
		 * String dbID = "yunshll"; String dbPassword = "fpalffldk4680!";
		 * Class.forName("com.mysql.jdbc.Driver");
		 * System.out.println("CF의 Connection ");
		 * Class.forName("org.gjt.mm.mysql.Driver");
		 * conn=DriverManager.getConnection(dbURL, dbID, dbPassword); } catch
		 * (ClassNotFoundException e) { // TODO: handle exception System.out.println(e);
		 * } }
		 * 
		 * else
		 */ if (dbms == ConnectionFactory.MARIADB) {
			try {
				String dbURL = "jdbc:mysql://localhost:3306/yunshll?characterEncoding=UTF-8&serverTimezone=UTC&autoReconnect=true";
				String dbID = "yunshll";
				String dbPassword = "fpalffldk4680!";
				//String dbURL = "jdbc:mysql://localhost:3306/mascot?characterEncoding=UTF-8&serverTimezone=UTC&autoReconnect=true";
				//String dbID = "root";
				//String dbPassword = "dktpfldk4680!";
				
				//Class.forName("org.mariadb.jdbc.Driver");
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("CF의 Connection ");
				/* Class.forName("org.gjt.mm.mysql.Driver"); */
				conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			} catch (ClassNotFoundException e) {
				// TODO: handle exception
				throw new IllegalStateException("드라이버 불러오기 실패", e);
			}
		}
		return conn;
	}

}
