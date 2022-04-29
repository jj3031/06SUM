<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
<!--
// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
function fncGetUserList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
}
-->
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="/layout/toolbar.jsp" />


	<div class="container">
	
		<div class="page-header text-info">
	       <h3><c:if test="${user.role=='admin' }">
						�Ǹ� ��� ��ȸ
						</c:if>
						<c:if test="${user.role=='user' }">
						���� ��� ��ȸ
						</c:if></h3>
	    </div>

	    <div class="row">
	
			<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
						
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
					<input type="hidden" id="currentPage" name="currentPage" value=""/>
			</form>
	    	</div>
	    	
		</div>

      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >ȸ�� ID</th>
            <th align="left">ȸ����</th>
            <th align="left">��ȭ��ȣ</th>
            <th align="left">�����Ȳ</th>
            <th align="left">��������</th>
          </tr>
        </thead>

<tbody>
	<c:forEach items="${purchaseList}" var="list" varStatus="status">		
	<tr class="ct_list_pop">
		<td align="center">${status.count}</td>
		<td align="left"><a href="/purchase/getPurchase?tranNo=${list.tranNo}">${list.buyer.userId}</a></td>
		<td align="left">${list.buyer.userName}</td>
		<td align="left">${list.buyer.phone}</td>
		<td align="left">
			
				<c:if test="${list.tranCode=='1' }">
					���� ���ſϷ� �����Դϴ�.
				</c:if>
				<c:if test="${list.tranCode=='2' }">
					���� ��� �� �����Դϴ�.
				</c:if>		
				<c:if test="${list.tranCode=='3' }">
					���� ��� �Ϸ� �����Դϴ�.
				</c:if>								
			
		</td>		
		<td align="left">
				<c:if test="${list.tranCode=='1' }">
					<c:if test="${user.role=='admin'}">
						���ſϷ� <a href="/purchase/updateTranCode?tranNo=${list.tranNo}&tranCode=2">����ϱ�</a>	
					</c:if>
				</c:if>	
				<c:if test="${list.tranCode=='2' }">
					<c:if test="${user.userId == list.buyer.userId }">
					<a href="/purchase/updateTranCode?tranNo=${list.tranNo}&tranCode=3">���ǵ���</a>
					</c:if>	
				</c:if>				
				<c:if test="${list.tranCode=='3' }">
					���� ��� �Ϸ� �����Դϴ�.
				</c:if>					
			 </td>	
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->

 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
</body>
</html>
