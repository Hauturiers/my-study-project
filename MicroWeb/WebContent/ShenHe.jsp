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
					<td>待筹金额</td>
					<td>分期期数</td>
					<td>开始时间</td>
					<td>是否精选</td>
					<td>审核状态</td>
				</tr>
				<c:forEach items="${mircoLoves}" var="mircoLoves">
				<form action="MicroPower.action?mircolove_id=${mircoLoves.mircolove_id }" method="post">
					<tr>
						<td><input type="text" name="mircolove_id"
							value="${mircoLoves.mircolove_id}" maxlength="20"
							disabled="disabled" /></td>
						<td>${mircoLoves.mircolove_list_title}</td>
						<td>${mircoLoves.mircolove_list_describe}</td>
						<td>${mircoLoves.mircolove_target_amount}</td>
						<td>${mircoLoves.mircolove_divid_num}</td>
						<td>${mircoLoves.mircolove_open_date}</td>
						<td><input type="text" name="mircolove_list_select"
							maxlength="20" value="0" /></td>
						<td><input type="text" name="mircolove_verify_state"
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