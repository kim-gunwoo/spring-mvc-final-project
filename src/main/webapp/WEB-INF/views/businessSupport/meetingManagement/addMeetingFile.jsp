<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.userdetails.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.text.*" %>
<h2>회의록 등록</h2>
<p class="docTitleDescription">
	회의록을 등록할 수 있습니다.
</p>
<%Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strdate = simpleDate.format(date);
%>
<script type="text/javascript">
   function file_change(file){
   var str=file.lastIndexOf("\\")+1;   //파일 마지막 "\" 루트의 길이 이후부터 글자를 잘라 파일명만 가져온다.
   file = file.substring(str, file.length);
   document.getElementsByName('board_file_name')[0].value=file;
}
</script>
<script type="text/javascript">
$(function(){
	$("#submit").click(function(){
	    $('#chk_meet').html("<input type='text' name='md_number' value='"+$("input[name='chk_meet']:radio:checked").val()+"'/>");
	    $('#meetPopup').dialog('close');
	})
	
	 $('#meetPopup').css('display', 'none');
	 $("#meetPopup_go").click(function(){
			$('#meetPopup').dialog({
				width:950,
				height: 700,
				modal: true,
				buttons: {
			       "취소": function() {
						$(this).dialog("close");
					}
				},
				close: function() {
					
				}
			});
		})
})
</script>

<div>
		<form name="tx_editor_form"  id="tx_editor_form" action="meetingFileInsert" method="POST" accept-charset="utf-8">
			<table class="table table-border tableGray">
			<tr>
				<th>회의록명</th>
				<td>
					<input type="text" name="md_name" class="form-control">
				</td>
				<th>회의</th>
				<td><button id="meetPopup_go" class="btn btn-default">회의찾기</button></td>
				<td id="chk_meet" name="md_number"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input class="form-control" type="text" name="md_writer" value="${meetingList3.mem_name }" readonly="readonly"></td>
				<th>작성일</th>
				<td colspan="2">
					<input type="date" class="form-control" name="md_date" value="<%= strdate %>" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<th colspan="5">내용</th>
			</tr>
		</table>
			<div class="insertJoinBtnWrap textCenter">
				<jsp:include page="/WEB-INF/views/common/daumOpenEditor/editor.jsp" flush="false"/>
				<input type="hidden" value="${page}">
				<button onclick='saveContent()' class="btn btn-default">등록</button>
				<input type="reset" value="초기화" class="btn btn-default"/>	
				<button type="button" class="btn btn-default"><a href="/businessSupport/meetingManagement/meetingFile?page=${page }">취소</a></button>
			</div>
		</form>
	</div>

	<div id="meetPopup" style="height:100%;width:100%;">
	<div class="textCenter"><h2>회의 리스트</h2></div>
	
	<table class="table textCenter tableGray" >
	<tr>
		<th></th>
		<th>회의명</th>
		<th>회의일자</th>
		<th>회의장소</th>
		<th>회의주최자</th>
	</tr>
		<c:choose>
				<c:when test="${a}">
				<c:forEach items="${metlist}" var="board" >
				<tr>
					<td><input type="radio" name="chk_meet" id="chk_meet" value="${board.mt_md_number }"></td>
					<td>${board.mt_title}</td>
					<td><fmt:formatDate value="${board.mt_date}" pattern="yyyy-MM-dd"/></td>
					<td>${board.mt_mr_number }</td>
					<td>${board.mt_reader}</td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td style="text-align: center;">내용이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
</table>
<div class="textCenter">
	<button type="button" id="submit" class="btn btn-default">등록</button>
</div>
	</div>	
	
<textarea id="text_content" style="display:none;">
<table style="border-collapse:collapse;border-top:solid #000000 0.28pt;border-left:solid #000000 0.28pt;border-bottom:solid #000000 0.28pt;border-right:solid #000000 0.28pt;mso-table-overlap:never;"><tbody><tr><td colspan="7" style="width:490.56pt;height:85.00pt;padding:1.41pt 5.10pt 1.41pt 5.10pt;border-top:none;border-left:none;border-bottom:solid #000000 1.70pt;border-right:none;" valign="middle"><p class="0" style="line-height: 90%; text-align: center; word-break: keep-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="font-weight: bold; font-size: 20pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">회    의    록</span></p><p class="0" style="line-height: 90%; text-align: center; word-break: keep-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="letter-spacing: -1.5pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲󰠲</span></p><p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></p><p class="0" style="line-height: 90%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"> </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">부 서 명 </span><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">:       </span></p></td></tr><tr><td colspan="2" style="width:75.16pt;height:36.32pt;padding:1.41pt 5.10pt 1.41pt 5.10pt;border-top:solid #000000 1.70pt;border-left:solid #000000 1.70pt;border-bottom:solid #000000 0.28pt;border-right:solid #000000 0.28pt;" valign="middle"><p class="0" style="text-align: center; word-break: keep-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">일    시</span></p></td><td colspan="2" style="width:174.44pt;height:36.32pt;padding:1.41pt 5.10pt 1.41pt 5.10pt;border-top:solid #000000 1.70pt;border-left:solid #000000 0.28pt;border-bottom:solid #000000 0.28pt;border-right:solid #000000 0.28pt;" valign="middle"><p class="0" style="text-align: center; word-break: keep-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">20      </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">년       월       일 </span></p></td><td colspan="3" style="width:240.96pt;height:36.32pt;padding:1.41pt 5.10pt 1.41pt 5.10pt;border-top:solid #000000 1.70pt;border-left:solid #000000 0.28pt;border-bottom:solid #000000 0.28pt;border-right:solid #000000 1.70pt;" valign="middle"><p class="0" style="text-align: center; word-break: keep-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">           </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">시        분부터</span></p><p class="0" style="text-align: center; word-break: keep-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">           </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">시        분까지</span></p></td></tr><tr><td colspan="2" style="width:75.16pt;height:35.52pt;padding:1.41pt 5.10pt 1.41pt 5.10pt;border-top:solid #000000 0.28pt;border-left:solid #000000 1.70pt;border-bottom:solid #000000 1.70pt;border-right:solid #000000 0.28pt;" valign="middle"><p class="0" style="text-align: center; word-break: keep-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">장     소</span></p></td><td colspan="2" style="width:174.44pt;height:35.52pt;padding:1.41pt 5.10pt 1.41pt 5.10pt;border-top:solid #000000 0.28pt;border-left:solid #000000 0.28pt;border-bottom:solid #000000 1.70pt;border-right:solid #000000 0.28pt;" valign="middle"><p class="0" style="text-align: center; word-break: keep-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></p></td><td colspan="2" style="width:120.48pt;height:35.52pt;padding:1.41pt 5.10pt 1.41pt 5.10pt;border-top:solid #000000 0.28pt;border-left:solid #000000 0.28pt;border-bottom:solid #000000 1.70pt;border-right:solid #000000 0.28pt;" valign="middle"><p class="0" style="text-align: center; word-break: keep-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">소 집 및 발 안 자</span></p></td><td style="width:120.48pt;height:35.52pt;padding:1.41pt 5.10pt 1.41pt 5.10pt;border-top:solid #000000 0.28pt;border-left:solid #000000 0.28pt;border-bottom:solid #000000 1.70pt;border-right:solid #000000 1.70pt;" valign="middle"><p class="0" style="text-align: center; word-break: keep-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></p></td></tr><tr><td style="width:7.64pt;height:25.96pt;padding:1.41pt 5.10pt 1.41pt 5.10pt;border-top:solid #000000 1.70pt;border-left:solid #000000 1.70pt;border-bottom:none;border-right:none;" valign="middle"><p class="0" style="line-height: 80%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></p></td><td colspan="2" style="width:112.68pt;height:25.96pt;padding:1.41pt 5.10pt 1.41pt 5.10pt;border-top:solid #000000 1.70pt;border-left:none;border-bottom:solid #000000 0.28pt;border-right:none;" valign="middle"><p class="0" style="line-height: 80%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">  </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">의 결 사 항 </span><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">(</span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">요 약</span><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">)</span></p></td><td colspan="4" style="width:370.24pt;height:25.96pt;padding:1.41pt 5.10pt 1.41pt 5.10pt;border-top:solid #000000 1.70pt;border-left:none;border-bottom:none;border-right:solid #000000 1.70pt;" valign="middle"><p class="0" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></p></td></tr><tr><td colspan="7" style="width:490.56pt;height:319.52pt;padding:1.41pt 5.10pt 1.41pt 5.10pt;border-top:none;border-left:solid #000000 1.70pt;border-bottom:solid #000000 1.70pt;border-right:solid #000000 1.70pt;" valign="top"><p class="0" style="text-align: center; word-break: keep-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></p></td></tr><tr><td colspan="7" style="width:490.56pt;height:35.52pt;padding:1.41pt 5.10pt 1.41pt 5.10pt;border-top:solid #000000 1.70pt;border-left:solid #000000 1.70pt;border-bottom:none;border-right:solid #000000 1.70pt;" valign="middle"><p class="0" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">     </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">위 결의사항의 명확을 기하기 위하여 연서 </span><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">· </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">날인함</span><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">.</span></p></td></tr><tr><td colspan="5" style="width:258.08pt;height:155.40pt;padding:1.41pt 5.10pt 1.41pt 5.10pt;border-top:none;border-left:solid #000000 1.70pt;border-bottom:solid #000000 1.70pt;border-right:none;" valign="middle"><p class="0" style="line-height: 250%; margin-left: 25pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">   </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">참 석 자 </span><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">:                       </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">󰄫</span></p><p class="0" style="line-height: 250%; margin-left: 25pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">   </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">참 석 자 </span><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">:                       </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">󰄫 </span></p><p class="0" style="line-height: 250%; margin-left: 25pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">   </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">참 석 자 </span><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">:                       </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">󰄫</span></p><p class="0" style="line-height: 250%; margin-left: 25pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">   </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">참 석 자 </span><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">:                       </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">󰄫</span></p><p class="0" style="line-height: 250%; margin-left: 25pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">   </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">참 석 자 </span><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">:                       </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">󰄫</span></p></td><td colspan="2" style="width:232.48pt;height:155.40pt;padding:1.41pt 5.10pt 1.41pt 5.10pt;border-top:none;border-left:none;border-bottom:solid #000000 1.70pt;border-right:solid #000000 1.70pt;" valign="middle"><p class="0" style="line-height: 250%; margin-left: 25pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">   </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">참 석 자 </span><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">:                       </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">󰄫</span></p><p class="0" style="line-height: 250%; margin-left: 25pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">   </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">참 석 자 </span><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">:                       </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">󰄫 </span></p><p class="0" style="line-height: 250%; margin-left: 25pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">   </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">참 석 자 </span><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">:                       </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">󰄫</span></p><p class="0" style="line-height: 250%; margin-left: 25pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">   </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">참 석 자 </span><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">:                       </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">󰄫</span></p><p class="0" style="line-height: 250%; margin-left: 25pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">   </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">참 석 자 </span><span lang="EN-US" style="font-family: 한양신명조; letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">:                       </span><span style="letter-spacing: -0.2pt; font-size: 11pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">󰄫</span></p></td></tr></tbody></table><p><br></p>
</textarea>
<script type="text/javascript">
   $(function(){   
      var loadContent = function() {
         /* 저장된 컨텐츠를 불러오기 위한 함수 호출 */
         Editor.modify({
            "content": document.getElementById("text_content") /* 내용 문자열, 주어진 필드(textarea) 엘리먼트 */
         });
      };
      
      loadContent();
   });
</script>