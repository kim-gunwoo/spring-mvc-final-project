<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>게시글 수정</h2>
<p class="docTitleDescription">
	게시글을 수정할 수 있습니다.
</p>
<div>
	<form name="tx_editor_form" id="tx_editor_form" action="/sharingInformation/board/update" method="post">
		<table class="table table-bordered tableGray">
			<tr>
				<th>게시글번호</th>
				<td>${board.board_number }<input type="hidden" value="${board.board_number}" name="board_number" readonly="readonly"></td>
				<th>게시글구분번호</th>
				<td>공지사항</td>
				<th>작성자</th>
				<td>${board.mem_name}<input type="hidden" name="board_mem_number" value="${board.board_mem_number}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" class="form-control" name="board_title" value="${board.board_title}"></td>
				<th>작성일</th>
				<td><fmt:formatDate value="${board.board_date}" pattern="yyyy/MM/dd"/></td>
			</tr>
			<tr>
				<th colspan="6">내용</th>
			</tr>
		</table>
		<jsp:include page="/WEB-INF/views/common/daumOpenEditor/editor.jsp" flush="false"/>
		<table class="table table-bordered tableGray">
			<tr>
				<th style="width: 100px;">파일이름</th>
				<td colspan="5">${board.board_file_name }</td>
			</tr>
		</table>	
		<div class="insertJoinBtnWrap textCenter">
			<input type="hidden" value="${page}">
			<button onclick='saveContent()' class="btn btn-default">수정</button>
			<input type="reset" value="초기화" class="btn btn-default"/>
			<button type="button"class="btn btn-default"><a href="/sharingInformation/board/list?page=${page }">취소</a></button>
		</div>
	</form>
</div>

<textarea id="text_content" style="display:none;">
${board.board_content}
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
