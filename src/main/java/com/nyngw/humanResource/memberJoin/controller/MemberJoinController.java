package com.nyngw.humanResource.memberJoin.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nyngw.dto.DepartmentVO;
import com.nyngw.dto.JoinMemberVO;
import com.nyngw.dto.MemberVO;
import com.nyngw.dto.PositionVO;
import com.nyngw.environmentSetting.planPublicRelationsSetting.service.PlanPublicRelationsSettingServiceImpl;
import com.nyngw.humanResource.memberJoin.service.MemberJoinServiceImpl;

@Controller
@RequestMapping("/humanResource/memberJoin")
public class MemberJoinController {
	
	@Autowired
	private MemberJoinServiceImpl memberJoinService;
	@Autowired
	private PlanPublicRelationsSettingServiceImpl planPublicRelationsSettingService; 
	
	@RequestMapping("/mjm")
	public String mjm(Model model){
		try {
			memberJoinService.viewMjmInfo(model);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("sideValue", "sideMenu4");
		return "humanResource/memberJoin/mjm";
	}
	
	@RequestMapping("/idCheck")
	public @ResponseBody Map<String,Object> insertMember(String id){
		Map<String,Object> map = new HashMap<String, Object>();
		
		MemberVO member = memberJoinService.idCheck(id);
		
		map.put("status", "no");
		
		if(member==null){
			map.put("status", "ok");
		}
		
		map.put("id", id);
		
		return map;
	}
	
	@RequestMapping("/joinMember")
	public @ResponseBody Map<String,Object> joinMember(JoinMemberVO joinMember,Model model){
		Map<String,Object> map = new HashMap<String, Object>();
		/*
		try {
			joinMember.setMem_birthday(new SimpleDateFormat("yyyy-MM-dd").parse(joinMember.getMem_reg()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		*/
		joinMember.setMem_retirement("1");
		
		
		model.addAttribute("status", "no");
		int result = memberJoinService.joinMember(joinMember);
		if(result==1){
			model.addAttribute("status", "ok");
		}
		
		return map;
	}
	
	
}
