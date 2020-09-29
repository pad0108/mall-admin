package dao;

import java.sql.*;
import commons.*;
import vo.*;
import java.util.*;

public class MemberDao {
	//회원 정보 리스트
		public ArrayList<Member> selectMemberList(int currentPage) throws Exception{
			ArrayList<Member> list = new ArrayList<Member>();
			//데이터 베이스 연결
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			     
			//sql 문 생성
			String sql = "select member_email, member_name, member_date, member_state from member order by member_date desc limit ?,?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, (currentPage-1)*10);
			stmt.setInt(2, 10);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				Member m = new Member();
				m.setMemberEmail(rs.getString("member_email"));
				m.setMemberName(rs.getString("member_name"));
				m.setMemberDate(rs.getString("member_date"));
				m.setMemberState(rs.getString("member_state"));
				//리스트 출력
				list.add(m);
			}
			//데이터베이스 닫기
			conn.close();
			return list;
		}
	//회원 탈퇴
		
	//최대 페이지 수 구하기
		//공지사항 페이징
		public int getMemberEndPage() throws Exception{
			//페이지 변수 지정
			int endPage = 1;
			//데이터 베이스 연결
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			String sql = "select count(*) from member"; 
			//데이터베이스 접속
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) {
				endPage = rs.getInt("count(*)");
				if(endPage%10 == 0) {
					endPage = (int)(endPage/10);
				}else {
					endPage = (int)(endPage/10) + 1;
				}
			}
		
		
		conn.close();
		return endPage;

	}
		//회원 탈퇴 토글 형식
		public void updateMemberState(String memberEmail,String memberState) throws Exception {
			//데이터 베이스 연결
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
		    //쿼리문 생성
			String sql = "update member set member_state = ? where member_email = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			if(memberState.equals("Y")) {
				stmt.setString(1, "N");
			}else {
				stmt.setString(1, "Y");
			}
			stmt.setString(2, memberEmail);
			stmt.executeUpdate();
			//디버깅 코드
			//int row = stmt.executeUpdate();
			//System.out.println();
		}
}
