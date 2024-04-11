package match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import java.util.ArrayList;

public class CompanyMgr {
	private DBConnectionMgr pool;
	public CompanyMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public int getCompanyIdx(int company_rnum, String company_name, String company_head) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int company_idx = 0;
		try {
			con = pool.getConnection();
			sql = "select company_idx from company where company_rnum = ? and company_name = ? and company_head = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, company_rnum);
			pstmt.setString(2, company_name);
			pstmt.setString(3, company_head);
			rs = pstmt.executeQuery();
			if(rs.next())
				company_idx = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return company_idx;
	}
	
	public CompanyBean getCompanyLocation(int company_idx) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    CompanyBean bean = new CompanyBean();
	    try {
	        // Assuming you have a similar connection pooling mechanism as in the previous method
	        con = pool.getConnection(); 
	        String sql = "SELECT company_name, company_type, company_head, company_address, company_latitude, company_longitude FROM company WHERE company_idx = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, company_idx);
	        rs = pstmt.executeQuery();
	        if(rs.next()) {
	        	bean.setCompany_name(rs.getString("company_name"));
	        	bean.setCompany_type(rs.getString("company_type"));
	        	bean.setCompany_head(rs.getString("company_head"));
	        	bean.setCompany_address(rs.getString("company_address"));
	            bean.setCompany_latitude(rs.getDouble("company_latitude"));
	            bean.setCompany_longitude(rs.getDouble("company_longitude"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (pool != null) {
	            pool.freeConnection(con, pstmt, rs);
	        }
	    }
	    return bean;
	}
	
	
	public void insertBookmark(String user_id, int posting_idx) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    String sql = "INSERT INTO bookmark_posting (user_id, posting_idx) VALUES (?, ?)";
	    try {
	        con = pool.getConnection();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, user_id);
	        pstmt.setInt(2, posting_idx);
	        pstmt.executeUpdate(); // executeQuery() 대신 executeUpdate() 사용
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt);
	    }
	}
	
	public void deleteBookmark(String user_id, int posting_idx) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    String sql = "DELETE FROM bookmark_posting WHERE user_id = ? AND posting_idx = ?";
	    try {
	        con = pool.getConnection();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, user_id);
	        pstmt.setInt(2, posting_idx);
	        pstmt.executeUpdate(); // executeQuery() 대신 executeUpdate() 사용
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt);
	    }
	}
	
	public boolean searchBookmark(String user_id, int posting_idx) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    boolean exists = false; // 즐겨찾기가 존재하는지 여부
	    try {
	        con = pool.getConnection();
	        String sql = "SELECT COUNT(*) FROM bookmark_posting WHERE user_id = ? AND posting_idx = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, user_id);
	        pstmt.setInt(2, posting_idx);

	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            // COUNT(*) 결과가 1 이상이면 해당 즐겨찾기가 존재함을 의미
	            exists = rs.getInt(1) > 0;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt, rs);
	    }
	    return exists;
	}
	public List<Integer> getBookmarkedPostIdxs(String user_id) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<Integer> bookmarkedPostIdxs = new ArrayList<>(); // 사용자가 북마크한 모든 게시물의 posting_idx 값을 저장할 리스트

	    try {
	        con = pool.getConnection();
	        String sql = "SELECT posting_idx FROM bookmark_posting WHERE user_id = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, user_id);

	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            // 각 행의 posting_idx 값을 리스트에 추가
	            bookmarkedPostIdxs.add(rs.getInt("posting_idx"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt, rs);
	    }
	    return bookmarkedPostIdxs; // 북마크한 posting_idx의 리스트 반환
	}

	public Vector<PostingBean> getBookmarkedPostings(List<Integer> bookmarkedPostIdxs) throws Exception {
		Vector<PostingBean> vlist = new Vector<PostingBean>();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        con = pool.getConnection();
	        // 게시물 인덱스를 기반으로 게시물의 상세 정보를 조회하는 SQL 쿼리입니다.
	        String sql = "SELECT * FROM posting WHERE posting_idx = ?";
	        
	        for (Integer postIdx : bookmarkedPostIdxs) {
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, postIdx);
	            rs = pstmt.executeQuery();

	            while (rs.next()) {
	                PostingBean posting = new PostingBean();
	                // ResultSet에서 가져온 데이터를 바탕으로 PostingBean 객체의 속성을 설정합니다.
	                posting.setPosting_idx(rs.getInt("posting_idx"));
	                posting.setManager_id(rs.getString("manager_id"));
	                posting.setPosting_type(rs.getString("posting_type"));
	                posting.setPosting_cname(rs.getString("posting_cname"));
	                posting.setPosting_name(rs.getString("posting_name"));
	                posting.setPosting_pcode(rs.getString("posting_pcode"));
	                posting.setPosting_address(rs.getString("posting_address"));
	                posting.setPosting_view(rs.getInt("posting_view"));
	                posting.setPosting_status(rs.getString("posting_status"));
	                // posting_datetime 속성을 설정하는 부분을 추가합니다.
	                posting.setPosting_datetime(rs.getString("posting_datetime"));
	                vlist.add(posting);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // 자원을 해제합니다.
	        if (rs != null) try { rs.close(); } catch (SQLException e) {}
	        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
	        if (con != null) pool.freeConnection(con);
	    }

	    return vlist;
	}

	
	public PostingBean getPostingByIdx(int postingIdx)throws Exception{
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    PostingBean posting = null;

	    try {
	        con = pool.getConnection();
	        String sql = "SELECT * FROM posting WHERE posting_idx = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, postingIdx);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            posting = new PostingBean();
	            posting.setPosting_idx(rs.getInt("posting_idx"));
	            posting.setManager_id(rs.getString("manager_id"));
	            posting.setPosting_type(rs.getString("posting_type"));
	            posting.setPosting_cname(rs.getString("posting_cname"));
	            posting.setPosting_name(rs.getString("posting_name"));
	            posting.setPosting_pcode(rs.getString("posting_pcode"));
	            posting.setPosting_address(rs.getString("posting_address"));
	            posting.setPosting_view(rs.getInt("posting_view"));
	            posting.setPosting_status(rs.getString("posting_status"));
	            posting.setPosting_datetime(rs.getString("posting_datetime"));
	            // 여기에 더 많은 필드를 설정할 수 있습니다.
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // 리소스 해제
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (con != null) pool.freeConnection(con);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return posting;
	}





}