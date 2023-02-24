package poolfact;

import java.sql.*;
import java.util.*;

public class ConnectionPool {
	
	private static ConnectionPool cp=null;
	private ConnectionFactory cf=null;
	private Vector pool=null;
	private int initCon=0;
	private int maxCon=0;
	private int users=0;
	
	public ConnectionPool() {
		super();
		// TODO Auto-generated constructor stub
		//factory 참조
	}
	
	
	private ConnectionPool(int initCon,int maxCon) throws SQLException{
		this.initCon=initCon;
		this.maxCon=maxCon;
		cf=new ConnectionFactory();
		pool=new Vector();
		for(int i=0;i<initCon;i++) {
			pool.add(createConnection());
		}
	}
	public static synchronized ConnectionPool getInstance() throws SQLException{
		if(cp==null) {
			cp=new ConnectionPool(4,20);
		}
		return cp;
	}
	
	public synchronized Connection getConnection() throws SQLException{
		Connection conn=null;
		while((conn=getPooledConnection())==null) {
			try {
				wait();
			} catch (InterruptedException ie) {
				// TODO: handle exception
			}
		} // while
		users++;
		return conn;
	}
	
	public synchronized void releaseConnection(Connection conn) {
		pool.add(conn);
		users--;
		notifyAll();
	}

	private Connection getPooledConnection() throws SQLException{
		Connection conn=null;
		int size=pool.size();
		
		if(size>0) {
			conn=(Connection)(pool.elementAt(0));
			pool.removeElementAt(0);
		}else if(users<maxCon || maxCon ==0) {
			//conn=createConnection();
			pool.add(createConnection());
		}
		return conn;
	}
	
	private Connection createConnection() throws SQLException{
		Connection conn=cf.getConnection(ConnectionFactory.MYSQL);
		System.out.println("== a connection was created");
		return conn;
	}
	
	
	

}
