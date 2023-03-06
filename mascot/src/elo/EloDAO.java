package elo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import poolfact.ConnectionPool;

public class EloDAO {
	
	String board ="user_elo_data"; //테이블명
	
	ConnectionPool pool=  null;
	
	public EloDAO() {
		// TODO Auto-generated constructor stub
		try {
			pool=ConnectionPool.getInstance();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("연결실패");
		}
	}// BoardDAO
	
	// 총갯수 구하기
		public int boardCount() throws SQLException{
			int cnt =0;
			Connection c =null;
			PreparedStatement p =null;
			ResultSet r = null;
			String query="";
			
			try {
				c = pool.getConnection();
				query = "SELECT count(*) yunshll.from "+board;
				p=c.prepareStatement(query);
				r=p.executeQuery(query);
				r.next();
				cnt=r.getInt(1);
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("boardCount Exception : "+e);
			}finally {
				r.close();
				p.close();
				pool.releaseConnection(c);
			}
			return cnt;
		}//boardCount()
	
		// 게시글 리스트 가져오기
		public ArrayList getEloList() throws SQLException{ //Vector , ArrayList
			Connection c= null;
			PreparedStatement p = null;
			ResultSet r = null;
			String query ="";
			ArrayList eloList = new ArrayList();
			try {
				c = pool.getConnection();
				query ="SELECT *, b.champion_img  FROM yunshll.user_elo_data a\r\n" + 
						"INNER JOIN champion_name_map b\r\n" + 
						"on a.most_played_champion = b.champion_name_kr";
				p=c.prepareStatement(query);
				r=p.executeQuery(query);
				while(r.next()) {
					EloDTO eloDTO = new EloDTO();
					eloDTO.setRowNum(r.getInt("rowNum"));
					eloDTO.setUser_id(r.getString("user_id"));
					eloDTO.setWin_rate(r.getDouble("win_rate"));
					eloDTO.setNum_games(r.getString("num_games"));
					eloDTO.setAvg_kda(r.getDouble("avg_kda"));
					eloDTO.setMost_played_champion(r.getString("champion_img"));
					eloDTO.setNum_games_most_played(r.getString("Num_games_most_played"));
					eloDTO.setRating(r.getDouble("rating"));
					
					eloList.add(eloDTO);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("getEloList Exception "+e);
			}finally {
				r.close();
				p.close();
				pool.releaseConnection(c);
			}
			return eloList;
		}//getBoardList

}
