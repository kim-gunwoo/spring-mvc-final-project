<%@page import="com.nyngw.mypage.basicSetting.service.BasicSettingServiceImpl"%>
<%@page import="com.nyngw.dto.MemberVO"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.userdetails.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script>
	function documentDelete(id){
		var con_test = confirm("정말 삭제 하시겠습니까?");
		if(con_test==true){
			$.ajax({
	            type : "POST",
	            url : "/documentManagement/documentManager/edocumentDelete",
	            data : {'id' : id},
	            success : function(result){
	            	location.href=result.uri;
		        }, 
		        error : function(){
		        },
	            dataType : 'json' 
			});
		}
	}
</script>
<style>
th{
	width: 120px;
}
</style>
<h2>전자문서 상세</h2>
<p class="docTitleDescription">
	전자 문서의 상세보기입니다.
</p>
	<div>
		<table class="table table-bordered tableGray">
			<tr>
				<th>문서번호</th><td>${document.doc_number }</td>
				<th>등록자</th><td>${mem.mem_name } </td>
				<th colspan="2">전자결재문서<input type="hidden" name="doc_eadoc" value="${document.doc_eadoc }"></th>		
			</tr>
			<tr>
				<th>문서명</th><td colspan="5">${document.doc_name }</td>
			</tr>
			<tr>
				<th>등록일자</th><td colspan="3"><fmt:formatDate value="${document.doc_date}" pattern="yyyy/MM/dd"/></td>
				<th>보존기간</th><td><fmt:formatDate value="${document.doc_lifetime}" pattern="yyyy/MM/dd"/></td>
			</tr>
			<tr>
				<th>내용</th><td colspan="5">${document.doc_content }</td>
			</tr>
		</table>
	</div>
	<div class="insertJoinBtnWrap textCenter">
	<c:choose>
		<c:when test="${mem.mem_id eq loginuser}">
			<button class="btn btn-default"><a href="/documentManagement/documentManager/edocumentUpdateForm?doc_number=${document.doc_number }&page=${pageNumber}">수정</a></button>
			<button class="btn btn-default" type="button" onclick="documentDelete('${document.doc_number}');">삭제하기</button>
			<button class="btn btn-default"><a href="/documentManagement/documentManager/edocumentSelect?page=${page }">목록</a></button>
		</c:when>
		<c:otherwise>
			<button class="btn btn-default"><a href="/documentManagement/documentManager/edocumentSelect?page=${page }">목록</a></button>
		</c:otherwise>
	</c:choose>
	</div>
