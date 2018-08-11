<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*" import="com.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<jsp:include page="top.jsp" />
		
			<table border="1" background="blue">
				<tr>
					<td>ID</td>
					<td>标题</td>
					<td>描述</td>
					<td>开始时间</td>
					<td>结束时间</td>
					<td>物品分类</td>
					<td>回报金额</td>
					<td>审核状态</td>
				</tr>
				<c:forEach items="${donations}" var="donations">
				<form action="Donation.action?donation_id=${donations.donation_id }" method="post">
					<tr>
						<td><input type="text" name="donation_id"
							value="${donations.donation_id}" maxlength="20"
							disabled="disabled" /></td>
						<td>${donations.donation_title}</td>
						<td>${donations.donation_describe}</td>
						<td>${donations.donation_open_date}</td>
						<td>${donations.donation_close_date}</td>
						<td>${donations.donation_raise_goods}</td>
						<td>${donations.donation_trans_cost}</td>
						<td><input type="text" name="donation_verify_state"
							maxlength="20" value="1" /></td>
						<td><input type="submit" name="tijiao" maxlength="20"
							value="提交" /></td>
					</tr>
		</form>

				</c:forEach>

			</table>


	</center>

</body>
</html>