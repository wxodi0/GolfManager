<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
</head>
<body>
<%@include file="header.jsp" %>
<%
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		
		Statement stmt = con.createStatement();
		
		String sql = "SELECT c.REGIST_MONTH, c.C_NO, m.C_NAME, t.CLASS_NAME, c.CLASS_AREA, c.TUITION, m.GRADE " + 
					"FROM TBL_CLASS_202201 c "+
					"JOIN TBL_TEACHER_202201 t ON c.TEACHER_CODE=t.TEACHER_CODE "+
					"JOIN TBL_MEMBER_202201 m ON c.C_NO=m.C_NO ";
		
		ResultSet rs = stmt.executeQuery(sql);
		
%>
	<h3>회원정보조회</h3>
	<table>
		<tr>
			<td>수강월</td>
			<td>회원번호</td>
			<td>회원명</td>
			<td>강의명</td>
			<td>강의장소</td>
			<td>수강료</td>
			<td>등급</td>
		</tr>
		<%
		DecimalFormat df = new DecimalFormat("###,###");
		while(rs.next()) {
			String date = rs.getString(1);
			String Ydate, Mdate, Ddate;
			
			Ydate = date.substring(0,4);
			Mdate = date.substring(4,6);
			
			int number = rs.getInt(6);
			
		%>
			<tr>
				<td><%=Ydate%>년<%=Mdate%>월</td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5) %></td>
				<td>₩<%=df.format(number) %></td>
				<td><%=rs.getString(7) %></td>
			</tr>
		<%}%>
	</table>
	<%
	rs.close();
	stmt.close();
	con.close();
	} catch (Exception e) {
		out.println(e);
	}
	%>
	<%@include file="footer.jsp" %>
</body>
</html>