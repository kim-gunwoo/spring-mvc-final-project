<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script>
   $(function(){  
       $('#searchDate option[value=${select.searchDate}]').prop('selected',true);
       $('#reportType option[value=${select.reportType}]').prop('selected',true);
       $('#titleType option[value=${select.titleType}]').prop('selected',true);
   });
</script>
<body>
<h2>�μ����� ��ȸ</h2>
<p class="docTitleDescription">
	�α����� ����� �μ������� ��ȸ �� �� �ִ�.
</p>
   <div class="eaSearchDivMagin">
      <form action="/businessSupport/dutyDocument/department">
           �˻��Ⱓ
              <select name="searchDate" id="searchDate" class="form-control docInputSelect" style="width: 100px;">
                 <option value="today">����</option>
                 <option value="week">1����</option>
                 <option value="month">1����</option>
                 <option value="trimester">3����</option>
              </select>&nbsp;
           ��������
              <select name="reportType" id="reportType" class="form-control docInputSelect" style="width: 120px;">
                 <option value="">��ü</option>
                 <option value="code1">��������</option>
                 <option value="code2">�ְ�����</option>
                 <option value="code3">��������</option>
              </select>&nbsp;
           �˻��Է�
              <select name="titleType" id="titleType" class="form-control docInputSelect" style="width: 100px;">
                 <option value="">��ü</option>
                 <option value="dd_title">����</option>
                 <option value="mem_name">�ۼ���</option>
              </select>&nbsp;
            <input type="text" name="val" value="${select.val}" class="form-control eaInputSearch" style="width: 225px;">
            <input type="submit" value="�˻�"  class="btn btn-default">
      </form>
      <br>
      <br>
      <table class="table table-border textCenter">
         <tr>
            <th>��ȣ</th>
            <th>����������</th>
            <th>����</th>
            <th>��������</th>
            <th>�ۼ���</th>
            <th>�����</th>
         </tr>
         <c:choose>
            <c:when test="${viewData.documentTotalCount > 0 }">
               <c:forEach items="${viewData.documentList }" var="board" varStatus="i">
                  <tr>
                     <td>${fn:substring(board.dd_number,2,10077777)}</td>
                     <td><fmt:formatDate value="${board.dd_date}" pattern="yyyy/MM/dd"/></td>
                     <td><a href="/businessSupport/dutyDocument/departmentDetail?dd_number=${board.dd_number}&page=${pageNumber}&searchDate=${select.searchDate}&reportType=${select.reportType}&val=${select.val}&titleType=${select.titleType}">${board.dd_title}</a></td>
                     <td>${board.dd_code_name }</td>
                     <td>${board.dd_name}</td>
                     <td><fmt:formatDate value="${board.dd_date}" pattern="yyyy/MM/dd"/></td>
                  </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td style="text-align: center;" colspan="6">������ �����ϴ�.</td>
               </tr>
            </c:otherwise>
         </c:choose>
      </table>
      <div id="pageNum" class="insertJoinBtnWrap textCenter">
<%--          <c:forEach begin="1" end="${viewData.getPageTotalCount()}" step="1" var="i">  --%>
<%--             <a href="/businessSupport/dutyDocument/department?page=${i}&searchDate=${select.searchDate}&reportType=${select.reportType}&val=${select.val}&titleType=${select.titleType}">[${i}]</a>  --%>
<%--           </c:forEach>  --%>
          
         <c:if test="${beginPage > perPage}">
            <a href="<c:url value="/businessSupport/dutyDocument/department?page=${beginPage-1}&searchDate=${select.searchDate}&reportType=${select.reportType}&val=${select.val}&titleType=${select.titleType}"/>">����</a>
         </c:if>
         <c:forEach var="i" begin="${beginPage}" end="${endPage}">
            <a href="/businessSupport/dutyDocument/department?page=${i}&searchDate=${select.searchDate}&reportType=${select.reportType}&val=${select.val}&titleType=${select.titleType}">[${i}]</a>
         </c:forEach>
         <c:if test="${endPage < viewData.getPageTotalCount()}">
            <a href="<c:url value="/businessSupport/dutyDocument/department?page=${endPage + 1}&searchDate=${select.searchDate}&reportType=${select.reportType}&val=${select.val}&titleType=${select.titleType}"/>">����</a>
         </c:if>         
      </div>
   </div>
</body>
</html>