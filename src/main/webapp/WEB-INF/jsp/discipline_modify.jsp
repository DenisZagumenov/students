<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/style.css">
    <title>Discipline Modify Page</title>
</head>
<body>
<span class="header">
    <h1>Система управления студентами и их успеваемостью</h1>
        <div class="Login">
            <c:choose>
                <c:when test="${isAuthorised eq true}">
                    <p class="Hello">Привет, ${login}</p>
                    <a class="Logout" href="/logout">Logout</a>
                </c:when>
                <c:otherwise>
                    <a class="Logout" href="/login">Login</a>
                </c:otherwise>
            </c:choose>
        </div>
</span>
<div class="navP">
    <nav>
        <a href="/">На главную</a>
        <a href="/disciplines">Назад</a>
    </nav>
    <p class="p1">Для того чтобы модифицировать дисциплину введите новое значение поля и нажмите кнопку "Применить":</p>
</div>
<div class="ST">
    <div class="ST1">
        <form action="/discipline_modify" method="post">
            <input type="hidden" name="id" value="${discipline.id}">
            <div class="input11"><label class="label1">Название<input class="input111" type="text" name="discipline" value="${discipline.name}"></label></div>
            <div class="button4"><button>Применить</button></div>
        </form>
    </div>
</div>
<c:if test="${error eq 1}">
    <h4 class="p4">Поля не должны быть пустыми</h4>
</c:if>
</body>
</html>
