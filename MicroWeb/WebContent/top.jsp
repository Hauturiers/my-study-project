<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<img src="img/banner.jpg" width="1000" height="300" alt="校园图片"/>
<table width="95%">
			<tr bgcolor="red" height="55" width="100%">
				<td colspan="4"><font color="blue" size="40" align="center">
						<c:choose>
							<c:when test="${sessionScope.user==null}">
								<c:redirect url="Login.jsp" />
							</c:when>
							<c:otherwise>
								<c:out value="${user.userName }" default="no man" />
                                                               欢迎您，管理系统
				  </c:otherwise>
						</c:choose>

				</font></td>
			</tr>
			<tr bgcolor="yellow">
				<td><a href="ShenHe1.action">审核一对一助力儿童</a></td>
				<td><a href="ShenHe2.action">审核为捐赠</a></td>
				<td><a href="ShenHe3.action">审核见证</a></td>
				<td>退出系统</td>
			</tr>
		</table>
</center>

</body>
</html>