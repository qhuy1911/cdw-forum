<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 29/5/2022
  Time: 10:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    Chào ${user.username} | <a href="${pageContext.request.contextPath}/logout">Thoát</a>
</div>
<h2>Chủ đề: ${topic.title }</h2>
<p>
    Bài mới nhất gửi <fmt:formatDate value="${newest.createdTime.time}" pattern="MM-dd-yyyy hh:mm a"/>,
    do <b>${newest.creator.username }</b>, ${topic.messages.size() } hồi âm
</p>
<table style="width: 50%" border="1">
    <tr>
        <td colspan="2"><fmt:formatDate value="${topic.createdTime.time}" pattern="MM-dd-yyyy hh:mm a"/></td>
    </tr>
    <tr>
        <td align="center" width="160">
            ${topic.creator.username }<br>
            Tham gia
            <fmt:formatDate value="${topic.creator.joinDate}" pattern="MM-dd-yyyy"/>
        </td>
        <td>
            <div><b>${topic.title }</b>
                <a href="${pageContext.request.contextPath}/topics/${topic.id}/reply">Trả lời</a></div>
            ${topic.content }
        </td>
    </tr>
</table>
<br>
<c:if test="${topic.messages.size() != 0}">
    <c:forEach var="message" items="${topic.messages }">
        <table style="width: 50%" border="1">
            <tr>
                <td colspan="2"><fmt:formatDate value="${message.createdTime.time}" pattern="MM-dd-yyyy hh:mm a"/></td>
            </tr>
            <tr>
                <td align="center" width="160">
                    <div>
                            ${message.creator.username }
                    </div>
                    Tham gia
                    <fmt:formatDate value="${message.creator.joinDate}" pattern="MM-dd-yyyy"/>
                </td>
                <td>
                    <div>
                        <b>${message.title }</b>
                        <a href="${pageContext.request.contextPath}/topics/${topic.id}/reply">Trả lời</a></div>
                        ${message.content }
                </td>
            </tr>
        </table>
    </c:forEach>
</c:if>
<br>
<a href="/topics">Danh sách chủ đề</a>
</body>
</html>
