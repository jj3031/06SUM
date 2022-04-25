<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"  %>


<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@ page import="com.model2.mvc.service.domain.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 










<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

		// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
		function fncGetUserList(currentPage) {
			//document.getElementById("currentPage").value = currentPage;
			$("#currentPage").val(currentPage)
		   	//document.detailForm.submit();
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
		}

		function fncGetProductOrderList(orderCondition) {
			document.getElementById("orderCondition").value = orderCondition;
   			//document.detailForm.submit();
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
		}

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">

						
						<c:if test ="${param.menu=='manage'}">
							�Ǹ� ��ǰ ����
						</c:if>
						<c:if test ="${param.menu=='search'}">
							��ǰ �˻�
						</c:if>						
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" ${search.searchCondition == '0' ? "selected" : ""}>����</option>
				<option value="1" ${search.searchCondition == '1' ? "selected" : ""}>��ǰ��ȣ</option>
				<option value="2" ${search.searchCondition == '2' ? "selected" : ""}>��ǰ��</option>
				<option value="3" ${search.searchCondition == '3' ? "selected" : ""}>����</option>				
			</select>
			<input 	type="text" name="searchKeyword" value="${search.searchKeyword}"  class="ct_input_g" 
							style="width:200px; height:20px" >
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetUserList('1');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>



<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������</td>
	</tr>
	<tr>
	 <input type="hidden" id="orderCondition" name="orderCondition" value="${search.orderCondition}"/>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductOrderList('priceDesc');">���� ���� ��</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>	
	<tr>	
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductOrderList('priceAsc');">���� ���� ��</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>	
	<tr>	
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductOrderList('prodNoAsc');">��� ��</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>				
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:set var="i" value="0" />
	<c:forEach var="prod" items="${prodList}">
		<c:set var="i" value="${ i+1 }" />
	<tr class="ct_list_pop">
		<td align="center">${ i }</td>
		<td></td>
		<td align="left"><a href="/product/getProduct?prodNo=${prod.prodNo}"> ${prod.prodName}</a></td>
		<td></td>
		<td align="left">${prod.price}</td>
		<td></td>
		<td align="left">${prod.manuDate}</td>
		<td></td>
		<td align="left">
		
			<c:if test="${prod.remain != 0 }">
				�Ǹ��� / ��� ${prod.remain} ��	
			</c:if>
			<c:if test="${prod.remain == 0}">
				������	
			</c:if>												

		</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	</c:forEach>
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value="${search.currentPage }"/>
	<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// 		   
	<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
			�� ����
	<% }else{ %>
			<a href="javascript:fncGetUserList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
	<% } %>

	<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
			<a href="javascript:fncGetUserList('<%=i %>');"><%=i %></a>
	<% 	}  %>
	
	<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
			���� ��
	<% }else{ %>
			<a href="javascript:fncGetUserList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
	<% } %>
	 /////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
	
		<jsp:include page="../common/pageNavigator.jsp"/>
		
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>
