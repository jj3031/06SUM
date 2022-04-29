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
			
			
			 $( "button:contains('구매')" ).on( "click" , function() {
				
				 fncAddPurchase();
			});
			 
			 $( "button:contains('장바구니추가')" ).on("click" , function() {
					//Debug..
					alert("장바구니 추가 완료");
					self.location ="/wishList/addWishlist?prodNo="+${product.prodNo};
				}); 
			 
			 $( "button:contains('수정')" ).on("click" , function() {
					//Debug..
					//alert("장바구니 추가 완료");
					self.location ="/product/updateProductView?prodNo="+${product.prodNo};
				}); 
		 
		});
		
		function fncAddPurchase(){
			document.detailForm.action="/purchase/addPurchaseView?prod_no="+${product.prodNo};
			//document.detailForm.method='post';
			//document.detailForm.submit();
			$("form").attr("method" , "POST").submit();
		}
		
		function resetData(){
			document.detailForm.reset();
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
			<h1 class="bg-primary text-center">상 품 정 보</h1>
			<form class="form-horizontal" name="detailForm"  enctype="multipart/form-data">
	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      ${product.prodName}
		    </div>
	</div>
	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상품 상세 정보</label>
		    <div class="col-sm-4">
		      ${product.prodDetail}
		    </div>
	</div>
	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      ${product.manuDate}
		    </div>
	</div>

	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      ${product.price}
		    </div>
	</div>
	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">재고</label>
		    <div class="col-sm-4">
		      ${product.remain}
		    </div>
	</div>
	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		    	<c:forEach var="file" items="${fileName}">
		    	<td height="26">
				<img src="/images/uploadFiles/${file}"/>
				</td>
				</c:forEach>
		      <div id="image_container"></div>
		    </div>
	</div>			

		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    
		   	  <c:if test= "${product.remain != 0}">
		      <button  type="button" class="btn btn-primary"  >구매</button>
		      <button  type="button" class="btn btn-primary"  >장바구니추가</button>
		      </c:if>
		      <c:if test="${user.role=='admin'}">
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
