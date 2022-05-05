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
function fncAddPurchaseViewByWishlist() {
	document.detailForm.action='/purchase/addPurchaseViewByWishlist';
   	document.detailForm.submit();
}

function fncDeleteWishlist() {
	document.detailForm.action='/wishList/deleteWishlist';
   	document.detailForm.submit();
}
-->
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	<div class="page-header text-info">
	       <h3>��ٱ���</h3>
	</div>
<form name="detailForm" method="post">
 <!--  table Start /////////////////////////////////////-->
	<table class="table table-hover table-striped" >
		<thead>
          <tr>
            <th align="center"></th>
            <th align="left" >No</th>
            <th align="left">��ǰ��</th>
            <th align="left">����</th>
            <th align="left">�������</th>
          </tr>
        </thead>

		<tbody>    
	<c:set var="i" value="0" />
	<c:forEach var="wish" items="${wishlist}">
	<c:set var="i" value="${ i+1 }" />
	<tr>
		<td>
		<c:if test="${wish.remain > 0 }"><input align="center" type="checkbox" name="wishNo" value="${wish.wishNo}"></c:if> </td>
		<td align="left">${ i }</td>
		<td align="left">${wish.prodName}</td>
		<td align="left">${wish.price}</td>
		<td align="left">
			<c:if test="${wish.remain > 0 }">
				���� ���� / ��� ${wish.remain} ��	
			</c:if>
			<c:if test="${wish.remain <= 0}">
				ǰ��	
			</c:if>												
		</td>	
	</tr>
	</c:forEach>
	</tbody>
</table>


<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<button type="button" class="btn btn-primary">���û�ǰ����</button>
		<button type="button" class="btn btn-primary">���û�ǰ����</button>
		<button type="button" class="btn btn-primary">���</button>
	</div>
</div>
</form>
	<script type="text/javascript">
	
		
	 	$( "button:contains('���û�ǰ����')" ).on("click" , function() {
			//Debug..
	 		$(self.location).attr("href","javascript:fncAddPurchaseViewByWishlist();");
		}); 
	 	
	 	$( "button:contains('���û�ǰ����')" ).on("click" , function() {
			//Debug..
	 		$(self.location).attr("href","javascript:fncDeleteWishlist();");
		}); 
	 	
	 	$( "button:contains('���')" ).on("click" , function() {
			//Debug..
	 		$(self.location).attr("href","javascript:history.go(-1)");
		}); 
	 	
	</script>  
</div>
</body>
</html>
