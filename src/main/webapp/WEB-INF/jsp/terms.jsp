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
    <title>Terms Page</title>
</head>
<body>
<span>
        <h1>Система управления студентами и их успеваемостью</h1>
        <a class="Logout" href="">Logout</a>
    </span>
<header>
    <nav>
        <a href="/">На главную</a>
    </nav>
</header>

<div class="Select1">
    <label>
        Выбрать семестр
        <select class="select1">
            <c:forEach items="${terms}" var="t"> <%--Цикл для заполнения таблицы--%>
            <option>${t.name}</option>
            </c:forEach>
        </select>
    </label>
    <button class="button1">Выбрать</button>
    <br>
    <p>Длительность семестра: 24 недели</p>
</div>

<div class="tableButton1">
    <div class="Table4">
        <table class="table4" border="1">
            <caption>Список дисциплин семестра</caption>
            <tr>
                <th>Наименование дисциплины</th>
            </tr>
            <tr>
                <form>
                    <label>
                        <td></td>
                    </label>
                </form>
            </tr>
        </table>

    </div>
    <div class="button5">
        <div class="button51"><a class="button511" href="termCreating.html">
            <button class="button5111">Создать семестр...</button>
        </a></div>
        <div class="button52"><a class="button522" href="termModifying.html">
            <button class="button5222">Модифицировать текущий семестр...</button>
        </a></div>
        <div class="button53"><a class="button533" href="">
            <button class="button5333">Удалить текущий семестр...</button>
        </a></div>
    </div>
</div>
</body>
</html>