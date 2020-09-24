package com.nyngw.sharingInformation.memberInformation.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nyngw.dto.Approval_HistoryVO;
import com.nyngw.dto.MemberVO;
import com.nyngw.sharingInformation.memberInformation.service.MemberInformationServiceImpl;

@Controller
@RequestMapping("/sharingInformation/memberInformation")
public class MemberInformationController {
	@Autowired
	private MemberInformationServiceImpl memberInformationService;

	/**
	 * 처음 주소록검색 버튼을 눌러 들어오면 빈 리스트 화면 url을 반환하는 메서드
	 * 처음 주소록검색에 들어가면 빈 리스트와 검색 할 수 있는 search 만있고 검색하면
	 * 해당 이름을 가진 회원이 리스트에 뿌려지는것 
	 * @return 빈 리스트 url 반환
	 */
	@RequestMapping("/addressBook")
	public String addressBookList(Model model, @RequestParam(value="page",defaultValue="1") int pageNumber,String mem_name){
		if(mem_name==null){
			mem_name="";
		}
		model.addAttribute("sideValue", "sideMenu7");
		memberInformationService.getMemberInfo(pageNumber, model,mem_name);
		return "sharingInformation/memberInformation/addressBook";
	}
	
	/**
	 * 주소록 검색창에 값을 입력하고 검색 버튼을 누를때 보여질 url 반환하는 메서드
	 * @return 조회된 url 반환
	 */
	@RequestMapping("/search")
	public String addressBookSearch(){
		
		return null;
	}
	
	/**
	 * 조직도 조회 버튼을 눌러 보여질 url을 반환하는 메서드
	 * @return 조직도 화면 url 반환
	 */
	@RequestMapping("/organizationChart")
	public String organizationChart(Model model){
		model.addAttribute("sideValue", "sideMenu6");
		return "sharingInformation/memberInformation/organizationChart";
	}
	
	@RequestMapping("/getTreeJsonDate")
	@ResponseBody
	public List<Map> getTreeJsonDate(){
		List<Map> treeJsonDate = memberInformationService.getAllDepartment();
		return treeJsonDate;
	}
	
	/**
	 * 조회된 조직도에서 해당 부서를 클릭하면 클릭한 부서의 상세페이지로 넘어가는 url을 반환하는 메서드
	 * @return 부서 상세페이지 url 반환
	 */
	@RequestMapping("/organizationChartDetail")
	public @ResponseBody List<Map> organizationChartDetail(String dept_number){
		List<MemberVO> member = memberInformationService.SI_selectOrganizationChart(dept_number);
		List<Map> memberAddress = new ArrayList<Map>();
		for(int i = 0; i < member.size(); i++){
			Map<String, String> addr = new HashMap<String, String>();
			addr.put("mem_dept_name", memberInformationService.SI_selectDepartment(member.get(i).getMem_dept_number()));//부서
			addr.put("mem_name", member.get(i).getMem_name());//이름
			addr.put("mem_position_name", memberInformationService.SI_selectPosition(member.get(i).getMem_position_number()));//직위
			addr.put("mem_email", member.get(i).getMem_email());//이메일
			addr.put("mem_tel", member.get(i).getMem_tel());//연락처
			addr.put("mem_addr1", member.get(i).getMem_addr1());//주소
			memberAddress.add(addr);
		}
		return memberAddress;
	}
	
	/**
	 * 생일화면 버튼을 클릭하면 해당월 의 생일자인 직원의 리스트가 뿌려질 화면의url을 반환하는 메서드
	 * @return	생일확인페이지의 url 반환
	 */
	@RequestMapping("/birthdayCheck")
	public String birthday(Model model, @RequestParam(value="page",defaultValue="1") int pageNumber,String month){
		if(month== null){
			month = Calendar.getInstance().get(Calendar.MONTH)+1+"";	//현재 월
		}
		memberInformationService.getBirthdayMember(pageNumber, model, month);
		model.addAttribute("month",month);
		model.addAttribute("sideValue", "sideMenu8");
		return "sharingInformation/memberInformation/birthday";
	}
	
}
