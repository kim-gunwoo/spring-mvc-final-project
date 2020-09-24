<%@page import="com.nyngw.dto.MemberVO"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page import="com.nyngw.common.service.CommonServiceImpl"%>
<%@page import="com.nyngw.dto.ReservationVO"%>
<%@page import="com.nyngw.dto.MeetingRoomVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
	fieldset{
		width:225px;
		height:270px;
		margin:5px;
		float: left;
		border:3px; 
	}
	.form-control{
		display: inline;
	}
</style>

<script type="text/javascript">
	/* $(function(){
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!

		var yyyy = today.getFullYear();
		if(dd<10){
			dd='0'+dd
		} 
		if(mm<10){
			mm='0'+mm
		} 
		today = yyyy+'-'+mm+'-'+dd;

		$('#rv_date').attr('value', today);
	}); */
	
	function searchReservation_go(form){
		form.method="get";
		form.action="/businessSupport/meetingFacilitiesManagement/meetingRoomBooking";
		form.submit();
	}

</script>
<!--

//-->
</script>
<h2>회의실 예약</h2>
<p class="docTitleDescription">
	회사의 회의실을 예약하는 페이지
</p>
	<div class="textCenter" style="margin: 20px auto 30px auto;">
		<form>
			<a style="font-weight: bold;">날짜&nbsp;&nbsp;&nbsp;</a>
			<input type="text"  class="inputTypeDate form-control" style="width: 150px;" name="rv_date" value="${rv_date }">&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="searchReservation_go(this.form);" class="btn btn-default">검색</button>
		</form>
	</div>
	<div>
	<!-- bookingListMap.회의실이름.rv_number(rv_time)(rv_mem_number)(rv_mr_number) -->
	<!-- mrList => 회의실 리스트 -->
		<%
			List<MeetingRoomVO> mrList = (List) request.getAttribute("mrList");	//회의실 리트스 로드
			for (int i = 0; i<mrList.size(); i++){%>
		<div class="col-md-4" style="margin-bottom: 20px;">
			<table class="table tableGray">
				<tr><th><%=mrList.get(i).getMr_name()%> </th></tr>	<!-- 각각의 회의실 리스트의 이름 출력 -->
				
				<%List<ReservationVO> RList = (List) request.getAttribute(mrList.get(i).getMr_number());	//각 회의실 별 예약 리스트 (모든 시간의 정보가 들어있는 게 아님)
				if (RList.size()==0){	//예약정보가 없을 시 모든시간 사용가능
					for (int j = 9; j<18; j++){%>
					<tr><td style="background: white;">
						<%=j %>시 &nbsp;&nbsp; 사용가능&nbsp;&nbsp; 
						<button class="reservationBtn"><a href="/businessSupport/meetingFacilitiesManagement/reservation?rv_time=<%=j%>&rv_date=${rv_date }&rv_mr_number=<%=mrList.get(i).getMr_number()%>">예약</a></button>
					</td></tr>
					<%}%>
				<%}else{	//예약정보가 하나라도 있을 시
					int RListIndex = 0;
					for(int j = 9 ; j<18 ;j++){
						if(RList.get(RListIndex).getRv_time().equals(j+"")){%>
							<tr><td style="background: red;">
								<%=j %>시 &nbsp;&nbsp; 예약중
								<%
							    MemberVO member = (MemberVO)request.getAttribute("member");
								if(RList.get(RListIndex).getRv_mem_number().equals(member.getMem_number())){%>
									<button class="reservationBtn"><a href="/businessSupport/meetingFacilitiesManagement/cancel?rv_date=${rv_date }&rv_number=<%=RList.get(RListIndex).getRv_number()%>">취소</a></button>
								<%}%>
							</td></tr>
							<%if(RListIndex+1!=RList.size()){
								RListIndex++;
							}
						}else{%>
							<tr><td style="background:white;"><%=j %>시 &nbsp;&nbsp; 사용가능&nbsp;&nbsp; <button class="reservationBtn"><a href="/businessSupport/meetingFacilitiesManagement/reservation?rv_time=<%=j%>&rv_date=${rv_date }&rv_mr_number=<%=mrList.get(i).getMr_number()%>">예약</a></button></td></tr>
						<%}
					}
				}%>
			</table>
		</div>
		<%}%>
	</div>
