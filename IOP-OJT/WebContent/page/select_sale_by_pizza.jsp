<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
</head>
<h3>SELECT</h3>
<body>
<table border="1">
<tr>
	<td>피자명</td>
	<td>매출액</td>
</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_7", "1234");
		Statement stmt = conn.createStatement();
		String query = "SELECT " +
				"	    PIZZA.PNAME, " +
				"	    SUM(PIZZA.COST * SALELIST.AMOUNT)  AS TOTAL_COST " +
				"	FROM " +
				"	    TBL_SALELIST_01   SALELIST, " +
				"	    TBL_PIZZA_01      PIZZA " +
				"	WHERE " +
				"	    SALELIST.PCODE = PIZZA.PCODE " +
				"	GROUP BY  " +
				"		PIZZA.PCODE, PIZZA.PNAME  " +
				"	ORDER BY " + 
				"		TOTAL_COST DESC";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			%>
				<tr>
					<td>
					<% out.println(rs.getString(1));%>
					</td>
					<td>
					<% out.println(rs.getInt(2));%>
					</td>
				</tr>
			<%
			
		}
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>
</body>
</html>
