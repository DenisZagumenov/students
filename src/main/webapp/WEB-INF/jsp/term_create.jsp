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
    <script src="../../resources/js/function.js" ></script>
    <title>Term create</title>
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
        <a href="/terms">Назад</a>
    </nav>
    <p class="p1">Для создания семестра заполните следующие данные и нажмите кнопку "Создать".</p>
</div>

    <div class="ST">
        <div class="input22">

                <label class="label1">Длительность (в неделях)
                    <input class="input222" type="text" id="durationDiscipline">
                </label>

        </div>
        <div>
            <div class="label22">
                <label class="label2">
                    <p class="p3">Дисциплины в семестре</p>
                    <select class="select2" size="8" multiple id="selectedDisciplines">
                        <c:forEach items="${disciplines}" var="d">
                            <option value="${d.id}">${d.name}</option>
                        </c:forEach>
                    </select>
                </label>
            </div>
        </div>

        <div class="button6"><button onclick="createTerm()" class="button66">Создать</button></div>
    </div>

<form action="/term_create" method="post" id="disciplinesForTerm">
    <input type="hidden" name="idsSelectedDisciplines" id="idsSelectedDisciplines">
    <input type="hidden" name="duration" id="duration">
</form>
</body>
</html>
