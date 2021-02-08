<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ru">
<head>
    <title>Meals</title>
</head>
<body>
<h3><a href="index.html">Home</a></h3>
<hr>
<h2>Meals</h2>
<br>
<table border="1px" cellspacing="0" cellpadding="3">
    <tr>
        <th>Дата и Время</th>
        <th>Описание</th>
        <th>Калории</th>
        <th>Изменить</th>
        <th>Удалить</th>
    </tr>
    <c:forEach var="meal" items="${mealsTo}">
        <c:url var="updateButton" value="update">
            <c:param name="dateTime" value="${meal.dateTime}"/>
        </c:url>
        <c:url var="deleteButton" value="delete">
            <c:param name="dateTime" value="${meal.dateTime}"/>
        </c:url>
        <c:set var="rowColor" value="${meal.excess ? 'red' : 'green'}"/>
        <tr style="color:${rowColor}">
            <td width="130px" align="center">
                <fmt:parseDate value="${meal.dateTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
                <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${parsedDateTime}"/>
            </td>
            <td width="210px" align="center">${meal.description}</td>
            <td width="80px" align="right">${meal.calories}</td>
            <td width="80px" align="center"><input type="button" value="Изменить" onclick="window.location.href='${updateButton}'"/></td>
            <td width="80px" align="center"><input type="button" value="Удалить" onclick="window.location.href='${deleteButton}'"/></td>
        </tr>
    </c:forEach>
</table>
<br>
<br>

</body>
</html>