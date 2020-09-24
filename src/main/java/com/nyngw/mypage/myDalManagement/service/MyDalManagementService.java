package com.nyngw.mypage.myDalManagement.service;

import java.util.List;

import com.nyngw.dto.Board_SelectVO;
import com.nyngw.dto.DalViewVO;
import com.nyngw.dto.VacationVO;
import com.nyngw.mypage.myDalManagement.MyAttendedListView;
import com.nyngw.mypage.myDalManagement.MyVacationListView;

public interface MyDalManagementService {
	public List<DalViewVO> selectAttendList();
	public MyAttendedListView selectAttendList(int pageNumber,Board_SelectVO select);
	
	public MyVacationListView selectVacationList(int pageNumber,Board_SelectVO select);
	
	
}
