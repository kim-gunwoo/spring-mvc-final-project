<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.userdetails.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
 %>

<script>
 $(document).on("click",".guideBox > p",function(){
      if($(this).next().css("display")=="none"){
        $(this).next().show();
        $(this).children("span").text("[�ݱ�]");
      }else{
        $(this).next().hide();
        $(this).children("span").text("[����]");
      }
});
 </script>
 
 <script>
function print(printArea)
{
      win = window.open(); 
      self.focus(); 
      win.document.open();
      
      /*
         1. div ���� ��� �±׵��� innerHTML�� ����Ͽ� �Ű������� �޴´�.
         2. window.open() �� ����Ͽ� �� �˾�â�� ����.
         3. ���� �� �˾�â�� �⺻ <html><head><body>�� �߰��Ѵ�.
         4. <body> �ȿ� �Ű������� ���� printArea�� �߰��Ѵ�.
         5. window.print() �� �μ�
         6. �μ� Ȯ���� �Ǹ� �˾�â�� �ڵ����� window.close()�� ȣ���Ͽ� ����
      */
      win.document.write('<html><'head'><title></title><style>');
      win.document.write('body, td {font-falmily: Verdana; font-size: 10pt;}');
      win.document.write('</style></haed><body>');
      win.document.write(printArea);
      win.document.write('</body></html>');
      win.document.close();
      
      win.print();
      win.close();
}
</script>

���������� >> ���� �޿� ���� >> ������ ��Ȳ
<div class="guideBox">
  <p><button class="btn btn-primary" id="printArea">������Ȯ���ϱ�!</button></p>
  <div style="display:none">
          <table class="table table-bordered" >
   		<tr>
   			<th>����</th>
   			<td><%=user.getUsername() %></td>
   			<th>�μ�</th>
   			<td>������ �μ�</td>
   		</tr>
   		<tr>
   			<th>��å</th>
   			<td>������ ��å</td>
   			<th>�μ�</th>
   			<td>������ �μ�</td>
   		</tr>
   		<tr>
   			<th>�ٹ�����</th>
   			<td>1��</td>
   			<th>������</th>
   			<td>1��</td>
   		</tr>
   	</table>
  </div>
</div>

<input type = "button" OnClick="print(document.getElementById('printArea').innerHTML)" value="����Ʈ"/>