<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<h3>INSERT_SALES</h3>
<% 
request.setCharacterEncoding("UTF-8");

try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_7", "1234");

	Statement stmt = conn.createStatement();
%>
<script>
function submit_form() {
	let form = document.input_form;
	if(form.sale_code.value === "") {
		alert("판매 코드를 입력해야 합니다. ")
		form.sale_code.focus();
		return false;
	};
	if(form.sale_date.value === "") {
		alert("판매 일자를 입력해야 합니다. ")
		form.sale_date.focus();
		return false;
	};
	if(form.sale_amount.value === "") {
		alert("판매 개수를 입력해야 합니다. ")
		form.sale_amount.focus();
		return false;
	};
	alert("정상적으로 처리되었습니다.");
	form.submit();
}
function reset_form() {
	document.input_form.reset();
}
</script>

<form action="action/insert_salelist.jsp" method="post" name="input_form">
	<table border="1">
		<tr>
			<td>판매 코드</td>
			<td><input type="text" name="sale_code"/></td>
		</tr>
		<tr>
			<td>매장</td>
			<td>
				<select name="scode">
					<%
						Statement stmt_shop = conn.createStatement();
						ResultSet rs_shop = stmt.executeQuery("SELECT SCODE, SNAME FROM TBL_SHOP_01");
						while (rs_shop.next()) { %>
							<option value="<%= rs_shop.getString(1) %>">["<%= rs_shop.getString(1) %>] <%= rs_shop.getString(2) %></option>	
					<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>판매 일자</td>
			<td><input type="date" name="sale_date"/></td>
		</tr>
		<tr>
			<td>피자</td>
			<td>
				<select name="pcode">
					<%
						Statement stmt_pizza = conn.createStatement();
						ResultSet rs_pizza = stmt.executeQuery("SELECT PCODE, PNAME FROM TBL_PIZZA_01");
						while (rs_pizza.next()) { %>
							<option value="<%= rs_pizza.getString(1) %>">[<%= rs_pizza.getString(1) %>] <%= rs_pizza.getString(2) %></option>	
					<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>판매 개수</td>
			<td><input type="number" name="sale_amount"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="등록하기" onclick="submit_form()"/>
				<input type="button" value="다시쓰기" onclick="reset_form()"/>
			</td>
		</tr>
	</table>
</form>

<%	
	
	stmt.close();
	conn.close();
}
catch (Exception e) {
	e.printStackTrace();
}


%>