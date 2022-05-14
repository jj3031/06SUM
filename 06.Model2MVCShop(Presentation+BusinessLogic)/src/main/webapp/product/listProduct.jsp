<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
      
      img {
			  width: 242px;
			  height: 200px;
			}  
    	
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		$(function() {
			 
			
			 $( "button:contains('���� ���� ��')" ).on("click" , function() {
				
				 fncGetProductOrderList("priceDesc");
			});
			 
			 $( "button:contains('���� ���� ��')" ).on("click" , function() {
					
				 fncGetProductOrderList("priceAsc");
			});
			 
			 $( "button:contains('��� ��')" ).on("click" , function() {
					
				 fncGetProductOrderList("prodNoAsc");
			});
			 
			$( ".btn.btn-default.g:contains('������')" ).on("click" , function() {
					//Debug..
					alert( $(this).parent().find("#prodNo").val() );
					self.location ="/product/getProduct?prodNo="+$(this).parent().find("#prodNo").val();
			});
			
			
			$( "button:contains('�˻�')" ).on("click" , function() {
				//Debug..
				
				fncGetUserList('1');
			}); 
			
			$( ".btn.btn-primary.g:contains('��ٱ���')" ).on("click" , function() {
				//Debug..
				alert("��ٱ��� �߰� �Ϸ�");
				self.location ="/wishList/addWishlist?prodNo="+$(this).parent().find("#prodNo").val();
			}); 
		});
		
		
		
		// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
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
		
   // ���� ��ũ�� ajax ��û
	
		


</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="/layout/toolbar.jsp" />


	<div class="container">
	
		<div class="page-header text-info">
	       <h3>��ǰ�����ȸ</h3>
	    </div>

	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>����</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ��</option>
						<option value="3"  ${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>����</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  <input type="hidden" id="orderCondition" name="orderCondition" value="${search.orderCondition}"/>
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� end /////////////////////////////////////-->
		
		<div class="row">
			<div class="col-md-4">
				<button type="button" class="btn btn-primary">���� ���� ��</button>
				<button type="button" class="btn btn-primary">���� ���� ��</button>
				<button type="button" class="btn btn-primary">��� ��</button>
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
								<!-- <img src="/images/uploadFiles/${telNum}" alt="image ����"  height="200" width="242"> -->
		      <c:if test="${!fn:contains(prod.fileName, '&')}">
		      <img src="/images/uploadFiles/${prod.fileName}" alt="image ����"  height="200" width="242">
		      </c:if>
		      <div class="caption">
		        <h3>${prod.prodName}</h3>
		        <p>${prod.prodDetail}</p>
		        	<c:if test="${prod.remain != 0 }">
						<p>�Ǹ��� / ��� ${prod.remain} ��</p>	
					</c:if>
					<c:if test="${prod.remain == 0}">
						<p>������</p>	
					</c:if>
				<c:if test="${prod.remain != 0 }">			
		        <p><a href="#" class="btn btn-primary g" role="button" id="wishlist">��ٱ���</a> <a href="#" class="btn btn-default g" role="button">������</a><input type="hidden"  id="prodNo" value="${prod.prodNo}"/></p>
		        </c:if>
		        <c:if test="${prod.remain == 0}">
		        <p><a href="#" class="btn btn-primary" role="button" disabled="disabled">��ٱ���</a> <a href="#" class="btn btn-default" role="button" disabled="disabled">������</a></p>
		        </c:if>
		        
		      </div>
		    </div>
		  </div>
		  	</c:forEach>
		</div>
		
	
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
</body>
</html>
