<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.userdetails.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>회의일정 등록</h2>
<p class="docTitleDescription">
	회의일정을 등록할 수 있습니다.
</p>
<style>
.table{
	background: white;
}
</style>
<script type="text/javascript">
   function file_change(file){
   var str=file.lastIndexOf("\\")+1;   //파일 마지막 "\" 루트의 길이 이후부터 글자를 잘라 파일명만 가져온다.
   file = file.substring(str, file.length);
   document.getElementsByName('board_file_name')[0].value=file;
}
</script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url:'approvalLineManager',
		type:'get',
		success : function(result){
			$("#tree").html(result.sb);
		},
		dataType : 'json'
	})
	 $('#linePopup').css('display', 'none');
	 $("#linePopup_go").click(function(){
			$('#linePopup').dialog({
				width:1000,
				height: 700,
				modal: true,
				buttons: [{
					text: "등록",
					icon: "ui-icon-heart",
					click: function() {
						submitLineCall();
						$( this ).dialog( "close" );
					}
				},{
					text: "취소",
					icon: "ui-icon-heart",
					click: function() {
						$( this ).dialog( "close" );
					}
				}],
				close: function() {
					
				}
			});
		})
		
		var submitLineCall = null;
		//결재라인 등록하기//
				
		//결재라인 등록하기//

		
		function submitLine(){
			var code = "";
			var mt_members="";
	         $('#approval option').each(function(i){
	        	 
	        	 if(i>0){
	        		 code += ",";
	        	 }
	        	 code+=$(this).val();
	         });
	        $('#approvalMember').html(code);
		}
		submitLineCall=submitLine;
})
</script>
<div>
		<form name="tx_editor_form" id="tx_editor_form" action="meetingInsert" method="POST" accept-charset="utf-8">
			<table class="table tableGray textCenter" style="background: white;">
			<tr>
				<th>회의제목</th>
				<td>
					<input type="text" class="form-control" name="mt_title">
				</td>
				<th>회의일</th>
				<td>
					<input type="text" class="inputTypeDate form-control" name="mt_date">
				</td>
			</tr>
			<tr>
				<th>회의장소</th>
					<td>
						<select name="mt_mr_number" class="form-control">
						<c:forEach items="${meetingroom }" var="meetingroom">
							<option value="${meetingroom.mr_number }">${meetingroom.mr_name }</option>
						</c:forEach>
						</select>
					</td>
				<th>회의참여자</th>
				<td><button type="button" id="linePopup_go" class="btn btn-default">검색</button></td>
			</tr>
			<tr>
				<th>회의주최자</th>
				<td><input type="text" name="mt_reader" class="form-control" value="${meetingList2.mem_name }" readonly="readonly"></td>
				<td id="approvalMember" colspan="5">
			</tr>
		</table>
			<div style="text-align: center;" class="insertJoinBtnWrap textCenter">
			<jsp:include page="/WEB-INF/views/common/daumOpenEditor/meetingeditor.jsp" flush="false"/>
			<input type="hidden" value="${page}">
			<button onclick='saveContent()'class="btn btn-default">등록</button>
			<input type="reset" value="초기화"class="btn btn-default" />	
				<button class="btn btn-default" type="button"><a href="/businessSupport/meetingManagement/meetingCalendar?page=${page }">취소</a></button>
			</div>
		</form>
	</div>
<div id="linePopup" style="height:100%;width:100%;">
	<jsp:include page="approvalLineManager.jsp" flush="false"/>
</div>
		