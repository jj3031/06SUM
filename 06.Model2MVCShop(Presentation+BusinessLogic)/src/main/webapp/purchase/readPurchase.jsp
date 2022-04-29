<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
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
	
	<script type="text/javascript" src="../javascript/calendar.js"></script>



	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	$(function() {
		
		$( ".btn.btn-primary.btn:contains('취소')" ).on( "click" , function() {
			
			resetData();
		});
		
		
		 $( "button:contains('수정')" ).on( "click" , function() {
			
			 fncUpdatePurchaseView();
		});
	 
	});


function fncUpdatePurchaseView() {
	document.updatePurchaseView.submit();
}


</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
		<div class="page-header text-info">
	    </div>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
			<h1 class="bg-primary text-center">구매 정보 조회</h1>
			
<form class="form-horizontal" name="addPurchase"   method="post" action="/purchase/addPurchase">
	<input type="hidden" name="tranNo" value="${purchase.tranNo}" />
<input type="hidden" name="prodNo" value="${purchase.purchaseProd.prodNo}" />


	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      ${purchase.purchaseProd.prodName}
		    </div>
	</div>
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상품 상세 정보</label>
		    <div class="col-sm-4">
		      ${purchase.purchaseProd.prodDetail}
		    </div>
	</div>	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">구매 수량</label>
		    <div class="col-sm-4">
		      ${purchase.purchaseQt}
		    </div>
	</div>		
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      ${purchase.purchaseProd.manuDate}
		    </div>
	</div>	
	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		     ${purchase.purchaseProd.price}
		    </div>
	</div>	
	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">등록일자</label>
		    <div class="col-sm-4">
		    ${purchase.purchaseProd.regDate}
		    </div>
	</div>	
	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    <div class="col-sm-4">
		    ${user.userId}
		    </div>
		    <input type="hidden" name="buyerId" value="${purchase.buyer.userId}" />
	</div>			

	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">구매 방법</label>
		    <div class="col-sm-4">
		  			<c:if test="${purchase.paymentOption == '1' }">
				현금 구매
			</c:if>
			<c:if test="${purchase.paymentOption == '2' }">
				신용 구매
			</c:if>
		    </div>
	</div>	

	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">등록일자</label>
		    <div class="col-sm-4">
		    ${purchase.purchaseProd.regDate}
		    </div>
	</div>	
	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">등록일자</label>
		    <div class="col-sm-4">
		    ${purchase.purchaseProd.regDate}
		    </div>
	</div>	

	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">구매자 이름</label>
		    <div class="col-sm-4">
		    ${purchase.receiverName}
		    </div>
	</div>

	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
		    <div class="col-sm-4">
		    ${purchase.receiverPhone}
		    </div>
	</div>	

	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">구매자 주소</label>
		    <div class="col-sm-4">
		    ${purchase.divyAddr}
		    </div>
	</div>	

	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		    <div class="col-sm-4">
		    ${purchase.divyRequest}
		    </div>
	</div>	
	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    <div class="col-sm-4">
		    ${purchase.divyDate}
		    </div>
	</div>									


		 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    <c:if test="${purchase.tranNo == '1' }">	
		      <button type="button" class="btn btn-primary"  >수정</button>
		    </c:if>  
			  <a class="btn btn-primary btn" href="#" role="button">취소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>
</html>