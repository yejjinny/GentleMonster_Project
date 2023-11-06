package frame.model;

import java.sql.SQLException;
import java.util.List;

import frame.domain.FrameVO;

/**
 * 작성자 신예진
 */
public interface FrameDAO {

	// 프레임 정보 취득
	List<FrameVO> getFrameList() throws SQLException;

}
