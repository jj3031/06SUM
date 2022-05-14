<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
      
      img {
			  width: 242px;
			  height: 200px;
			}  
    	
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		$(function() {
			 
			
			 $( "button:contains('가격 높은 순')" ).on("click" , function() {
				
				 fncGetProductOrderList("priceDesc");
			});
			 
			 $( "button:contains('가격 낮은 순')" ).on("click" , function() {
					
				 fncGetProductOrderList("priceAsc");
			});
			 
			 $( "button:contains('등록 순')" ).on("click" , function() {
					
				 fncGetProductOrderList("prodNoAsc");
			});
			 
			$( ".btn.btn-default.g:contains('상세정보')" ).on("click" , function() {
					//Debug..
					alert( $(this).parent().find("#prodNo").val() );
					self.location ="/product/getProduct?prodNo="+$(this).parent().find("#prodNo").val();
			});
			
			
			$( "button:contains('검색')" ).on("click" , function() {
				//Debug..
				
				fncGetUserList('1');
			}); 
			
			$( ".btn.btn-primary.g:contains('장바구니')" ).on("click" , function() {
				//Debug..
				alert("장바구니 추가 완료");
				self.location ="/wishList/addWishlist?prodNo="+$(this).parent().find("#prodNo").val();
			}); 
		});
		
		
		
		// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
		function fncGetUserList(currentPage) {
			//document.getElementById("currentPage").value = currentPage;
			alert("debug");
			$("#currentPage").val(currentPage)
		   	//document.detailForm.submit();
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
		}

		function fncGetProductOrderList(orderCondition) {
			//document.getElementById("orderCondition").value = orderCondition;
			$("#orderCondition").val(orderCondition)
   			//document.detailForm.submit();
			fncGetUserList(1);
		}
		
   // 무한 스크롤 ajax 요청
	
		


</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="/layout/toolbar.jsp" />


	<div class="container">
	
		<div class="page-header text-info">
	       <h3>상품목록조회</h3>
	    </div>

	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>선택</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품명</option>
						<option value="3"  ${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  <input type="hidden" id="orderCondition" name="orderCondition" value="${search.orderCondition}"/>
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 end /////////////////////////////////////-->
		
		<div class="row">
			<div class="col-md-4">
				<button type="button" class="btn btn-primary">가격 높은 순</button>
				<button type="button" class="btn btn-primary">가격 낮은 순</button>
				<button type="button" class="btn btn-primary">등록 순</button>
			</div>
			<div class="col-md-4"></div>
			<div class="col-md-4"></div>
		</div>		


		<div class="row">
			<c:forEach var="prod" items="${prodList}">
		  <div class="col-sm-6 col-md-4">
		    <div class="thumbnail">

		      <c:if test="${fn:contains(prod.fileName, '&')}">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">			 
						<div class="carousel-inner" role="listbox">		  
							<c:set var="product" value="${fn:split(prod.fileName,'&')}" />
								<c:forEach var="telNum" items="${product}" varStatus="g">
									<!-- Wrapper for slides -->								 
								 <c:if test="${g.count==1}">
								    <div class="item active">
								      <img src="/images/uploadFiles/${telNum}" >
								    </div>
								 </c:if>
								 
								 <c:if test="${g.count!=1}">   
								    <div class="item">
								      <img src="/images/uploadFiles/${telNum}" >
								    </div>
								 </c:if>		    
								</c:forEach>
						</div>
				</div>
								
				</c:if>				
								<!-- <img src="/images/uploadFiles/${telNum}" alt="image 없음"  height="200" width="242"> -->
		      <c:if test="${!fn:contains(prod.fileName, '&')}">
		      <img src="/images/uploadFiles/${prod.fileName}" alt="image 없음"  height="200" width="242">
		      </c:if>
		      <div class="caption">
		        <h3>${prod.prodName}</h3>
		        <p>${prod.prodDetail}</p>
		        	<c:if test="${prod.remain != 0 }">
						<p>판매중 / 재고 ${prod.remain} 개</p>	
					</c:if>
					<c:if test="${prod.remain == 0}">
						<p>재고없음</p>	
					</c:if>
				<c:if test="${prod.remain != 0 }">			
		        <p><a href="#" class="btn btn-primary g" role="button" id="wishlist">장바구니</a> <a href="#" class="btn btn-default g" role="button">상세정보</a><input type="hidden"  id="prodNo" value="${prod.prodNo}"/></p>
		        </c:if>
		        <c:if test="${prod.remain == 0}">
		        <p><a href="#" class="btn btn-primary" role="button" disabled="disabled">장바구니</a> <a href="#" class="btn btn-default" role="button" disabled="disabled">상세정보</a></p>
		        </c:if>
		        
		      </div>
		    </div>
		  </div>
		  	</c:forEach>
		</div>
		
	
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
</body>
</html>
