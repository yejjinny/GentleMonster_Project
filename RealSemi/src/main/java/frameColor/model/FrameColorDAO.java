package frameColor.model;

import java.sql.SQLException;
import java.util.List;

import frameColor.domain.FrameColorVO;

public interface FrameColorDAO {

	// 프레임컬러 정보 취득용 _ 예진
	List<FrameColorVO> getFrameColorList() throws SQLException;

}
