<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="beans.Point"%>
<%@ page import="beans.PointsArray" %>

<!DOCTYPE HTML>
<html lang="ru-RU">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="author" content="Сиразетдинов Азат Ниязович">
    <meta name="description" content="Веб-программирование: Лабораторная работа №1.">

    <!-- Библиотека компиляции less -->
    <link rel="stylesheet/less" type="text/css" href="styles/styles.less" />
    <script src="https://cdn.jsdelivr.net/npm/less" ></script>

    <!-- Библиотека SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <!-- Библиотека jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script src="scripts/CanvasPrinter.js"></script>
    <script src="scripts/Validator.js"></script>
    <script src="scripts/onetime.js"></script>
    <script src="scripts/updater.js"></script>

    <jsp:useBean id="points"
                 class="beans.PointsArray" scope="session"/>

    <link rel="icon" type="image/jpg" href="images/itmo_vt.jpg">
    <title>Лабораторная работа №2 | Веб-программирование</title>
</head>
<body>
<header>
    <h1>Сиразетдинов Азат. P3216 Вариант 3856</h1>
</header>
    <div id="main-container">
        <div id="form-container">
            <form novalidate onsubmit="sendPoint()">
                <div class="input-container" id="X-input-container">
                    <label for="X-input-container" class="form-label">Введите X:</label>
                    <input name="X-button-group" class="X-button" type="button" value="-5">
                    <input name="X-button-group" class="X-button" type="button" value="-4">
                    <input name="X-button-group" class="X-button" type="button" value="-3">
                    <input name="X-button-group" class="X-button" type="button" value="-2">
                    <input name="X-button-group" class="X-button" type="button" value="-1">
                    <input name="X-button-group" class="X-button" type="button" value="0">
                    <input name="X-button-group" class="X-button" type="button" value="1">
                    <input name="X-button-group" class="X-button" type="button" value="2">
                    <input name="X-button-group" class="X-button" type="button" value="3">
                </div>
                <div class="input-container" id="Y-input-container">
                    <label for="Y-input" class="form-label">Введите Y:</label>
                    <input id="Y-input" name="Y-input" type="text" value="0" maxlength="16">
                </div>
                <div class="input-container" id="R-input-container">
                    <label for="R-input-container" class="form-label" id="R-input-label">Введите R:</label>
                    <input type="radio" name="R-radio-group" id="Y-input-1" value="1"><label class="Y-radio-labels" for="Y-input-1">1</label>
                    <input type="radio" name="R-radio-group" id="Y-input-2" value="2"><label class="Y-radio-labels" for="Y-input-2">2</label>
                    <input type="radio" name="R-radio-group" id="Y-input-3" value="3"><label class="Y-radio-labels" for="Y-input-3">3</label>
                    <input type="radio" name="R-radio-group" id="Y-input-4" value="4"><label class="Y-radio-labels" for="Y-input-4">4</label>
                    <input type="radio" name="R-radio-group" id="Y-input-5" value="5"><label class="Y-radio-labels" for="Y-input-5">5</label>
                </div>
                <div class="input-container" id="buttons-container">
                    <input id="clear" class="form-label main-button" name="clear" type="button" value="Очистить">
                    <input id='check' class="main-button" name='check' type='submit' value='Проверить'>
                </div>
            </form>
        </div>
            <div id="graph-container">
                <canvas id="graph" width="300" height="300"></canvas>
            </div>
        <div id="result-container">
            <table id="results">
                <tr>
                    <th>X</th>
                    <th>Y</th>
                    <th>R</th>
                    <th>Текущее время</th>
                    <th>Время работы программы (мкс)</th>
                    <th>Результат</th>
                </tr>
                <c:forEach items="${points.points}" var="point">
                    <tr>
                        <td>${point.x.toString()}</td>
                        <td>${point.y.toString()}</td>
                        <td>${point.r.toString()}</td>
                        <td>${point.time.toString()}</td>
                        <td>${point.scriptTime.toString()}</td>
                        <td>${point.status.toString()}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>