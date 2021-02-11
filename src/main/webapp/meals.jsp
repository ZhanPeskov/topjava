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
    <tr style="background-color: lightgrey">
        <th>No</th>
        <th>ID</th>
        <th>Date & Time</th>
        <th>Description</th>
        <th>Calories</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${mealsTo}" var="meal" varStatus="loopStatus">
        <c:set var="rowColor" value="color:${meal.excess ? 'red' : 'green'}"/>
        <c:set var="rowBackgroundColor" value=";background-color:#F${meal.excess ? 'AF0' : '0FA'}F0"/>
        <tr style="${rowColor}${loopStatus.index % 2 == 0 ? '' : rowBackgroundColor}">
            <td width="30px" align="right">${loopStatus.index + 1}</td>
            <td width="35px" align="right">${meal.id}</td>
            <td width="130px" align="center">
                <fmt:parseDate value="${meal.dateTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
                <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${parsedDateTime}"/>
            </td>
            <td width="210px" align="center">${meal.description}</td>
            <td width="80px" align="right">${meal.calories}</td>
            <c:forTokens items="Update;Delete" delims=";" var="action">
                <td width="80px" align="center">
                    <form method="post" action="${pageContext.request.contextPath}/${action}?id=${meal.id}">
                        <input type="submit" style="${rowColor}" value="${action}"/>
                    </form>
                </td>
            </c:forTokens>
        </tr>
    </c:forEach>
</table>
<br>
<br>

</body>
</html>