package frameColor.model;

import java.sql.SQLException;
import java.util.List;

import frameColor.domain.FrameColorVO;

/**
 * 작성자 신예진 
 */
public interface FrameColorDAO {

	// 프레임컬러 정보 취득
	List<FrameColorVO> getFrameColorList() throws SQLException;

}
