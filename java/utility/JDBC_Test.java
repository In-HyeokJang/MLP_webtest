package utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBC_Test {
	public static void main(String[] args) {
		
    Connection con = DBOpen.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    // 테이블의 갯수 리턴
    String sql=" SELECT COUNT(*) cnt FROM information_schema.tables "
    		+ " WHERE table_schema = 'webtest'";
    
    try {
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
			System.out.println("현재 webtest DB에 생서된 테이블 갯수:"+ rs.getInt("cnt"));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		DBClose.close(rs, pstmt, con);
	}
}
}
