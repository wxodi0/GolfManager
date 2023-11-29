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
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");

	String sql = "insert into TBL_CLASS_202201 values(?,?,?,?,?)";

	PreparedStatement pstmt = con.prepareStatement(sql);

	String REGIST_MONTH = request.getParameter("REGIST_MONTH");
	String C_NO = request.getParameter("C_NO");
	String CLASS_AREA = request.getParameter("CLASS_AREA");
	String TEACHER_CODE = request.getParameter("Class_name").substring(0,3);
	int TUITION = Integer.parseInt(request.getParameter("TUITION"));

	pstmt.setString(1, REGIST_MONTH);
	pstmt.setString(2, C_NO);
	pstmt.setString(3, CLASS_AREA);
	pstmt.setInt(4, TUITION);
	pstmt.setString(5, TEACHER_CODE);

	pstmt.executeUpdate();

	pstmt.close();
	con.close();
	
	%>
	<script type="text/javascript">
		alert("수강신청이 정상적으로 완료되었습니다.");
		location.href = "index.jsp";
	</script>
	<%
	
} catch (Exception e) {
	out.println(e);
}
%>
</body>
</html>