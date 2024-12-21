<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ресторан</title>
</head>
<body>
<div class="container">
    <h1 class="bg_color">Ресторан</h1>
    <h3>Подробная информация о брони</h3>
    <b>Тема: </b>${reservation.subject}<br>
    <b>Статус: </b>${reservation.state}<br>
    <b>Описание: </b>${reservation.description}<br>
    <b>ID гостя: </b>${reservation.guest.id}<br>
    <b>Приоритет: </b>${reservation.priority}<br>
    <b>Номер стола: </b>${reservation.tableId}<br>
    <b>Дата: </b>${reservation.date}<br>
</div>
</body>
</html>