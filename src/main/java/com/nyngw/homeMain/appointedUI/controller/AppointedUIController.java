package com.nyngw.homeMain.appointedUI.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nyngw.common.service.CommonServiceImpl;
import com.nyngw.dto.MemberVO;
import com.nyngw.dto.MiddleMenuVO;
import com.nyngw.dto.UserUiVO;
import com.nyngw.homeMain.appointedUI.service.AppointedUIServiceImpl;
import com.nyngw.mypage.basicSetting.service.BasicSettingServiceImpl;

@Controller
@RequestMapping("/homeMain/appointedUI")
public class AppointedUIController {

	@Autowired
	private AppointedUIServiceImpl appointedUIservice;
	@Autowired
	private CommonServiceImpl commonService;
	@Autowired
	AppointedUIServiceImpl appointedUIService;
	
	@RequestMapping("/appointedUI")
	public String appointedUI(Principal principal,Model model,String menu1, String menu2, String menu3, String middle1, String middle2, String middle3){
		
		String mem_id = principal.getName();
		MemberVO member2 = commonService.findMemberByMemId(mem_id);
		MemberVO member = null;
		try {
			member = appointedUIService.checkMember(mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		model.addAttribute("member",member);
		model.addAttribute("mem_img",member2.getMem_img());
		
		if(menu1 != null && menu2 != null && menu3 != null){
			MiddleMenuVO mid1 = appointedUIservice.selectMiddleMenuFind_UI(menu1);
			MiddleMenuVO mid2 = appointedUIservice.selectMiddleMenuFind_UI(menu2);
			MiddleMenuVO mid3 = appointedUIservice.selectMiddleMenuFind_UI(menu3);
			model.addAttribute("big_number", mid1.getMid_big_number());
			model.addAttribute("middleMenu", mid1.getMid_number());
			model.addAttribute("big_number1", mid2.getMid_big_number());
			model.addAttribute("middleMenu1", mid2.getMid_number());
			model.addAttribute("big_number2", mid3.getMid_big_number());
			model.addAttribute("middleMenu2", mid3.getMid_number());
		}
		
		if(middle1 != null && middle2 != null && middle3 != null){
			MiddleMenuVO mid1 = appointedUIservice.selectBigMiddleMenuFind_UI(middle1);
			MiddleMenuVO mid2 = appointedUIservice.selectBigMiddleMenuFind_UI(middle2);
			MiddleMenuVO mid3 = appointedUIservice.selectBigMiddleMenuFind_UI(middle3);
			model.addAttribute("big_number", mid1.getMid_big_number());
			model.addAttribute("middleMenu", mid1.getMid_number());
			model.addAttribute("big_number1", mid2.getMid_big_number());
			model.addAttribute("middleMenu1", mid2.getMid_number());
			model.addAttribute("big_number2", mid3.getMid_big_number());
			model.addAttribute("middleMenu2", mid3.getMid_number());
		}
		
		return "homeMain/appointedUI/appointedUI";
	}
	///////////////////////UI
	//화면 1용
	@RequestMapping("/bigMenu")
	@ResponseBody
	public List<Map> bigMenu(Model model){
		List<Map> bigList = appointedUIservice.selectBigMenu();
		return bigList;
	}

	@RequestMapping("/middleMenu")
	@ResponseBody
	public List<Map> middleMenu(String big_num){
		List<Map> middleList = appointedUIservice.selectMiddleMenu(big_num);
		return middleList;
	}

	//화면2용
	@RequestMapping("/bigMenu1")
	@ResponseBody
	public List<Map> bigMenu1(Model model){
		List<Map> bigList = appointedUIservice.selectBigMenu();
		return bigList;
	}
	
	@RequestMapping("/middleMenu1")
	@ResponseBody
	public List<Map> middleMenu1(String big_num){
		List<Map> middleList = appointedUIservice.selectMiddleMenu(big_num);
		return middleList;
	}
	
	//화면3용	
	@RequestMapping("/bigMenu2")
	@ResponseBody
	public List<Map> bigMenu2(Model model){
		List<Map> bigList = appointedUIservice.selectBigMenu();
		return bigList;
	}
	
	@RequestMapping("/middleMenu2")
	@ResponseBody
	public List<Map> middleMenu2(String big_num){
		List<Map> middleList = appointedUIservice.selectMiddleMenu(big_num);
		return middleList;
	}
	
	@RequestMapping("/userUiSave")
	public @ResponseBody Map<String,String> userUiSave(UserUiVO userUi, Principal principal){
		appointedUIservice.userUiInsert_UI(userUi, principal);
		Map<String, String> map = new HashMap<String, String>();
		map.put("uri", "/homeMain/appointedUI/appointedUI?middle1="+userUi.getMiddleMenu()+"&middle2="+userUi.getMiddleMenu1()+"&middle3="+userUi.getMiddleMenu2());
		return map;
	}
}
