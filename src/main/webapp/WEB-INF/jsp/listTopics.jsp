<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 29/5/2022
  Time: 12:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Topics</title>
</head>
<body>
<div>
    Chào ${user.username} | <a href="${pageContext.request.contextPath}/logout">Thoát</a>
    <h2>Diễn đàn: Chuyện học phí và các chính sách hỗ trợ học tập</h2>
</div>

<button onclick=location.replace("${pageContext.request.contextPath}/addTopic")>Gửi bài mới</button>

<table border="1">
    <tr>
        <th>
            Chủ đề
        </th>
        <th>
            Hồi âm
        </th>
    </tr>
    <c:forEach var="topic" items="${data.topics}">
        <tr>
            <td>
                <a href="/topics/${topic.id}">${topic.title }</a>
                <br>
                Bài mới nhất by
                <c:if test="${topic.messages.size() > 0 }">
                    <c:set var="size" value="${topic.messages.size() }"></c:set>
                    <a href="#">${topic.messages[size-1].creator.username}</a>,
                    <fmt:formatDate value="${topic.messages[size-1].createdTime.time}" pattern="MM-dd-yyyy hh:mm a"/>
                </c:if>
                <c:if test="${topic.messages.size() == 0 }">
                    <a href="#">${topic.creator.username}</a>,
                    <fmt:formatDate value="${topic.createdTime.time}" pattern="MM-dd-yyyy hh:mm a"/>
                </c:if>
            </td>
            <td align="center">${topic.messages.size() }</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
