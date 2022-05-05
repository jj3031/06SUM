<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
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
// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
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
	       <h3>장바구니</h3>
	</div>
<form name="detailForm" method="post">
 <!--  table Start /////////////////////////////////////-->
	<table class="table table-hover table-striped" >
		<thead>
          <tr>
            <th align="center"></th>
            <th align="left" >No</th>
            <th align="left">상품명</th>
            <th align="left">가격</th>
            <th align="left">현재상태</th>
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
				구매 가능 / 재고 ${wish.remain} 개	
			</c:if>
			<c:if test="${wish.remain <= 0}">
				품절	
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
		<button type="button" class="btn btn-primary">선택상품구매</button>
		<button type="button" class="btn btn-primary">선택상품삭제</button>
		<button type="button" class="btn btn-primary">취소</button>
	</div>
</div>
</form>
	<script type="text/javascript">
	
		
	 	$( "button:contains('선택상품구매')" ).on("click" , function() {
			//Debug..
	 		$(self.location).attr("href","javascript:fncAddPurchaseViewByWishlist();");
		}); 
	 	
	 	$( "button:contains('선택상품삭제')" ).on("click" , function() {
			//Debug..
	 		$(self.location).attr("href","javascript:fncDeleteWishlist();");
		}); 
	 	
	 	$( "button:contains('취소')" ).on("click" , function() {
			//Debug..
	 		$(self.location).attr("href","javascript:history.go(-1)");
		}); 
	 	
	</script>  
</div>
</body>
</html>
