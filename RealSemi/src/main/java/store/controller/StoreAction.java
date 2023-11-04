package store.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import store.domain.StoreImgVO;
import store.domain.StoreVO;
import store.model.*;

public class StoreAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		String countryid = request.getParameter("countryid"); // 왜 안 되는 거ㅣㅇㅁ???
	//	String countryid = "";
	
		if(countryid == null || countryid == "null" || countryid == "" ) {
			countryid = "1";
		}
		
		StoreDAO sdao = new StoreDAO_imple();
	
	
		// --- 매장보기 중 '스토어' 보여주기 시작 --- //
		int totalStoreCount = sdao.totalStoreCount(countryid); // 스토어(스토어) 개수를 알아온다.
		request.setAttribute("totalStoreCount", totalStoreCount);
		if(totalStoreCount > 0) {
			List<StoreVO> storeList = sdao.getStoreList(countryid);
			request.setAttribute("storeList",storeList);
			
			List<StoreImgVO> storeImgList = sdao.getStoreImgList(countryid);
			request.setAttribute("storeImgList",storeImgList);
		}
		// --- 매장보기 중 '스토어' 보여주기 끝 --- //	
		
		// --- 매장보기 중 '백화점/면세점' 보여주기 시작 --- //
		int totalDepStoreCount = sdao.totalDepStoreCount(countryid); // 스토어(백화점/면세점) 개수를 알아온다.
		request.setAttribute("totalDepStoreCount", totalDepStoreCount);
		if(totalDepStoreCount > 0) {
			List<StoreVO> storeDepList = sdao.getDepStoreList(countryid);
			request.setAttribute("storeDepList",storeDepList);
		}
		// --- 매장보기 중 '백화점/면세점' 보여주기 끝 --- //
		
		
		super.setRedirect(false);
		super.setViewPage("/jsp/store/store.jsp");

		 
	}

}