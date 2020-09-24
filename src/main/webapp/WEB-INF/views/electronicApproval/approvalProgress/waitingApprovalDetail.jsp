<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<style>
	.tableTd{
 		width: 17%;
 		height: 50px;
	}
	.tableSign{
 		height: 80px;
	}
	.memSign {
		display : block;
		width : 80px;
		height : 60px;
		margin :0 auto;
		background-size: contain;
		background-repeat: no-repeat;
		background-position : top center;
		
	}
	.txc-table{
		margin :0 auto;
	}
	
	.contentContainer table{
		margin: auto;
	}
</style>
<script type="text/javascript">
$(function(){
	//기본 설정 dialog 보이지 않게
	$('#approvalDialog').css('display', 'none');
	$('#disapproveDialog').css('display', 'none');
	$('#agreeDialog').css('display', 'none');
	$('#refuseDialog').css('display', 'none');
	$('#approvalHistoryDialog').css('display', 'none');
	
	/////////////////////////////////////////////////////////////////////////
	//결재 다이얼로그
	$("#approve_go").click(function(){
		$('#approvalDialog').dialog({
			width: 500,
			height: 400,
			modal: true,
			buttons:[{
				text: "등록",
				icon: "ui-icon-heart",
				click: function() {
					approvalSubmitCall();
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
				$('#textArea').val('');
				$('#pwd').val('');
			}
		});
	})
	//합의 다이얼로그
	$("#agree_go").click(function(){
		$('#agreeDialog').dialog({
			width: 500,
			height: 400,
			modal: true,
			buttons:[{
				text: "등록",
				icon: "ui-icon-heart",
				click: function() {
					agreeSubmitCall();
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
				$('#textArea').val('');
				$('#pwd').val('');
			}
		});
	})
    //반려 다이얼로그
	$("#disapprove_go").click(function(){
		$('#disapproveDialog').dialog({
			width: 500,
			height: 400,
			modal: true,
			buttons:[{
				text: "등록",
				icon: "ui-icon-heart",
				click: function() {
					disapproveSubmitCall();
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
				$('#textArea').val('');
				$('#pwd').val('');
			}
		});
	})
    //거부 다이얼로그 
	$("#refuse_go").click(function(){
		$('#refuseDialog').dialog({
			width: 500,
			height: 400,
			modal: true,
			buttons:[{
				text: "등록",
				icon: "ui-icon-heart",
				click: function() {
					refuseSubmitCall();
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
				$('#textArea').val('');
				$('#pwd').val('');
			}
		});
	})
    
	//////////////////////////////////////////////////////////////
	//결재하기//
	var approvalSubmitCall = null;
	function approvalSubmit(){
		$.ajax({
			url:"/electronicApproval/approvalProgress/conformApproval",	// 결재처리 하는 컨트롤러 url
			type:"post",
			data: $("#approvalSubmitForm").serialize(),
			success: function(result){ // success
				if(result.check=='y'){
					if(result.al_number=='A'){
		 				var code="<div class='tableTd tableSign memSign' style='background-image:url(\"/resources/memsign/"+result.mem_sign+"\")'></div>";
		 				$("#approvalStatus"+result.priority).html(code);
		 				$("#approve_go").attr("disabled",true);
		 				$("#disapprove_go").attr("disabled",true);
		 				alert("결재가 완료되었습니다.");
		 				location.href="/electronicApproval/approvalProgress/waitingApproval";
					}else if(result.al_number=='B'){
						var code="<div class='tableTd tableSign memSign' style='background-image:url(\"/resources/memsign/"+result.mem_sign+"\")'></div>";
		 				$("#agreementStatus"+result.priority).html(code);
		 				$("#agree_go").attr("disabled",true);
		 				$("#refuse_go").attr("disabled",true);
		 				alert("합의가 완료되었습니다.");
		 				location.href="/electronicApproval/approvalProgress/waitingApproval";
					}
				}else{
					alert("잘못된 비밀번호입니다.");
				}
			},
			dataType:"json"				// dataType
		});
	}	
	approvalSubmitCall=approvalSubmit;
	
	//합의하기//
	var agreeSubmitCall = null;
	function agreeSubmit(){
		$.ajax({
			url:"/electronicApproval/approvalProgress/conformApproval",	// 결재처리 하는 컨트롤러 url
			type:"post",
			data: $("#agreeSubmitForm").serialize(),
			success: function(result){ // success
				if(result.check=='y'){
					if(result.al_number=='A'){
		 				var code="<div class='tableTd tableSign memSign' style='background-image:url(\"/resources/memsign/"+result.mem_sign+"\")'></div>";
		 				$("#approvalStatus"+result.priority).html(code);
		 				$("#approve_go").attr("disabled",true);
		 				$("#disapprove_go").attr("disabled",true);
		 				alert("결재가 완료되었습니다.");
		 				location.href="/electronicApproval/approvalProgress/waitingApproval";
					}else if(result.al_number=='B'){
						var code="<div class='tableTd tableSign memSign' style='background-image:url(\"/resources/memsign/"+result.mem_sign+"\")'></div>";
		 				$("#agreementStatus"+result.priority).html(code);
		 				$("#agree_go").attr("disabled",true);
		 				$("#refuse_go").attr("disabled",true);
		 				alert("합의가 완료되었습니다.");
		 				location.href="/electronicApproval/approvalProgress/waitingApproval";
					}
				}else{
					alert("잘못된 비밀번호입니다.");
				}
			},
			dataType:"json"				// dataType
		});
	}	
	agreeSubmitCall=agreeSubmit;
		
	//반려하기//
	var disapproveSubmitCall = null;
	function disapproveSubmit(){
		$.ajax({
			url:"/electronicApproval/approvalProgress/conformApproval",	// 결재처리 하는 컨트롤러 url
			type:"post",
			data: $("#disapproveSubmitForm").serialize(),
			success: function(result){ // success
				if(result.check=='y'){
					if(result.al_number=='A'){
		 				var code="<div class='tableTd tableSign memSign' style='background-image:url(\"/resources/memsign/disapprove.jpg\")'></div>";
		 				$("#approvalStatus"+result.priority).html(code);
		 				$("#approve_go").attr("disabled",true);
		 				$("#disapprove_go").attr("disabled",true);
		 				alert("반려가 완료되었습니다.");
		 				location.href="/electronicApproval/individualDocumentBox/refusedApprovalBox";
					}else if(result.al_number=='B'){
						var code="<div class='tableTd tableSign memSign' style='background-image:url(\"/resources/memsign/refuse.jpg\")'></div>";
		 				$("#agreementStatus"+result.priority).html(code);
		 				$("#agree_go").attr("disabled",true);
		 				$("#refuse_go").attr("disabled",true);
		 				alert("거부가 완료되었습니다.");
		 				location.href="/electronicApproval/individualDocumentBox/refusedApprovalBox";
					}
				}else{
					alert("잘못된 비밀번호입니다.");
				}
			},
			dataType:"json"				// dataType
		});
	}	
	disapproveSubmitCall=disapproveSubmit;

	//거부하기//
	var refuseSubmitCall = null;
	function refuseSubmit(){
		$.ajax({
			url:"/electronicApproval/approvalProgress/conformApproval",	// 결재처리 하는 컨트롤러 url
			type:"post",
			data: $("#refuseSubmitForm").serialize(),
			success: function(result){ // success
				if(result.check=='y'){
					if(result.al_number=='A'){
		 				var code="<div class='tableTd tableSign memSign' style='background-image:url(\"/resources/memsign/disapprove.jpg\")'></div>";
		 				$("#approvalStatus"+result.priority).html(code);
		 				$("#approve_go").attr("disabled",true);
		 				$("#disapprove_go").attr("disabled",true);
		 				alert("반려가 완료되었습니다.");
		 				location.href="/electronicApproval/individualDocumentBox/refusedApprovalBox";
					}else if(result.al_number=='B'){
						var code="<div class='tableTd tableSign memSign' style='background-image:url(\"/resources/memsign/refuse.jpg\")'></div>";
		 				$("#agreementStatus"+result.priority).html(code);
		 				$("#agree_go").attr("disabled",true);
		 				$("#refuse_go").attr("disabled",true);
		 				alert("거부가 완료되었습니다.");
		 				location.href="/electronicApproval/individualDocumentBox/refusedApprovalBox";
					}
				}else{
					alert("잘못된 비밀번호입니다.");
				}
			},
			dataType:"json"				// dataType
		});
	}	
	refuseSubmitCall=refuseSubmit;
    //////////////////////////////////////////////////////////////////////// 
    
    
    //결재 이력
	$("#approvalHistory_go").click(function(){
		$.ajax({
			url:'/electronicApproval/individualDocumentBox/completeAllrovalDetail',
			type:'get',
			data: $("#buttonForm").serialize(),
			success : function(res){
				var code = "";
					$.each(res, function (i,value){
					code+='<tr><td>'+value.dept_name+'</td>';
					code+='<td>'+value.position_name+'</td>';
					code+='<td>'+value.mem_name+'</td>';
					code+='<td>'+value.ah_status+'</td>';
					code+='<td>'+value.ah_time+'</td></tr>';
				});
				$("#historyList").append(code);
			},
			dataType : 'json'
		})
		
		$('#approvalHistoryDialog').dialog({
			width: 700,
			height: 500,
			modal: true,
			buttons: {
			   "확인": function() {
					$(this).dialog("close");
				}
			},
			close: function() {
				$('#textArea').val('');
			}
		}); 

	})	
	/* $('#approvalHistory_go').click(function(){
		$('#approvalHistoryDialog').dialog({
			width: 700,
			height: 500,
			modal: true,
			buttons: {
			   "취소": function() {
					$(this).dialog("close");
				}
			},
			close: function() {
				$('#textArea').val('');
			}
		}); 
	}); */
})
</script>
<h2>미결재문서함 상세</h2>
<!-- 선택한 결재문서의 정보들을 가지고 들어와야하고 이 때 필요한 정보를 hidden에 담아 주자 -->
<%-- <input type="hidden" name="ea_number" value="${ea_number}"> --%>
<div class="divALM">
	<form name="hiddenForm" id="buttonForm">
		<input type="hidden" name="ea_number" value="${eaVO.ea_number }">
		<c:choose>
			<c:when test="${mem_al_number eq 'A' }">
				<button type="button" id="approve_go" class="btn btn-default">결재</button>
			</c:when>
			<c:otherwise>
				<button type="button" id="agree_go" class="btn btn-default">합의</button>
			</c:otherwise>
		</c:choose>	
		<c:choose>
			<c:when test="${mem_al_number eq 'A' }">
				<button type="button" id="disapprove_go" class="btn btn-default">반려</button>
			</c:when>
			<c:otherwise>
				<button type="button" id="refuse_go" class="btn btn-default">거부</button>
			</c:otherwise>
		</c:choose>	
	<!-- 	<button type="button" id="insteadApprove_go">전결</button> -->
	<!-- 	<button type="button" id="postpone_go">보류</button> -->
		<button type="button" id="approvalHistory_go" class="btn btn-default">결재이력</button>
	</form>
</div>  

<!-- 결재하기 버튼 다이얼로그 -->
<c:choose>
	<c:when test="${mem_al_number eq 'A' }">
		<div id="approvalDialog">
			<div class="textCenter">
				<h2>결재하기</h2>
			</div>
			<form id="approvalSubmitForm">
				<p class="docTitleDescription">
					<a style="font-weight: bold;">
					${userName}
					</a>&nbsp;님 결재하시겠습니까?
				</p>
				<p class="docTitleDescription">
					<a style="font-weight: bold;">비밀번호&nbsp;&nbsp;:</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="password" id="pwd" name="mem_pwd"  class="form-control eaInputSearch">
				</p>
				<p class="docTitleDescription">
					<a style="font-weight: bold;">결재사유</a>
				</p>
					<input type="hidden" name="ah_ea_number" value="${eaVO.ea_number }">
					<input type="hidden" name="ah_code_number" value="code14">
					<input type="hidden" name="ah_ast_number" value="${ast_number}">
					<input type="hidden" name="ah_status" value="결재">
					<textarea id="textArea" name="ah_comment" class="form-control" style="resize:none; height: 115px;"></textarea>
			</form>   
		</div>
	</c:when>
	<c:otherwise>
		<div id="agreeDialog">
			<div class="textCenter">
				<h2>합의하기</h2>
			</div>			
			<form id="agreeSubmitForm">
				<p class="docTitleDescription">
					<a style="font-weight: bold;">
						<%User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();%>
						<%=user.getUsername() %>
					</a>&nbsp;님 합의 하시겠습니까?
				</p>
<%-- 				<%User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();%> --%>
<%-- 				<%=user.getUsername() %>님 <br> --%>
				<p class="docTitleDescription">
					<a style="font-weight: bold;">비밀번호&nbsp;&nbsp;:</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 					<input type="password" id="pwd" name="mem_pwd"  class="form-control eaInputSearch"> -->
					<input type="password" id="pwd" name="mem_pwd" class="form-control eaInputSearch">
				</p>
<!-- 				비밀번호 <input type="password" id="pwd" name="mem_pwd"><br> -->
<!-- 				합의사유 -->
				<p class="docTitleDescription">
					<a style="font-weight: bold;">합의사유</a>
				</p>
				<input type="hidden" name="ah_ea_number" value="${eaVO.ea_number }">
				<input type="hidden" name="ah_code_number" value="code12">
				<input type="hidden" name="ah_ast_number" value="${ast_number}">
				<input type="hidden" name="ah_status" value="합의">
				<textarea id="textArea" name="ah_comment" class="form-control" style="resize:none; height: 115px;"></textarea>
			</form>   
		</div>
	</c:otherwise>
</c:choose>

<!-- 반려하기 버튼 다이얼로그 -->
<c:choose>
	<c:when test="${mem_al_number eq 'A' }">
		<div id="disapproveDialog">
			<div class="textCenter">
				<h2>반려하기</h2>
			</div>	
			<form id="disapproveSubmitForm">
				<p class="docTitleDescription">
					<a style="font-weight: bold;">
				<%User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();%>
				<%=user.getUsername() %>
					</a>&nbsp;님 반려하시겠습니까?
				</p>			
<%-- 				<%User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();%> --%>
<%-- 				<%=user.getUsername() %>님 반려하시겠습니까?<br> --%>
				<p class="docTitleDescription">
					<a style="font-weight: bold;">비밀번호&nbsp;&nbsp;:</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 					<input type="password" id="pwd" name="mem_pwd"  class="form-control eaInputSearch"> -->
					<input type="password" id="pwd" name="mem_pwd" class="form-control eaInputSearch">
				</p>
<!-- 				비밀번호 <input type="password" id="pwd" name="mem_pwd"><br> -->
				<p class="docTitleDescription">
					<a style="font-weight: bold;">반려사유</a>
				</p>
<!-- 				반려사유 -->
		<!-- 		code12	합의 -->
		<!-- 		code13	거부 -->
		<!-- 		code14	결재 -->
		<!-- 		code15	반대 -->
		<!-- 		code16	전결 -->
				<input type="hidden" name="ah_ea_number" value="${eaVO.ea_number }">
				<input type="hidden" name="ah_code_number" value="code15">
				<input type="hidden" name="ah_ast_number" value="${ast_number}">
				<input type="hidden" name="ah_status" value="반려">
				<textarea id="textArea" name="ah_comment" class="form-control" style="resize:none; height: 115px;"></textarea>
			</form>   
		</div>
		</c:when>
	<c:otherwise>
		<div id="refuseDialog">
			거부하기
			<form id="refuseSubmitForm">
				<%User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();%>
				<%=user.getUsername() %>님 거부하시겠습니까?<br>
				비밀번호 <input type="password" id="pwd" name="mem_pwd"><br>
				반려사유
		<!-- 		code12	합의 -->
		<!-- 		code13	거부 -->
		<!-- 		code14	결재 -->
		<!-- 		code15	반대 -->
		<!-- 		code16	전결 -->
				<input type="hidden" name="ah_ea_number" value="${eaVO.ea_number }">
				<input type="hidden" name="ah_code_number" value="code13">
				<input type="hidden" name="ah_ast_number" value="${ast_number}">
				<input type="hidden" name="ah_status" value="거부">
				<textarea id="textArea" name="ah_comment"></textarea>
			</form>   
		</div>
	</c:otherwise>
</c:choose>


<div id="approvalHistoryDialog">
	<div class="textCenter">
		<h2>결재상태 이력보기</h2>
	</div>		
<!-- 	결재상태 이력보기 -->
	<table class="table textCenter" id="historyList">
		<tr>
			<th>부서</th>
			<th>직급</th>
			<th>이름</th>
			<th>결재종류</th>
			<th>결재시간</th>
		</tr>
	</table>
</div>

<div>
	<input type="hidden" name="ea_doc_number" value="${eaVO.ea_doc_number }">
	<table class="table table-bordered">
		<tr>
			<th class="tableTh">품의번호</th>
			<td colspan="5">${eaVO.ea_number }</td>
			<input type="hidden" name="ea_number" value="${eaVO.ea_number }">
		</tr>
		<tr>
			<th class="tableTh">작성일자</th>
			<td colspan="5">${eaVO.ea_writedate }</td>
		</tr>
		<tr>
			<th class="tableTh">기안자</th>
			<td colspan="5">${mem_name }</td>
		</tr>
		<!-- 결재자 이름-->   
		<tr id="approvalMember">
			<th rowspan="2">결재</th>
			<c:forEach items="${approvalMember}" var="member">
				<th class="tableTd">${member.mem_name }</th>
			</c:forEach>
			<c:forEach var="i" begin="1" end="${lastAstPriorityOfA }" step="1">
				<th class="tableTd"></th>
			</c:forEach>
		</tr>   
		<!-- 결재자 서명 -->                              
		<tr id="approvalStatus">                                 
			<c:forEach items="${approvalMem_sign}" var="sign" varStatus="index">
				<td id="approvalStatus${index.count}"><div class="tableTd tableSign memSign" style="background-image:url('/resources/memsign/${sign }')"></div></td>
			</c:forEach>
			<c:forEach var="i" begin="${noStartA }" end="${noEndA }" step="1">
				<td id="approvalStatus${i}" class="tableTd tableSign"></td>
			</c:forEach>
			<c:forEach var="i" begin="${emptyStartA }" end="5" step="1">
				<td id="approvalStatus${i}" class="tableTd tableSign"></td>
			</c:forEach>
		</tr>      
		<!-- 합의자 이름 -->                          
		<tr id="agreementMember">                                 
			<th rowspan="2">합의</th>        
			<c:forEach items="${agreementMember}" var="member">
				<th class="tableTd">${member.mem_name }</th>
			</c:forEach>
			<c:forEach var="i" begin="1" end="${lastAstPriorityOfB}" step="1">
				<th class="tableTd"></th>
			</c:forEach>
		</tr>   
		<!-- 합의자 서명 -->                               
		<tr id="agreementStatus"> 
			<c:forEach items="${agreementMem_sign}" var="sign" varStatus="index">  
				<td id="agreementStatus${index.count}"><div class="memSign tableTd tableSign" style="background-image:url('/resources/memsign/${sign }')"></div></td>                            
			</c:forEach>
			<c:forEach var="i" begin="${noStartB }" end="${noEndB}" step="1">
				<td id="agreementStatus${i}"  class="tableTd tableSign"></td>
			</c:forEach>
			<c:forEach var="i" begin="${emptyStartB }" end="5" step="1">
				<td id="agreementStatus${i}"  class="tableTd tableSign"></td>
			</c:forEach>
		</tr>
		<tr>
			<th class="tableTh">시행자</th>
			<td colspan="5">${implementMemberName}</td>
		</tr>
		<tr>
			<th class="tableTh">수신 및 참조</th>
			<td colspan="5">${referenceMemberName}</td>
		</tr>
		<tr>
			<th class="tableTh">시행일자</th>
			<td colspan="5">${eaVO.ea_startdate } ~ ${eaVO.ea_enddate}</td>
		</tr>
		<tr>
			<th class="tableTh">제목</th>
			<td colspan="5">${eaVO.ea_title }</td>
		</tr>
		<tr>
			<th colspan="6">내용</th>
		</tr>
		<tr>
			<td colspan="6" style="margin: 0 auto;">
				<div class="textCenter contentContainer" style="margin: 0 auto;">
					${eaVO.ea_content }
				</div>
			</td>	
		</tr>
	</table>
	<div class="insertJoinBtnWrap textCenter">
		<a href="/electronicApproval/approvalProgress/waitingApproval?check=1"><button type="button"  class="btn btn-default">뒤로</button></a>
	</div>
</div>