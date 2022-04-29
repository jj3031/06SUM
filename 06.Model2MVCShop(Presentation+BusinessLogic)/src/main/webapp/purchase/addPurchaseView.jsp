<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
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
		
		$( ".btn.btn-primary.btn:contains('���')" ).on( "click" , function() {
			
			resetData();
		});
		
		
		 $( "button:contains('����')" ).on( "click" , function() {
			
			 fncAddPurchase();
		});
	 
	});
	
	
		function fncAddPurchase() {
			document.addPurchase.submit();
		}
		
		
		
	</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
		<div class="page-header text-info">
	    </div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
			<h1 class="bg-primary text-center">���� ���� �Է�</h1>
<form class="form-horizontal" name="addPurchase"   method="post" action="/purchase/addPurchase">

<input type="hidden" name="prodNo" value="${purchase.purchaseProd.prodNo}" />


	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      ${purchase.purchaseProd.prodName}
		    </div>
	</div>
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��ǰ �� ����</label>
		    <div class="col-sm-4">
		      ${purchase.purchaseProd.prodDetail}
		    </div>
	</div>	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      ${purchase.purchaseProd.manuDate}
		    </div>
	</div>	
	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		     ${purchase.purchaseProd.price}
		    </div>
	</div>	
	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
		    <div class="col-sm-4">
		    ${purchase.purchaseProd.regDate}
		    </div>
	</div>	
	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		    <div class="col-sm-4">
		    ${user.userId}
		    </div>
		    <input type="hidden" name="buyerId" value="${purchase.buyer.userId}" />
	</div>			

	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		    <div class="col-sm-4">
			<select 	name="paymentOption"		class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20">
				<option value="1" selected="selected">���ݱ���</option>
				<option value="2">�ſ뱸��</option>
			</select>
		    </div>
	</div>	

	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">���ż���</label>
		    <div class="col-sm-4">
				<select 	name="purchaseQt"		class="ct_input_g" 
								style="width: 100px; height: 19px" maxLength="20">
					<c:forEach var="i" begin="1" end="${purchase.purchaseProd.remain}" >			
						<option value="${i}">${i}��</option>
					</c:forEach>
				</select>
		    </div>
	</div>

	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		    <div class="col-sm-4">
			<input type="text" class="form-control"  name="receiverName" value="${user.userName}" />
		    </div>
	</div>	

	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
		    <div class="col-sm-4">
			<input type="text" class="form-control"  name="receiverPhone" value="${user.phone}" />
		    </div>
	</div>	
	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		    <div class="col-sm-4">
			<input type="text" class="form-control"  name="divyAddr" value="${user.addr}" />
		    </div>
	</div>		

	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    <div class="col-sm-4">
			<input type="text" class="form-control"  name="divyRequest"  />
		    </div>
	</div>		
	
	<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		    <div class="col-sm-4">
			<input 	type="text"  name="divyDate" class="form-control" 
							style="width: 100px; height: 19px" maxLength="20"/>
			&nbsp;<img 	src="../images/ct_icon_date.gif" width="15" height="15"	
						onclick="show_calendar('document.addPurchase.divyDate', document.addPurchase.divyDate.value)"/>
		    </div>
	</div>

		 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >����</button>
			  <a class="btn btn-primary btn" href="#" role="button">���</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>