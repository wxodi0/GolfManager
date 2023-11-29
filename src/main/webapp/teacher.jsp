<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<%
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		Statement stmt = con.createStatement();
		
		String sql = "SELECT * FROM TBL_TEACHER_202201";
		
		ResultSet rs = stmt.executeQuery(sql);		
%>
	<h3>강사조회</h3>
	<table>
		<tr>
			<td>강사코드</td>
			<td>강사명</td>
			<td>강의명</td>
			<td>수강료</td>
			<td>강사자격취득일</td>
		</tr>
		<%
		DecimalFormat df = new DecimalFormat("###,###");
		while(rs.next()) {
			String date = rs.getString(5);
			
			String Ydate = date.substring(0,4);
			String Mdate = date.substring(4,6);
			String Ddate = date.substring(6,8);
			
			int money = rs.getInt(4) ;
			
			
		%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td>₩<%=df.format(money) %></td>
				<td><%=Ydate %>년<%=Mdate %>월<%=Ddate %>일</td>
			</tr>
		<%}
		
		rs.close();
		stmt.close();
		con.close();
		%>
	</table>
	<%
		}catch(Exception e) {
			System.out.println(e);
		}
	%>
<%@include file="footer.jsp" %>
</body>
</html>