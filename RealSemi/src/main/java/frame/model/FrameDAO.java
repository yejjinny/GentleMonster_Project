package frame.model;

import java.sql.SQLException;
import java.util.List;

import frame.domain.FrameVO;

public interface FrameDAO {

	// 프레임 정보 취득 _ 예진
	List<FrameVO> getFrameList() throws SQLException;

}
