package com.nyngw.humanResource.joinMemberList.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nyngw.dto.JoinMemberVO;
import com.nyngw.dto.MemberVO;
import com.nyngw.dto.Paging;
import com.nyngw.humanResource.joinMemberList.service.JoinMemberListServiceImpl;
import com.nyngw.humanResource.memberJoin.service.MemberJoinServiceImpl;

@Controller
@RequestMapping("/humanResource/joinMemberList")
public class JoinMemberListController {
	
	@Autowired
	private JoinMemberListServiceImpl joinMemberListService;
	@Autowired
	private MemberJoinServiceImpl memberJoinService;
	
	private List<JoinMemberVO> joinMemberList;
	
	@RequestMapping("/jlm")
	public String joinMain(Model model,String page){
		JoinMemberVO vo = new JoinMemberVO();
		int p=1;
		if(page != null){
			p=Integer.valueOf(page);
			if(p<1){
				p=1;
			}
		}
		Paging paging = new Paging(p, 8);
		paging.setNumberOfRecords(joinMemberListService.countTotalJoinMember());
		
		int firstRow = 0;
		int endRow = 0;
		
		paging.makePaging();
		
				
		firstRow = (paging.getCurrentPageNo() - 1) * paging.getRecordsPerPage() + 1;
		endRow = firstRow + paging.getRecordsPerPage() - 1;
		
		vo.setStartPage(firstRow-1);	
		vo.setEndPage(endRow);
		
		joinMemberList = joinMemberListService.getJoinMemberList(vo);
		
		model.addAttribute("page", paging);
		model.addAttribute("joinMemberList", joinMemberList);
		model.addAttribute("sideValue", "sideMenu5");
		return "humanResource/joinMemberList/jlm";
	}
	
	@RequestMapping("/detail")
	public String memberDetail(Model model,String mem_id){
		
		
		JoinMemberVO member = joinMemberListService.getMemberDetail(mem_id);
		
		
		model.addAttribute("member", member);
		
		try {
			memberJoinService.viewMjmInfo(model);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "humanResource/joinMemberList/memberdetail";
	}
	
	@RequestMapping("/modify")
	public @ResponseBody Map<String,Object> modifyMember(JoinMemberVO member){
		Map<String,Object> map = new HashMap<String, Object>();
		
		int result = joinMemberListService.modifyMember(member); 
		
		map.put("status", "no");
		
		if(result==1){
			map.put("status", "ok");
		}
		
		return map;
	}
	
	@RequestMapping("/retired")
	public @ResponseBody Map<String,Object> modifyDeleteMember(JoinMemberVO member){
		Map<String,Object> map = new HashMap<String, Object>();
		
		joinMemberListService.modifyDeleteMember(member);
		
		map.put("url", "/humanResource/joinMemberList/jlm");
		
		return map;
	}
	
	@RequestMapping("/excelMemberRank")
	public String pageRank(Model model){
		
		model.addAttribute("memberList", joinMemberList);
		
		return "joinExcelViewHR";
	}
	
}
