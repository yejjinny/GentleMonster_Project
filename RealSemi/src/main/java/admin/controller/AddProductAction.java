package admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;

import category.model.CategoryDAO;
import category.model.CategoryDAO_imple;
import common.controller.AbstractController;
import frame.model.FrameDAO;
import frame.model.FrameDAO_imple;
import frameColor.model.FrameColorDAO;
import frameColor.model.FrameColorDAO_imple;
import lenseColor.model.LenseColorDAO;
import lenseColor.model.LenseColorDAO_imple;
import material.model.MaterialDAO;
import material.model.MaterialDAO_imple;
import member.domain.MemberVO;
import product.domain.ProductDetailImageVO;
import product.domain.ProductVO;
import product.model.ProductDAO;
import product.model.ProductDAO_imple;

/*@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 50, // 50메가
		maxRequestSize = 1024 * 1024 * 50 * 5 // 50메가 5개까지
)*/
public class AddProductAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 테스트용 코드 시작

		MemberVO loginUser = new MemberVO();

		loginUser.setEmail("admin@naver.com");
		loginUser.setMemberId(1111);
		loginUser.setGrade(2);

		HttpSession session = req.getSession();

		session.setAttribute("loginUser", loginUser);
		// 테스트용 코드 끝

		if (session.getAttribute("loginUser") != null
				&& ((MemberVO) session.getAttribute("loginUser")).getGrade() == 2) {
			// 로그인 및 관리자등급일 경우

			if ("GET".equalsIgnoreCase(req.getMethod())) {
				// GET으로 들어온 경우 = 정상적으로 들어온 경우

				FrameDAO fdao = new FrameDAO_imple();
				FrameColorDAO fcdao = new FrameColorDAO_imple();
				LenseColorDAO lcdao = new LenseColorDAO_imple();
				MaterialDAO mdao = new MaterialDAO_imple();
				CategoryDAO cdao = new CategoryDAO_imple();
				ProductDAO pdao = new ProductDAO_imple();
				
				// 화면 초기설정값
				req.setAttribute("frameList", fdao.getFrameList());
				req.setAttribute("frameColorList", fcdao.getFrameColorList());
				req.setAttribute("lenseColorList", lcdao.getLenseColorList());
				req.setAttribute("materialList", mdao.getMaterialList());
				req.setAttribute("categoryList", cdao.getCategoryList());

				super.setRedirect(false);
				super.setViewPage("/jsp/admin/addProduct.jsp");
				
				// addProduct.jsp 에서 카테고리를 선택했을 경우
				if (req.getParameter("categoryId") != null && !req.getParameter("categoryId").isEmpty()) {
					
					// 카테고리에 해당하는 상품명 리스트를 가져온다
					List<ProductVO> productNameList = pdao.getProductNameList(req.getParameter("categoryId"));

					JSONArray jsonArr = new JSONArray();

					for (ProductVO pvo : productNameList) {
						// ajax에 넘겨줄 json 값 설정위해 생성
						JSONObject jsonObj = new JSONObject(); // {}

						jsonObj.put("productGroupId", pvo.getFk_productGroupId());
						jsonObj.put("productGroupName", pvo.getProductGroupName());

						jsonArr.put(jsonObj);
					}

					// jsonArr를 설정한다
					req.setAttribute("json", jsonArr.toString());

					super.setRedirect(false);
					super.setViewPage("/jsp/common/jsonview.jsp");

				}
				
				// addProduct.jsp 에서 상품명을 선택했을 경우
				if (req.getParameter("productGroupId") != null && !req.getParameter("productGroupId").isEmpty()) {
					ProductVO pvo = pdao.getProductGroupDetail(req.getParameter("productGroupId"));

					// ajax에 넘겨줄 json 값 설정위해 생성
					JSONObject jsonObj = new JSONObject(); // {}

					jsonObj.put("categoryId", pvo.getCategoryId());
					jsonObj.put("frameId", pvo.getFrameId());
					jsonObj.put("materialId", pvo.getMaterialId());
					jsonObj.put("silhouette", pvo.getSilhouette());
					jsonObj.put("detail", pvo.getDetail());
					jsonObj.put("price", pvo.getPrice());
					jsonObj.put("frameSize", pvo.getFrameSize());
					jsonObj.put("templeLength", pvo.getTempleLength());
					jsonObj.put("lenseWidthSize", pvo.getLenseWidthSize());
					jsonObj.put("lenseHeightSize", pvo.getLenseHeightSize());
					jsonObj.put("bridge", pvo.getBridge());

					// jsonArr를 설정한다
					req.setAttribute("json", jsonObj.toString());

					super.setRedirect(false);
					super.setViewPage("/jsp/common/jsonview.jsp");

				}
				
				// addProduct.jsp 에서 프레임컬러, 렌즈컬러를 선택했을 경우
				if (req.getParameter("frameColor") != null && !req.getParameter("lenseColor").isEmpty()) {

					Map<String, String> paraMap = new HashMap<>();
					
					// dao에 넘겨줄 파라미터 값을 저장한다
					paraMap.put("frameColorId", req.getParameter("frameColor"));
					paraMap.put("lenseColorId", req.getParameter("lenseColor"));
					paraMap.put("productGroupId", req.getParameter("productGroupId"));
					paraMap.put("categoryId", req.getParameter("category"));

					ProductVO pvo = pdao.getProductGroupAndDetail(paraMap);

					// ajax에 넘겨줄 json 값 설정위해 생성
					JSONObject jsonObj = new JSONObject(); // {}
					
					if (pvo.getCategoryId() != 0) {
						// 유저가 입력한 값의 상품이 이미 존재하여 그 데이터를 보여주고 싶을 경우

						jsonObj.put("isExist", true);

						jsonObj.put("categoryId", pvo.getCategoryId());
						jsonObj.put("frameId", pvo.getFrameId());
						jsonObj.put("materialId", pvo.getMaterialId());
						jsonObj.put("silhouette", pvo.getSilhouette());
						jsonObj.put("detail", pvo.getDetail());
						jsonObj.put("price", pvo.getPrice());
						jsonObj.put("frameSize", pvo.getFrameSize());
						jsonObj.put("templeLength", pvo.getTempleLength());
						jsonObj.put("lenseWidthSize", pvo.getLenseWidthSize());
						jsonObj.put("lenseHeightSize", pvo.getLenseHeightSize());
						jsonObj.put("bridge", pvo.getBridge());

						jsonObj.put("gender", pvo.getGender());
						jsonObj.put("isMirror", pvo.getIsMirror());
						jsonObj.put("isTint", pvo.getIsTint());
						jsonObj.put("isBlueLight", pvo.getIsBlueLight());
						jsonObj.put("isIndex", pvo.getIsIndex());
						jsonObj.put("isGift", pvo.getIsGift());
						jsonObj.put("description", pvo.getDescription());
						jsonObj.put("stock", pvo.getStock());

						jsonObj.put("mainImageFile", pvo.getMainImageFile());
						
						// 상품 상세이미지 정보를 취득하기 위해 파라미터값을 저장한다
						Map<String, Integer> paraMap2 = new HashMap<>();
						paraMap2.put("productDetailId", pvo.getProductDetailId());
						
						// 상품 상세이미지 정보를 취득한다
						List<ProductDetailImageVO> detailImageList = pdao.getProductDetailImageList(paraMap2);
						
						// jsonObj에 등록하기 위해 생성
						JSONArray jsonArr = new JSONArray();
						
						for (int i = 0; i < detailImageList.size(); i++) {
							// jsonArr에 등록하기 위해 생성
							JSONObject jsonDetailObj = new JSONObject();
							
							jsonDetailObj.put("imageFile" + (i + 1), detailImageList.get(i).getImageFile());
							
							//jsonArr에 등록
							jsonArr.put(jsonDetailObj);
						}

						jsonObj.put("detailImageList", jsonArr);
					}else {
						// 존재하지 않아 유저가 추가로 입력해야할 경우
						
						jsonObj.put("isExist", false);
					}

					// jsonArr를 설정한다
					req.setAttribute("json", jsonObj.toString());

					super.setRedirect(false);
					super.setViewPage("/jsp/common/jsonview.jsp");

				}

			} else {
				// POST로 들어온 경우 = 상품 등록 버튼을 눌렀을 경우

				Map<String, String> paraMap = new HashMap<>();

				// 30Mbyte 제한
				int maxSize = 1024 * 1024 * 30;
				String fsl = "/";
				// C:\NCS\workspace_jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\TempSemi
				String root = req.getSession().getServletContext().getRealPath(fsl);

				// C:\NCS\workspace_jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\TempSemi\image\
				String rootPath = root + fsl + "image" + fsl;
				
				// 저장할 폴더 (sunglasses 폴더인지 glasses 폴더인지)
				String folderName = "";

				// 저장할 폴더 (mainImage 폴더인지 detailImage 폴더인지)
				String savePath = "";

				MultipartParser mp = new MultipartParser(req, maxSize);

				// 파일명 한글일 경우 안 깨지도록
				mp.setEncoding("UTF-8");
				
				
				// 유저가 상세사진을 등록하였을 경우에 그 정보를 이 곳에 저장한다
				List<ProductDetailImageVO> detailImageList = new ArrayList<>();

				Part part;

				while ((part = mp.readNextPart()) != null) {
					String name = part.getName(); // 파라미터의 key

					if (part.isParam()) {
						// 파일이 아닌 일반 parameter일 경우

						ParamPart paramPart = (ParamPart) part;
						String value = paramPart.getStringValue(); // 파라미터의 value
						
						// dao에 넘겨줄 파라미터를 저장한다
						if ("frameColor".equals(name) || "lenseColor".equals(name) || "frame".equals(name) || "material".equals(name)) {
							paraMap.put(name + "Id", value);

						} else if ("category".equals(name)) {
							if ("1".equals(value)) {
								folderName = "sunglasses";
							} else {
								folderName = "glasses";
							}
							rootPath += folderName;
							paraMap.put(name + "Id", value);
							
						} else if("productName".equals(name)) {
							paraMap.put("productGroupId", value);
							
						} else {
							paraMap.put(name, value);
						}

					} else if (part.isFile()) {
						// 파일일 때

						FilePart filePart = (FilePart) part;
						filePart.setRenamePolicy(new DefaultFileRenamePolicy()); // 중복파일일 경우 이름을 수정한다

						// 저장한 파일명
						String fileName = filePart.getFileName();
						
						if ("mainImageFile".equals(name)) {
							savePath = fsl + "mainImage";

						} else {
							// 상세 사진일 경우
							savePath = fsl + "detailImage";
						}

						if (fileName != null) {
							File dir = new File(rootPath + savePath);

							
							if ("mainImageFile".equals(name)) {
								// key 값이 mainImage일 경우
								paraMap.put(name, fsl + "image" + fsl + folderName + savePath + fsl + fileName);
							} else {
								// key 값이 mainImage가 아닐 경우 (상세사진인 imageFile일 경우)
								
								// 상세사진 정보를 저장한다
								ProductDetailImageVO pdivo = new ProductDetailImageVO();
								
								pdivo.setImageFile(fsl + "image" + fsl + folderName + savePath + fsl + fileName);
								pdivo.setPosition(Integer.parseInt(name.substring(name.length()-1)));
								
								detailImageList.add(pdivo);
							}

							if (!dir.isDirectory()) {
								// 디렉토리인지 체크 후 없으면 생성
								dir.mkdir();
							}
							long size = filePart.writeTo(dir);
						} else {
							// form type 이 file 이지만 비어있는 파라메터
							System.out.println("file; name=" + name + "; EMPTY");
						}
					}
				}


				ProductDAO pdao = new ProductDAO_imple();

				String message = "";
				String loc = "";
				
				if (paraMap.get("addProductNameInput") != null) {
					// 상품명을 직접 입력했을 경우

					if (pdao.insertProductGroupAndDetail(paraMap, detailImageList) == 0) {
						// 이미 상품이 존재할 경우
						message = "이미 등록된 상품명입니다. 상품 등록 화면으로 돌아갑니다.";
						loc = req.getContextPath() + "/admin/addProduct.gm";
						
					} else {
						message = "상품 등록에 성공하였습니다.";
						loc = req.getContextPath() + "/product/product.gm?categoryId=" + paraMap.get("categoryId");
					}

					req.setAttribute("message", message);
					req.setAttribute("loc", loc);

					super.setRedirect(false);
					super.setViewPage("/jsp/common/msg.jsp");

				} else {
					
					if (pdao.insertProductDetail(paraMap, detailImageList) == 0) {
						// 이미 상품이 존재할 경우
						message = "이미 등록된 상품입니다. 상품 등록 화면으로 돌아갑니다.";
						loc = req.getContextPath() + "/admin/addProduct.gm";
					} else {
						message = "상품 등록에 성공하였습니다.";
						loc = req.getContextPath() + "/product/product.gm?categoryId=" + paraMap.get("categoryId");
					}

					req.setAttribute("message", message);
					req.setAttribute("loc", loc);

					super.setRedirect(false);
					super.setViewPage("/jsp/common/msg.jsp");
				}

			}

		} else {
			// 로그인하지 않았을 경우 혹은 관리자 등급이 아닐 경우

			String message = "권한이 없습니다. 관리자 로그인 후 이용해주세요. 인덱스 화면으로 이동합니다.";
			// path 수정필
			String loc = req.getContextPath() + "/index.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");
		}

	}

}
