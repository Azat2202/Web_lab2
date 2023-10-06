<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="beans.PointsArray" %>\

<!DOCTYPE HTML>
<html>
<head lang="ru-RU">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="author" content="Сиразетдинов Азат Ниязович">
    <meta name="description" content="Веб-программирование: Лабораторная работа №1.">

    <!-- Компилляция less -->
    <link rel="stylesheet/less" type="text/css" href="styles/styles.less" />
    <script src="https://cdn.jsdelivr.net/npm/less" ></script>

    <link rel="icon" type="image/jpg" href="images/itmo_vt.jpg">
    <title>Лабораторная работа №2 | Веб-программирование</title>
</head>
<body>
<header>
    <h1>Сиразетдинов Азат. P3216 Вариант 3856</h1>
</header>
<table>
    <tr>
        <td><label for="X-input" class="request-label">Введите X:</label></td>
        <td>
            <table id="X-input">
                <tr>
                    <td><label><input name="X-radio-group" type="checkbox" value="-3">-3</label></td>
                    <td><label><input name="X-radio-group" type="checkbox" value="-2">-2</label></td>
                    <td><label><input name="X-radio-group" type="checkbox" value="-1">-1</label></td>
                </tr>
                <tr>
                    <td><label><input name="X-radio-group" type="checkbox" value="0">0</label></td>
                    <td><label><input name="X-radio-group" type="checkbox" value="1">1</label></td>
                    <td><label><input name="X-radio-group" type="checkbox" value="2">2</label></td>
                </tr>
                <tr>
                    <td><label><input name="X-radio-group" type="checkbox" value="3">3</label></td>
                    <td><label><input name="X-radio-group" type="checkbox" value="4">4</label></td>
                    <td><label><input name="X-radio-group" type="checkbox" value="5">5</label></td>
                </tr>
            </table>
        </td>
        <td rowspan="4">
            <canvas id="graph" width="300" height="300"></canvas>
        </td>
    </tr>
    <tr>
        <td><label for="Y-input" class="request-label">Введите Y:</label></td>
        <td><input type="text" id="Y-input" maxlength="16"></td>
    </tr>
    <tr>
        <td><label for="R-input" class="request-label">Выберите R:</label></td>
        <td>
            <select name="R-input" id="R-input">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
        </td>
    </tr>
    <tr>
        <td colspan="2"><button id="clearButton"><label>Очистить</label></button>
            <button id="checkButton"><label>Проверить</label></button></td>
    </tr>
    <tfoot>
    <tr>
        <td colspan="5" id="outputContainer">
            <h4>
                <span class="outputStub notification">Нет результатов</span>
            </h4>
        </td>
    </tr>
    </tfoot>
</table>
</body>
</html>