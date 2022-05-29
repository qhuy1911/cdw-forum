<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/5/2022
  Time: 9:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/login-form.css">
</head>
<body>

<%--@elvariable id="user" type="com.example.forum.entity.User"--%>
<form:form cssClass="login-form" action="${pageContext.request.contextPath}/login" method="post" modelAttribute="user">
    <div class="login-form__title">
        <h3>Login</h3>
    </div>
    <p class="login-form__error">${message}</p>
    <div class="login-form__input">
        <form:label path="username">Username: </form:label>
        <form:input type="text" path="username"/>
    </div>
    <div class="login-form__input">
        <form:label path="password">Password: </form:label>
        <form:input type="password" path="password"/>
    </div>
    <div class="login-form__submit">
        <input type="submit" name="login" value="Login">
    </div>
</form:form>
</body>
</html>
