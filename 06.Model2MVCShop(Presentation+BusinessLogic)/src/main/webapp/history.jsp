<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head>

<title>열어본 상품 보기</title>

</head>
<body>
<br>
<br>
<%
	String history = null;
	Cookie[] cookies = request.getCookies();
	if (cookies!=null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			if (cookie.getName().equals("history")) {
				history = cookie.getValue();
			}
		}
		if (history != null) {
			String[] h = history.split("/");
			for (int i = 0; i < h.length; i++) {
				if (!h[i].equals("null")) {
					String[] s = h[i].split("&");
%>

<a href="/product/getProduct?prodNo=<%=s[2]%>&menu=search"
	target="rightFrame"><%=s[0]%></a>
					<td height="10">
						<img src="/images/uploadFiles/<%=s[1]%>" width="70" height="70"/>
					</td>
<br>

<%
				}
			}
		}
	}
%>

</body>
</html>