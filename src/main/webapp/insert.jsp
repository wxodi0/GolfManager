<%@page import="java.sql.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
</head>
<body onload="form.REGIST_MONTH.focus();">
<%@include file="header.jsp" %>
	<h3>수강신청</h3>
	<form name="insertF" action="insertOk.jsp" method="post">
		<table>
			<tr>
				<td>수강월</td>
				<td><input type="text" name="REGIST_MONTH">2022년03월 예)202203</td>
			</tr>
			<tr>
				<td>회원명</td>
				<td>
					<select name="C_Name" onchange="changValue()">
						<option value="">회원명</option>
						<option value=10001>홍길동</option>
						<option value=10002>장발장</option>
						<option value=10003>임꺽정</option>
						<option value=20001>성춘향</option>
						<option value=20002>이몽룡</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>회원번호</td>
				<td><input type="text" name="C_NO"></td>
			</tr>
			<tr>
				<td>강의장소</td>
				<td>
					<select name="CLASS_AREA">
						<option value="">강의장소</option>
						<option value="서월본원">서월본원</option>
						<option value="성남분원">성남분원</option>
						<option value="대전분원">대전분원</option>
						<option value="부산분원">부산분원</option>
						<option value="대구분워">대구분워</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>강의명</td>
				<td>
					<select name="Class_name" onchange="changValue()">
						<option value="" >강의신청</option>
						<option value=100000>초급반</option>
						<option value=200000>중급반</option>
						<option value=300000>고급반</option>
						<option value=400000>심화반</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>수강료</td>
				<td><input type="text" name="TUITION"></td>
			</tr>
			<tr>
				<td>
					<input type="button" onClick="insertOn()" value="수강신청">
				</td>
				<td>
					<input type="button" onClick="reInsert()" value="다시쓰기">
				</td>
			</tr>
		</table>
	</form>
<%@include file="footer.jsp" %>
</body>
<script type="text/javascript" src="./insert.js"></script>
</html>