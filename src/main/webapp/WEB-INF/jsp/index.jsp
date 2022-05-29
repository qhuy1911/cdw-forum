<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 19/5/2022
  Time: 12:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %> -->
<html>

<head>
    <title>Login</title>
    <link rel="stylesheet" href="/css/style.css">
</head>

<body>
<c:if test="${user.username == null}">
    <jsp:forward page="${pageContext.request.contextPath}/login"></jsp:forward>
</c:if>
<c:if test="${user.username != null}">
    <jsp:forward page="${pageContext.request.contextPath}/topics"></jsp:forward>
</c:if>



</body>

</html>