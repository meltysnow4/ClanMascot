package elo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import poolfact.ConnectionPool;

public class EloDAO {
	
	String board ="user_elo_data"; //테이블명
	
	static String origin_sort;
	static int count;
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
				query = "SELECT count(*) from "+board;
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
		public ArrayList getEloList(String sort) throws SQLException{ //Vector , ArrayList
			Connection c= null;
			PreparedStatement p = null;
			ResultSet r = null;
			String query ="";
			
			System.out.println("before origin_sort : " + origin_sort);
			System.out.println("sort : " + sort);
			System.out.println("after origin_sort : " + origin_sort);
			ArrayList eloList = new ArrayList();
			try {
				System.out.println("count : " + count);
				c = pool.getConnection();
				if(sort == null) {
					query ="SELECT *, b.champion_img, c.user_lol_tear, user_position, c.descr FROM user_elo_data a LEFT JOIN champion_name_map b on a.most_played_champion = b.champion_name_kr	LEFT join user_info_master c on c.user_id = a.user_id order by rating desc";
					origin_sort = sort;
					count = 0;
				}else if(count == 1 && origin_sort.equals(sort)) {
					query ="SELECT *, b.champion_img, c.user_lol_tear, user_position, c.descr FROM user_elo_data a LEFT JOIN champion_name_map b on a.most_played_champion = b.champion_name_kr	LEFT join user_info_master c on c.user_id = a.user_id order by "+sort+" asc";
					origin_sort = sort;
					count = 0;
				}else if(count == 0 || (sort != null && !origin_sort.equals(sort))) {
					query ="SELECT *, b.champion_img, c.user_lol_tear, user_position, c.descr FROM user_elo_data a LEFT JOIN champion_name_map b on a.most_played_champion = b.champion_name_kr	LEFT join user_info_master c on c.user_id = a.user_id order by "+sort+" desc";
					origin_sort = sort;
					count = 1;
				}
				p=c.prepareStatement(query);
				r=p.executeQuery(query);
				while(r.next()) {
					EloDTO eloDTO = new EloDTO();
					eloDTO.setRowNum(r.getInt("rowNum"));
					eloDTO.setUser_id(r.getString("user_id"));
					eloDTO.setUser_lol_tear(r.getString("user_lol_tear"));
					eloDTO.setUser_position(r.getString("user_position"));
					eloDTO.setWin_rate(r.getDouble("win_rate"));
					eloDTO.setNum_games(r.getInt("num_games"));
					eloDTO.setAvg_kda(r.getDouble("avg_kda"));
					eloDTO.setMost_played_champion(r.getString("champion_img"));
					eloDTO.setNum_games_most_played(r.getString("Num_games_most_played"));
					eloDTO.setRating(r.getDouble("rating"));
					eloDTO.setDescr(r.getString("descr"));
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
