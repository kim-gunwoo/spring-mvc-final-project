<%@page import="com.nyngw.dto.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<h2>게시판 조회</h2>
	<p class="docTitleDescription">
		게시판 게시글을 확인할 수 있습니다.
	</p>
	<div id="searchDiv" style="text-align: center;">
	<div>
	<form action="/sharingInformation/board/list">
		<select name="index" class="form-control docInputSelect">
				<option value="board_mem_number">작성자</option>
				<option value="board_title" selected="selected">제목</option>
		</select>
		<input type="hidden" value="${select.index}">
		<input type="text" name="val" value="${select.val}" class="form-control docInputSearch">
		<input type="submit" value="검색" class="btn btn-default">
	</form>
	</div>
	</div>
	<br>
	<div></div>
	<br>
		<div class="insertDocBtnWrap textRight">
		<button type="button"class="btn btn-default"><a href="/sharingInformation/board/writeForm?page=${pageNumber }">등록</a></button>
		</div>
	
	<table class="table table-bordered textCenter">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>등록일</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${viewData.boardTotalCount > 0 }">
				<c:forEach items="${viewData.boardList }" var="board" varStatus="i">
					<tr>
						<td>${fn:substring(board.board_number,5,10077777)}</td>
						<td><a href="/sharingInformation/board/detail?board_number=${board.board_number}&page=${pageNumber}">${board.board_title }</a></td>
						<td><fmt:formatDate value="${board.board_date}" pattern="yyyy/MM/dd"/></td>
						<td>${board.mem_name }</td>
						<td>${board.board_count}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td style="text-align: center;" colspan="5">내용이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	
	
	<div id="pageNum" class="textCenter insertJoinBtnWrap  pageBottoWrap">
		<c:if test="${beginPage > perPage}">
			<a href="<c:url value="/sharingInformation/board/list?page=${beginPage-1}&index=${select.index}&val=${select.val}"/>">이전</a>
		</c:if>
		<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
			<a href="<c:url value="/sharingInformation/board/list?page=${pno}&index=${select.index}&val=${select.val}" />">[${pno}]</a>
		</c:forEach>
		<c:if test="${endPage < viewData.getPageTotalCount()}">
			<a href="<c:url value="/sharingInformation/board/list?page=${endPage + 1}&index=${select.index}&val=${select.val}"/>">다음</a>
		</c:if>
	</div>
