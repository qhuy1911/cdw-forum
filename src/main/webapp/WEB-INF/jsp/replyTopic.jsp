<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 29/5/2022
  Time: 11:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reply Topic</title>
</head>
<body>
    <%--@elvariable id="message" type="com.example.forum.entity.Message"--%>
    <form:form action="${pageContext.request.contextPath}/topics/${topic.id}/reply" method="post" modelAttribute="message">
        <div>
            <form:label path="title">Title:</form:label>
            <form:input type="text" path="title"/>
        </div>
        <div>
            <form:label path="content">Content:</form:label>
            <form:textarea rows="5" path="content"/>
        </div>
        <input type="submit" value="Submit" name="submit">
        <input type="submit" value="Cancel" name="cancel">
    </form:form>
</body>
</html>
