<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>공지사항 수정</h2>
<p class="docTitleDescription">
	공지사항을 수정할 수 있습니다.
</p>    
	<div>
		<form name="tx_editor_form" id="tx_editor_form" action="/sharingInformation/noticeMatter/nmUpdate" method="post"  accept-charset="utf-8">
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
					<td colspan="3"><input type="text" name="board_title" value="${board.board_title}"></td>
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
					<td>${board.board_file_name }</td>
				</tr>
			</table>
			<div class="insertJoinBtnWrap textCenter">
				<input type="hidden" value="${page}">
				<button type="button" onclick="saveContent();" class="btn btn-default">수정</button>
				<input type="reset" value="초기화" class="btn btn-default"/>
				<button type="button" class="btn btn-default"><a href="/sharingInformation/noticeMatter/nmList?page=${page }">취소</a></button>
			</div>
		</form>
	</div>
<textarea id="text_content" style="display:none;">
${board.board_content}
</textarea>
<script>
$(function(){   
	var loadContent = function() {
		/* 저장된 컨텐츠를 불러오기 위한 함수 호출 */
		Editor.modify({
//				"attachments": function () { /* 저장된 첨부가 있을 경우 배열로 넘김, 위의 부분을 수정하고 아래 부분은 수정없이 사용 */
//					var allattachments = [];
//					for (var i in attachments) {
//						allattachments = allattachments.concat(attachments[i]);
//					}
//					return allattachments;
//				}(),
			"content": document.getElementById("text_content") /* 내용 문자열, 주어진 필드(textarea) 엘리먼트 */
		});
	};
	
	loadContent();
});
</script>	