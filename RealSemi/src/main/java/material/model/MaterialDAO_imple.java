package material.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import lenseColor.domain.LenseColorVO;
import material.domain.MaterialVO;

/**
 * 작성자 신예진
 */
public class MaterialDAO_imple implements MaterialDAO {
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 생성자
	public MaterialDAO_imple() {

		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/semi_oracle");

		} catch (NamingException e) {
			e.printStackTrace();
		}

	}

	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 소재 정보 취득
	@Override
	public List<MaterialVO> getMaterialList() throws SQLException {
		List<MaterialVO> materialList = new ArrayList<>();
		try {
			conn = ds.getConnection();

			String sql = "select materialId, materialName from tbl_Material order by materialId";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MaterialVO mvo = new MaterialVO();
				mvo.setMaterialId(rs.getInt("materialId"));
				mvo.setMaterialName(rs.getString("materialName"));
				materialList.add(mvo);
			} // end of while(rs.next())

		} finally {
			close();
		}
		return materialList;
	}

}
