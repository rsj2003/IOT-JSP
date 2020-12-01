<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>노승재</h3>
	<%
		for(int i = 1; i <= 10; i++) {
			out.println(i + "");
			out.println("<br>");
		}
		out.println("<br>");
		int a = 1;
		int b = 0;
		int r = 0;
		while(r <= 100) {
			r = b + a;
			b = a;
			a = r;
			out.println(r + "");
			out.println("<br>");
		}
	%>
	<br>
	<table border = "1">
	<%
	for(int i = 1; i <= 10; i++) {
		out.println("<tr><td>");
		out.println(i + "");
		out.println("</td></tr>");
	}
	%>
	</table>
	<br>
	<table border = "1">
	<%
	for(int i = 1; i <= 12; i++) {
		if(i % 3 == 1) out.println("<tr>");
		out.println("<td>");
		out.println(i + "");
		out.println("</td>");
		if(i % 3 == 0) out.println("</tr>");
	}
	%>
	</table>
</body>
</html>