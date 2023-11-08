package product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import frameColor.domain.FrameColorVO;
import lenseColor.domain.LenseColorVO;
import material.domain.MaterialVO;
import product.domain.ProductDetailImageVO;
import product.domain.ProductVO;

public class ProductDAO_imple implements ProductDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 생성자
	public ProductDAO_imple() {

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
	
	
	/* 명진 추가 --------------------------------------------------------------------------------------------------------------*/

	// 상품전체보기 메소드
	@Override
	public List<ProductVO> getProductList(Map<String, Integer> paraMap) throws SQLException {

		List<ProductVO> productList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = " select    productDetailId, "
					+ " productGroupName||' '||frameColorEng as productName, pd.isbluelight,fk_productgroupid, "
					+ " price,    mainImageFile,    nvl2(wishid, 1, 0) as isWish, REGISTERDAY from "
					+ " tbl_productGroup pg "
					+ " join tbl_productDetail pd on pg.productGroupId = pd.fk_productGroupId "
					+ " join tbl_frameColor fc on fc.frameColorId = pd.fk_frameColorId "
					+ " left join (select * from tbl_wishList where fk_memberId = ? ) w on pd.productDetailId = w.fk_productDetailId "
					+ " where pg.FK_CATEGORYID = ? "
					+ " order by PRODUCTDETAILID desc ";

			pstmt = conn.prepareStatement(sql);

			if (paraMap.get("memberId") == null) {
				pstmt.setString(1, "");
			} else {
				pstmt.setInt(1, paraMap.get("memberId"));
			}

			pstmt.setInt(2, paraMap.get("categoryId"));

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductVO provo = new ProductVO();
				provo.setProductDetailId(rs.getInt(1));
				provo.setProductName(rs.getString(2));
				provo.setIsBlueLight(rs.getInt(3));
				provo.setFk_productGroupId(rs.getInt(4));
				provo.setPrice(rs.getLong(5));
				provo.setMainImageFile(rs.getString(6));
				provo.setIsWish(rs.getInt(7));
				provo.setRegisterDay(rs.getString(8));

				// System.out.println("test => " + provo.getIsBlueLight());
				/*
				 * System.out.println("test => " + provo.getProductDetailId());
				 * System.out.println("test => " + provo.getProductName());
				 */

				productList.add(provo);
			} // end of while(rs.next())-----------------

		} finally {
			close();
		}

		return productList;
	}// end of public List<ProductVO> getProductList() throws SQLException {}--------

	// 선글라스 개수 메소드
	@Override
	public List<ProductVO> getSunglassesCount() throws SQLException {

		List<ProductVO> sunglassesCount = new ArrayList<>(); // List로 초기화

		try {
			conn = ds.getConnection();

			String sql = " SELECT pg.productGroupId, COUNT(*) " + " FROM tbl_productGroup pg "
					+ " JOIN tbl_productDetail pd ON pg.productGroupId = pd.fk_productgroupId "
					+ " GROUP BY pg.productGroupId ";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductVO provo = new ProductVO();
				provo.setFk_productGroupId(rs.getInt(1));
				provo.setCount(rs.getInt(2));

				sunglassesCount.add(provo);
			} // end of while(rs.next())-----------------

		} finally {
			close();
		}

		return sunglassesCount;

	}

	// 필터 결과 갖고오기
	@Override
	public List<ProductVO> getfilterlist(Map<String, String> paraMap, Map<String, String[]> paraArrMap)
			throws SQLException {

		List<ProductVO> productList = new ArrayList<>(); // List로 초기화

		try {
			conn = ds.getConnection();

			String sql = " select  productDetailId, "
					+ " productGroupName||' '||frameColorEng as productName, pd.isbluelight,fk_productgroupid, "
					+ " price,    mainImageFile,    nvl2(wishid, 1, 0) as isWish from " + " tbl_productGroup pg "
					+ " join tbl_productDetail pd on pg.productGroupId = pd.fk_productGroupId "
					+ " join tbl_frameColor fc on fc.frameColorId = pd.fk_frameColorId "
					+ " join TBL_MATERIAL mr on mr.MATERIALID = pg.FK_MATERIALID "
					+ " join TBL_LENSECOLOR lc on lc.LENSECOLORID = pd.fk_LENSECOLORID "
					+ " left join (select * from tbl_wishList where fk_memberId = ? ) w on pd.productDetailId = w.fk_productDetailId "
					+ " where pg.FK_CATEGORYID = ? ";
			// + " order by 1 ";

			if (paraArrMap.get("frame_color") != null) {
				// frame_color 배열에 대한 작업
				sql += " and ";

				String[] frame_color = paraArrMap.get("frame_color");

				for (int i = 0; i < frame_color.length; i++) {
					if (i == 0) {
						sql += "( ";
					}
					sql += " Framecolorid = ? ";
					if (i != frame_color.length - 1) {
						sql += " or ";
					} else {
						sql += ") ";
					}
				}
			}

			if (paraArrMap.get("lens_color") != null) {
				// lens_color 배열에 대한 작업
				sql += " and ";

				String[] lens_color = paraArrMap.get("lens_color");

				for (int i = 0; i < lens_color.length; i++) {
					if (i == 0) {
						sql += "( ";
					}
					sql += "lenseColorId = ?";
					if (i != lens_color.length - 1) {
						sql += " or ";
					} else {
						sql += ") ";
					}
				}
			}

			if (paraArrMap.get("materials") != null) {
				// materials 배열에 대한 작업
				sql += " and ";

				String[] materials = paraArrMap.get("materials");

				for (int i = 0; i < materials.length; i++) {
					if (i == 0) {
						sql += "( ";
					}
					sql += "materialid = ?";
					if (i != materials.length - 1) {
						sql += " or ";
					} else {
						sql += ") ";
					}
				}
			}

			// 젠더 처리 하기

			if (paraArrMap.get("gender") != null) {
				// materials 배열에 대한 작업
				sql += " and ";

				String[] gender = paraArrMap.get("gender");

				for (int i = 0; i < gender.length; i++) {
					if (i == 0) {
						sql += "( ";
					}
					sql += "gender = ?";
					if (i != gender.length - 1) {
						sql += " or ";
					} else {
						sql += ") ";
					}
				}
			}

			// order by 정렬 처리하기

			sql += " ORDER BY " + paraMap.get("order") + ", PRODUCTDETAILID DESC";

			/* System.out.println("sql 확인 : " + sql); */

			// and ( Framecolorid = ? or Framecolorid = ? or Framecolorid = ? )
			// and ( lenseColorId = ? or lenseColorId = ? or lenseColorId = ?)
			// order by registerDay Desc
			/*
			 * fc.Framecolorid = 1 or fc.Framecolorid = 2 or lc_lenseColorId = 1 or
			 * lc_lenseColorId = 2
			 */

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, paraMap.get("memberId"));
			pstmt.setString(2, paraMap.get("categoryId"));
			int cnt = 2;

			// for문 써서 해결하기
			if (paraArrMap.get("frame_color") != null) {
				// frame_color 배열에 대한 작업

				String[] frame_color = paraArrMap.get("frame_color");

				for (int i = 0; i < frame_color.length; i++) {
					cnt++;
					pstmt.setString(cnt, frame_color[i]);

				}
			}

			if (paraArrMap.get("lens_color") != null) {
				// frame_color 배열에 대한 작업

				String[] lens_color = paraArrMap.get("lens_color");

				for (int i = 0; i < lens_color.length; i++) {
					cnt++;
					pstmt.setString(cnt, lens_color[i]);

				}
			}

			if (paraArrMap.get("materials") != null) {
				// frame_color 배열에 대한 작업

				String[] materials = paraArrMap.get("materials");

				for (int i = 0; i < materials.length; i++) {
					cnt++;
					pstmt.setString(cnt, materials[i]);

				}
			}

			if (paraArrMap.get("gender") != null) {
				// frame_color 배열에 대한 작업

				String[] gender = paraArrMap.get("gender");

				for (int i = 0; i < gender.length; i++) {
					cnt++;
					pstmt.setString(cnt, gender[i]);

				}
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductVO provo = new ProductVO();
				provo.setProductDetailId(rs.getInt(1));
				provo.setProductName(rs.getString(2));
				provo.setIsBlueLight(rs.getInt(3));
				provo.setFk_productGroupId(rs.getInt(4));
				provo.setPrice(rs.getLong(5));
				provo.setMainImageFile(rs.getString(6));
				provo.setIsWish(rs.getInt(7));

				productList.add(provo);

				/*
				 * System.out.println("test => " + provo.getProductName());
				 */

			} // end of while(rs.next())-----------------

		} finally {
			close();
		}

		return productList;

	}

	// 프레임컬러 가져오기
	@Override
	public List<FrameColorVO> getFrameColor(Map<String, Integer> paraMap) throws SQLException {

		List<FrameColorVO> getFrameColor = new ArrayList<>(); // List로 초기화

		try {
			conn = ds.getConnection();

			String sql = " select * " + "from TBL_FRAMECOLOR ";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				FrameColorVO framevo = new FrameColorVO();
				framevo.setFrameColorId(rs.getInt(1));
				framevo.setFrameColorEng(rs.getString(2));
				framevo.setFrameColorKor(rs.getString(3));

				getFrameColor.add(framevo);
			} // end of while(rs.next())-----------------

		} finally {
			close();
		}

		return getFrameColor;
	}

	@Override
	public List<LenseColorVO> getLenseColor(Map<String, Integer> paraMap) throws SQLException {

		List<LenseColorVO> getLenseColor = new ArrayList<>(); // List로 초기화

		try {
			conn = ds.getConnection();

			String sql = " select * " + " from TBL_LENSECOLOR ";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				LenseColorVO lensevo = new LenseColorVO();
				lensevo.setLenseColorId(rs.getInt(1));
				lensevo.setLenseColorEng(rs.getString(2));
				lensevo.setLenseColorKor(rs.getString(3));

				getLenseColor.add(lensevo);
			} // end of while(rs.next())-----------------

		} finally {
			close();
		}

		return getLenseColor;
	}

	// 소재 이름 가져오기
	@Override
	public List<MaterialVO> getMaterial(Map<String, Integer> paraMap) throws SQLException {

		List<MaterialVO> getMaterial = new ArrayList<>(); // List로 초기화

		try {
			conn = ds.getConnection();

			String sql = " select * " + " from TBL_material ";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				MaterialVO materialvo = new MaterialVO();
				materialvo.setMaterialId(rs.getInt(1));
				materialvo.setMaterialName(rs.getString(2));

				getMaterial.add(materialvo);
			} // end of while(rs.next())-----------------

		} finally {
			close();
		}

		return getMaterial;
	}

	// 프레임,틴트,선물 카테고리 알아오기
	@Override
	public List<ProductVO> searchCategoryList(Map<String, String> paraMap2, Map<String, Integer> paraMap)
			throws SQLException {

		List<ProductVO> productList = new ArrayList<>();

		String colName = paraMap2.get("colName");

		try {
			conn = ds.getConnection();

			String sql = " select  productDetailId, "
					+ " productGroupName||' '||frameColorEng as productName, pd.isBluelight,fk_productgroupid, "
					+ " price,  mainImageFile,  nvl2(wishid, 1, 0) as isWish, fk_FRAMEID ,istint, isgift  from "
					+ " tbl_productGroup pg "
					+ " join tbl_productDetail pd on pg.productGroupId = pd.fk_productGroupId "
					+ " join tbl_frameColor fc on fc.frameColorId = pd.fk_frameColorId "
					+ " left join (select * from tbl_wishList where fk_memberId = ? ) w on pd.productDetailId = w.fk_productDetailId "
					+ " where pg.FK_CATEGORYID = ? and " + colName + "= ?  order by PRODUCTDETAILID  desc ";

			pstmt = conn.prepareStatement(sql);

			
			if(paraMap.get("memberId") == 0) {
				pstmt.setString(1,"");
			}
			else {
				pstmt.setInt(1, paraMap.get("memberId"));
			}

			pstmt.setInt(2, paraMap.get("categoryId"));

			pstmt.setString(3, paraMap2.get("value"));

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductVO provo = new ProductVO();
				provo.setProductDetailId(rs.getInt(1));
				provo.setProductName(rs.getString(2));
				provo.setIsBlueLight(rs.getInt(3));
				provo.setFk_productGroupId(rs.getInt(4));
				provo.setPrice(rs.getLong(5));
				provo.setMainImageFile(rs.getString(6));
				provo.setIsWish(rs.getInt(7));
				provo.setFk_frameId(rs.getInt(8));
				provo.setIsTint(rs.getInt(9));
				provo.setIsGift(rs.getInt(10));

				/* System.out.println("test => " + provo.getIsBlueLight()); */
				/*
				 * System.out.println("test => " + provo.getProductDetailId());
				 * System.out.println("test => " + provo.getProductName());
				 */

				productList.add(provo);
			} // end of while(rs.next())-----------------

		} finally {
			close();
		}

		return productList;
	}

	// 베스트셀러 카테고리
	@Override
	public List<ProductVO> getBestSeller(Map<String, Integer> paraMap) throws SQLException {

		List<ProductVO> productList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = " SELECT * " + " FROM ( " + "    SELECT "
					+ "        row_number() over (order by quantity desc) as rno, " + "        pd.productDetailId, "
					+ "        t.quantity, " + "        productGroupName || ' ' || frameColorEng as productName, "
					+ "        pg.price, " + "        pd.mainImageFile, " + "        nvl2(w.wishid, 1, 0) as isWish,"
					+ "        fk_productGroupId " + "    FROM ( " + "        SELECT "
					+ "            fk_productDetailId, " + "            sum(quantity) as quantity "
					+ "        FROM tbl_orderDetail " + "        GROUP BY fk_productDetailId " + "    ) t "
					+ "    JOIN tbl_productDetail pd ON t.fk_productDetailId = pd.productDetailId "
					+ "    JOIN tbl_productGroup pg ON pd.fk_productGroupId = pg.productGroupId "
					+ "    JOIN tbl_frameColor fc ON pd.fk_frameColorId = fc.frameColorId "
					+ "    LEFT JOIN (SELECT * FROM tbl_wishList WHERE fk_memberId = ?) w ON pd.productDetailId = w.fk_productDetailId "
					+ "    where FK_CATEGORYID = ?) " + " WHERE rno <= 3 ";

			pstmt = conn.prepareStatement(sql);

			if(paraMap.get("memberId") == 0) {
				pstmt.setString(1,"");
			}
			else {
				pstmt.setInt(1, paraMap.get("memberId"));
			}

			pstmt.setInt(2, paraMap.get("categoryId"));

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductVO provo = new ProductVO();
				provo.setRno(rs.getLong(1));
				provo.setProductDetailId(rs.getInt(2));
				provo.setQuantity(rs.getInt(3));
				provo.setProductName(rs.getString(4));
				provo.setPrice(rs.getLong(5));
				provo.setMainImageFile(rs.getString(6));
				provo.setIsWish(rs.getInt(7));
				provo.setFk_productGroupId(rs.getInt(8));

				productList.add(provo);

				/*
				 * System.out.println("확인용" + provo.getMainImageFile());
				 * System.out.println("확인용" + provo.getQuantity()); System.out.println("확인용" +
				 * provo.getProductName()); System.out.println("확인용" + provo.getPrice());
				 */

			}

		} finally {
			close();
		}

		return productList;

	}
	
	
	/* 명진 추가 --------------------------------------------------------------------------------------------------------------*/
	
	/*
	    * 예진 추가_ 상세화면 정보
	    * -----------------------------------------------------------------------------
	    * -------------
	    */
	   @Override
	   public ProductVO getProductDetail(Map<String, Integer> paraMap) throws SQLException {
	      ProductVO pvo = new ProductVO();

	      try {
	         conn = ds.getConnection();

	         String sql = "select " + "productDetailId, productGroupId, "
	               + "productGroupName || ' ' || frameColorEng as productName, description, "
	               + "price, silhouette, detail, "
	               + "frameSize, templeLength, lenseWidthSize, lenseHeightSize, bridge, "
	               + "stock, isMirror, isBlueLight, " + "mainImageFile, " + "nvl2(wishid, 1, 0) as isWish "
	               + "from tbl_productGroup pg "
	               + "join tbl_productDetail pd on pg.productGroupId = pd.fk_productGroupId "
	               + "join tbl_frameColor fc on fc.frameColorId = pd.fk_frameColorId "
	               + "left join (select * from tbl_wishList where fk_memberId = ? ) w on pd.productDetailId = w.fk_productDetailId "
	               + "where productDetailId = ?";
//	         String sql = "select " + "productDetailId, productGroupId, "
//	               + "productGroupName || ' ' || frameColorEng as productName, description, "
//	               + "price, silhouette, detail, "
//	               + "frameSize, templeLength, lenseWidthSize, lenseHeightSize, bridge, "
//	               + "stock, isMirror, isBlueLight, " + "mainImageFile " + "from tbl_productGroup pg "
//	               + "join tbl_productDetail pd on pg.productGroupId = pd.fk_productGroupId "
//	               + "join tbl_frameColor fc on fc.frameColorId = pd.fk_frameColorId " + "where productDetailId = ?";

	         pstmt = conn.prepareStatement(sql);
	         
	         if (paraMap.get("memberId") == null) {
	            pstmt.setString(1, "");
	         } else {
	            pstmt.setInt(1, paraMap.get("memberId"));
	         }
	         pstmt.setInt(2, paraMap.get("productDetailId"));

	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            pvo.setProductDetailId(rs.getInt("productDetailId"));
	            pvo.setFk_productGroupId(rs.getInt("productGroupId"));
	            pvo.setProductName(rs.getString("productName"));
	            pvo.setDescription(rs.getString("description"));
	            pvo.setPrice(rs.getLong("price"));
	            pvo.setSilhouette(rs.getString("silhouette"));
	            ;
	            pvo.setDetail(rs.getString("detail"));
	            pvo.setFrameSize(rs.getDouble("frameSize"));
	            pvo.setTempleLength(rs.getDouble("templeLength"));
	            pvo.setLenseWidthSize(rs.getDouble("lenseWidthSize"));
	            pvo.setLenseHeightSize(rs.getDouble("lenseHeightSize"));
	            pvo.setBridge(rs.getDouble("bridge"));
	            pvo.setStock(rs.getInt("stock"));
	            pvo.setIsMirror(rs.getInt("isMirror"));
	            pvo.setIsBlueLight(rs.getInt("isBlueLight"));
	            pvo.setMainImageFile(rs.getString("mainImageFile"));
	            
	            pvo.setIsWish(rs.getInt("isWish"));
	         } // end of if(rs.next())-----------------

	      } finally {
	         close();
	      }

	      return pvo;
	   }

	   @Override
	   public List<ProductDetailImageVO> getProductDetailImageList(Map<String, Integer> paraMap) throws SQLException {

	      List<ProductDetailImageVO> pdiList = new ArrayList<>();

	      try {
	         conn = ds.getConnection();

	         String sql = "select fk_productDetailId, imageFile from tbl_productDetailImage where fk_productDetailId = ? order by position";

	         pstmt = conn.prepareStatement(sql);

	         pstmt.setInt(1, paraMap.get("productDetailId"));

	         rs = pstmt.executeQuery();

	         while (rs.next()) {
	            ProductDetailImageVO pdivo = new ProductDetailImageVO();
	            pdivo.setProductDetailId(rs.getInt("fk_productDetailId"));
	            pdivo.setImageFile(rs.getString("imageFile"));

	            pdiList.add(pdivo);
	         } // end of while(rs.next())-----------------

	      } finally {
	         close();
	      }

	      return pdiList;
	   }

	   @Override
	   public List<ProductVO> getOtherProductList(Map<String, Integer> paraMap) throws SQLException {
	      List<ProductVO> otherList = new ArrayList<>();

	      try {
	         conn = ds.getConnection();

	         String sql = "select " + "productDetailId, mainImageFile "
	               + "from tbl_productdetail where fk_productgroupid = ? and productDetailId != ?";

	         pstmt = conn.prepareStatement(sql);

	         pstmt.setInt(1, paraMap.get("productGroupId"));
	         pstmt.setInt(2, paraMap.get("productDetailId"));

	         rs = pstmt.executeQuery();

	         while (rs.next()) {
	            ProductVO pvo = new ProductVO();
	            pvo.setProductDetailId(rs.getInt("productDetailId"));
	            pvo.setMainImageFile(rs.getString("mainImageFile"));

	            otherList.add(pvo);
	         } // end of while(rs.next())-----------------

	      } finally {
	         close();
	      }

	      return otherList;
	   }

	   /*
	    * end of 예진 추가_ 상세화면 정보
	    * -----------------------------------------------------------------------------
	    * -------
	    */

	   /*
	    * 예진 추가_ 상품등록
	    * 정보---------------------------------------------------------------------------
	    * ---------------
	    */

	   @Override
	   public List<ProductVO> getProductNameList(String categoryId) throws SQLException {
	      List<ProductVO> productNameList = new ArrayList<>();

	      try {
	         conn = ds.getConnection();

	         String sql = "select " + "productGroupId, productGroupName "
	               + "from tbl_productGroup where isDeleted = 0 and fk_categoryId = ?";

	         pstmt = conn.prepareStatement(sql);

	         pstmt.setString(1, categoryId);

	         rs = pstmt.executeQuery();

	         while (rs.next()) {
	            ProductVO pvo = new ProductVO();
	            pvo.setFk_productGroupId(rs.getInt("productGroupId"));
	            pvo.setProductGroupName(rs.getString("productGroupName"));
	            productNameList.add(pvo);
	         } // end of while(rs.next())-----------------

	      } finally {
	         close();
	      }

	      return productNameList;
	   }

	   @Override
	   public ProductVO getProductGroupDetail(String productGroupId) throws SQLException {
	      ProductVO pvo = new ProductVO();

	      try {
	         conn = ds.getConnection();

	         String sql = "select " + "fk_categoryId, fk_frameId, fk_materialId, " + "silhouette, detail, price, "
	               + "frameSize, templeLength, " + "lensewidthsize, lenseheightsize, bridge "
	               + "from tbl_productgroup " + "where productGroupId = ?";

	         pstmt = conn.prepareStatement(sql);

	         pstmt.setString(1, productGroupId);

	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            pvo.setCategoryId(rs.getInt("fk_categoryId"));
	            pvo.setFrameId(rs.getInt("fk_frameId"));
	            pvo.setPrice(rs.getLong("price"));
	            pvo.setMaterialId(rs.getInt("fk_materialId"));
	            pvo.setSilhouette(rs.getString("silhouette"));
	            pvo.setDetail(rs.getString("detail"));
	            pvo.setFrameSize(rs.getDouble("frameSize"));
	            pvo.setTempleLength(rs.getDouble("templeLength"));
	            pvo.setLenseWidthSize(rs.getDouble("lensewidthsize"));
	            pvo.setLenseHeightSize(rs.getDouble("lenseheightsize"));
	            pvo.setBridge(rs.getDouble("bridge"));
	         } // end of while(rs.next())-----------------

	      } finally {
	         close();
	      }

	      return pvo;
	   }

	   @Override
	   public int insertProductDetail(Map<String, String> paraMap, List<ProductDetailImageVO> detailImageList)
	         throws SQLException {
	      int num = 0;

	      try {

	         conn = ds.getConnection();

	         // 유저가 입력한 값이 이미 존재하고 있을 경우
	         String sql = "select productDetailId, count(*) from tbl_productDetail where fk_productgroupid = ? and fk_framecolorid = ? and  fk_lensecolorid = ? group by productDetailId";

	         pstmt = conn.prepareStatement(sql);

	         pstmt.setString(1, paraMap.get("productGroupId"));
	         pstmt.setString(2, paraMap.get("frameColorId"));
	         pstmt.setString(3, paraMap.get("lenseColorId"));

	         rs = pstmt.executeQuery();
	         int productDetailId = 0;

	         if (rs.next()) {
	            num = rs.getInt(2);
	            productDetailId = rs.getInt(1);
	         }

	         if (num == 1) {
	            // 유저가 입력한 게 이미 존재할 경우 update를 실행한다

	            pstmt.clearParameters();

	            if (paraMap.get("mainImageFile") != null && !paraMap.get("mainImageFile").isEmpty()) {
	               // 유저가 메인이미지파일을 변경하려고 할 경우

	               sql = "update tbl_productDetail set stock = ?, mainImageFile = ? where productDetailId = ? ";
	               pstmt = conn.prepareStatement(sql);

	               pstmt.setString(1, paraMap.get("stock"));
	               pstmt.setString(2, paraMap.get("mainImageFile"));
	               pstmt.setInt(3, productDetailId);

	            } else {

	               sql = "update tbl_productDetail set stock = ? where productDetailId = ? ";
	               pstmt = conn.prepareStatement(sql);

	               pstmt.setString(1, paraMap.get("stock"));
	               pstmt.setInt(2, productDetailId);
	            }

	            num = pstmt.executeUpdate();

	            if (num != 0 && detailImageList.size() != 0) {
	               // 업데이트 완료 및 상세이미지 수정 시 상세이미지 업데이트

	               for (int i = 0; i < detailImageList.size(); i++) {
	                  pstmt.clearParameters();

	                  sql = "select count(*) from tbl_productDetailImage where fk_productDetailId = ? and position = ?";
	                  pstmt = conn.prepareStatement(sql);

	                  pstmt.setInt(1, productDetailId);
	                  pstmt.setInt(2, detailImageList.get(i).getPosition());

	                  rs = pstmt.executeQuery();

	                  rs.next();

	                  num = rs.getInt(1);

	                  if (num != 0) {
	                     // 이미 상세이미지가 등록이 되어있으니 업데이트문으로 수정해줘야한다

	                     sql = "update tbl_productDetailImage set imageFile = ? where fk_productDetailId = ? and position = ?";

	                     pstmt = conn.prepareStatement(sql);

	                     pstmt.setString(1, detailImageList.get(i).getImageFile());
	                     pstmt.setInt(2, productDetailId);
	                     pstmt.setInt(3, detailImageList.get(i).getPosition());

	                     num = pstmt.executeUpdate();
	                  } else {
	                     // 상세 이미지가 등록되어있지 않으니 insert문으로 등록해줘야한다

	                     sql = "insert into tbl_productDetailImage values (seq_productDetailImage.nextval, ?, ?, ?)";

	                     pstmt = conn.prepareStatement(sql);

	                     pstmt.setInt(1, productDetailId);
	                     pstmt.setString(2, detailImageList.get(i).getImageFile());
	                     pstmt.setInt(3, detailImageList.get(i).getPosition());

	                     num = pstmt.executeUpdate();
	                  }

	               }

	            }

	         } else {
	            // 존재하지 않을 경우 (새로운 프레임컬러와 렌즈컬러를 설정했을 경우)

	            pstmt.clearParameters();

	            sql = "insert into tbl_productDetail values (seq_productDetail.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, ?, ?, default, null)";

	            pstmt = conn.prepareStatement(sql);

	            pstmt.setString(1, paraMap.get("productGroupId"));
	            pstmt.setString(2, paraMap.get("frameColorId"));
	            pstmt.setString(3, paraMap.get("lenseColorId"));
	            pstmt.setString(4, paraMap.get("gender"));
	            pstmt.setString(5, paraMap.get("isMirror"));
	            pstmt.setString(6, paraMap.get("description"));
	            pstmt.setString(7, paraMap.get("isTint"));
	            pstmt.setString(8, paraMap.get("isGift"));
	            pstmt.setString(9, paraMap.get("isBlueLight"));
	            pstmt.setString(10, paraMap.get("stock"));
	            pstmt.setString(11, paraMap.get("isIndex"));
	            pstmt.setString(12, paraMap.get("mainImageFile"));

	            num = pstmt.executeUpdate();

	            if (num == 1 && detailImageList.size() != 0) {
	               // 상품 상세사진을 등록했을 경우

	               pstmt.clearParameters();

	               // 위에서 insert한 productDetailId를 가져오기 위해
	               sql = "select productDetailId from tbl_productDetail where fk_productGroupId = ? and fk_frameColorId = ? and fk_lenseColorId = ?";

	               pstmt = conn.prepareStatement(sql);

	               pstmt.setString(1, paraMap.get("productGroupId"));
	               pstmt.setString(2, paraMap.get("frameColorId"));
	               pstmt.setString(3, paraMap.get("lenseColorId"));

	               rs = pstmt.executeQuery();

	               rs.next();

	               productDetailId = rs.getInt(1);

	               if (productDetailId != 0) {

	                  for (int i = 0; i < detailImageList.size(); i++) {

	                     pstmt.clearParameters();

	                     sql = "insert into tbl_productDetailImage values (seq_productDetailImage.nextval, "
	                           + productDetailId + ", ?, ?)";

	                     pstmt = conn.prepareStatement(sql);

	                     pstmt.setString(1, detailImageList.get(i).getImageFile());
	                     pstmt.setInt(2, detailImageList.get(i).getPosition());

	                     num = pstmt.executeUpdate();

	                  }

	               }

	            }
	         }

	      } finally {
	         close();
	      }

	      return num;
	   }

	   @Override
	   public int insertProductGroupAndDetail(Map<String, String> paraMap, List<ProductDetailImageVO> detailImageList)
	         throws SQLException {
	      // 상품명 추가로 새로운 상품을 등록하는 경우
	      int num = 0;

	      try {
	         conn = ds.getConnection();
	         // 같은 이름의 상품그룹명이 있는 지 확인
	         String sql = "select count(*) from tbl_productgroup where productGroupName = ?";

	         pstmt = conn.prepareStatement(sql);

	         pstmt.setString(1, paraMap.get("addProductNameInput"));

	         rs = pstmt.executeQuery();

	         rs.next();

	         num = rs.getInt(1);

	         if (num == 1) {
	            // 유저가 입력한 게 이미 존재할 경우 에러다
	            num = 0;
	            return num;

	         } else {
	            // 존재하지 않을 경우 productGroup을 새로 등록한다
	            pstmt.clearParameters();

	            sql = "insert into tbl_productGroup values (seq_productGroup.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, default, null)";

	            pstmt = conn.prepareStatement(sql);

	            pstmt.setString(1, paraMap.get("categoryId"));
	            pstmt.setString(2, paraMap.get("addProductNameInput"));
	            pstmt.setString(3, paraMap.get("price"));
	            pstmt.setString(4, paraMap.get("frameId"));
	            pstmt.setString(5, paraMap.get("materialId"));
	            pstmt.setString(6, paraMap.get("silhouette"));
	            pstmt.setString(7, paraMap.get("detail"));
	            pstmt.setString(8, paraMap.get("frameSize"));
	            pstmt.setString(9, paraMap.get("templeLength"));
	            pstmt.setString(10, paraMap.get("lenseWidthSize"));
	            pstmt.setString(11, paraMap.get("lenseHeightSize"));
	            pstmt.setString(12, paraMap.get("bridge"));

	            num = pstmt.executeUpdate();

	            if (num == 1) {
	               // productDetail 테이블에 등록하기 위해 위에서 등록한 productGroupId를 가져오도록 한다
	               pstmt.clearParameters();

	               sql = "select productGroupId from tbl_productGroup where productGroupName = ?";

	               pstmt = conn.prepareStatement(sql);

	               pstmt.setString(1, paraMap.get("addProductNameInput"));

	               rs = pstmt.executeQuery();
	               int productGroupId = 0;
	               if (rs.next()) {
	                  productGroupId = rs.getInt(1);
	               }

	               if (productGroupId != 0) {
	                  // productGroup 테이블에서 productGroupId를 잘 가져왔다면 productDetail테이블에 등록한다
	                  pstmt.clearParameters();

	                  sql = "insert into tbl_productDetail values (seq_productDetail.nextval, " + productGroupId
	                        + ", ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, ?, ?, default, null)";

	                  pstmt = conn.prepareStatement(sql);

	                  pstmt.setString(1, paraMap.get("frameColorId"));
	                  pstmt.setString(2, paraMap.get("lenseColorId"));
	                  pstmt.setString(3, paraMap.get("gender"));
	                  pstmt.setString(4, paraMap.get("isMirror"));
	                  pstmt.setString(5, paraMap.get("description"));
	                  pstmt.setString(6, paraMap.get("isTint"));
	                  pstmt.setString(7, paraMap.get("isGift"));
	                  pstmt.setString(8, paraMap.get("isBlueLight"));
	                  pstmt.setString(9, paraMap.get("stock"));
	                  pstmt.setString(10, paraMap.get("isIndex"));
	                  pstmt.setString(11, paraMap.get("mainImageFile"));

	                  num = pstmt.executeUpdate();

	                  if (num == 1 && detailImageList.size() != 0) {

	                     pstmt.clearParameters();

	                     sql = "select productDetailId from tbl_productDetail where fk_productGroupId = "
	                           + productGroupId + " and fk_frameColorId = ? and fk_lenseColorId = ?";

	                     pstmt = conn.prepareStatement(sql);

	                     pstmt.setString(1, paraMap.get("frameColorId"));
	                     pstmt.setString(2, paraMap.get("lenseColorId"));

	                     rs = pstmt.executeQuery();

	                     rs.next();

	                     int productDetailId = rs.getInt(1);

	                     if (productDetailId != 0) {

	                        for (int i = 0; i < detailImageList.size(); i++) {
	                           pstmt.clearParameters();

	                           sql = "insert into tbl_productDetailImage values (seq_productDetailImage.nextval, "
	                                 + productDetailId + ", ?, ?)";

	                           pstmt = conn.prepareStatement(sql);

	                           pstmt.setString(1, detailImageList.get(i).getImageFile());
	                           pstmt.setInt(2, detailImageList.get(i).getPosition());

	                           num = pstmt.executeUpdate();

	                        }
	                     }
	                  }

	               }

	            }
	         }

	      } finally {
	         close();
	      }

	      return num;
	   }

	   @Override
	   public ProductVO getProductGroupAndDetail(Map<String, String> paraMap) throws SQLException {
	      ProductVO pvo = new ProductVO();

	      try {
	         conn = ds.getConnection();

	         String sql = "select " + "productDetailId, fk_categoryId, fk_frameId, fk_materialId, "
	               + "silhouette, detail, price, " + "frameSize, templeLength, "
	               + "lensewidthsize, lenseheightsize, bridge, "
	               + "gender, isMirror, isTint, isBlueLight, isIndex, isGift, description, stock, mainImageFile "
	               + "from tbl_productgroup pg "
	               + "join tbl_productDetail pd on pg.productGroupId = pd.fk_productGroupId "
	               + "where fk_categoryId = ? and productGroupId = ? and fk_frameColorId = ? and fk_lenseColorId = ? ";

	         pstmt = conn.prepareStatement(sql);

	         pstmt.setString(1, paraMap.get("categoryId"));
	         pstmt.setString(2, paraMap.get("productGroupId"));
	         pstmt.setString(3, paraMap.get("frameColorId"));
	         pstmt.setString(4, paraMap.get("lenseColorId"));

	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            pvo.setProductDetailId(rs.getInt("productDetailId"));
	            pvo.setCategoryId(rs.getInt("fk_categoryId"));
	            pvo.setFrameId(rs.getInt("fk_frameId"));
	            pvo.setPrice(rs.getLong("price"));
	            pvo.setMaterialId(rs.getInt("fk_materialId"));
	            pvo.setSilhouette(rs.getString("silhouette"));
	            pvo.setDetail(rs.getString("detail"));
	            pvo.setFrameSize(rs.getDouble("frameSize"));
	            pvo.setTempleLength(rs.getDouble("templeLength"));
	            pvo.setLenseWidthSize(rs.getDouble("lensewidthsize"));
	            pvo.setLenseHeightSize(rs.getDouble("lenseheightsize"));
	            pvo.setBridge(rs.getDouble("bridge"));

	            pvo.setGender(rs.getString("gender"));
	            pvo.setIsMirror(rs.getInt("isMirror"));
	            pvo.setIsTint(rs.getInt("isTint"));
	            pvo.setIsBlueLight(rs.getInt("isBlueLight"));
	            pvo.setIsIndex(rs.getInt("isIndex"));
	            pvo.setIsGift(rs.getInt("isGift"));
	            pvo.setDescription(rs.getString("description"));
	            pvo.setStock(rs.getInt("stock"));
	            pvo.setMainImageFile(rs.getString("mainImageFile"));
	         } // end of while(rs.next())-----------------

	      } finally {
	         close();
	      }

	      return pvo;
	   }

	   /*
	    * end of 예진 추가_ 상품등록 정보
	    * -----------------------------------------------------------------------------
	    * -------
	    */

	
	
	
}
