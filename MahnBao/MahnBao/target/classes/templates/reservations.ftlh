<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ресторан</title>
    <link rel="stylesheet" href="reservations.css">
</head>
<body>
<div class="container">
    <h1 class="bg_color">Restaurant</h1>
    <hr class="big_block">
    <#if user.email??>
        <h3>Имя пользователя: <i>${user.name}</i></h3>
        <#if user.isGuest()>
            <h2><i>Гость</i></h2>
            <#elseif user.isAdmin()>
                <h2><i>Администратор</i></h2>
            <#else>
            <h2><i>Менеджер</i></h2>
        </#if>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input class="input_exit" type="submit" value="Выйти"/><br>
        </form>
        <div class="form_wrapper">
            <form action="/profile" method="get">
                <input class="input_exit" type="submit" value="Личный кабинет"/>
            </form>
            <#if user.isAdmin()>
                <form action="/admin" method="get">
                    <input class="input_exit" type="submit" value="Управление"/>
                </form>
            </#if>
            <hr class="big_block">
            <#if user.isGuest()>
                <h3>Мои брони</h3>
                <#else>
                    <h3>Все брони</h3>
            </#if>
        <form action="/" method="get">
            Поиск по названию брони: <input type="text" name="subject"><br>
            <input type="submit" value="Поиск"/>
        </form>
        <#list reservations as reservation>
            <#if !user.isGuest()>
                <div>
                    <p><b>${reservation.subject}</b> ${reservation.date} | <a class="moreinfo" href="/reservation/${reservation.id}">Подробнее</a></p>
                </div>
                <#else>
                    <#if user.id == reservation.guest.id>
                        <div>
                            <p><b>${reservation.subject}</b> ${reservation.date} | <a class="moreinfo" href="/reservation/${reservation.id}">Подробнее</a></p>
                        </div>
                    </#if>
            </#if>
            <#if user.isAdmin()>
                <form action="/reservation/delete/${reservation.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input class="input_exit" type="submit" value="Удалить"/>
                </form>
            </#if>
            <#else>
                <h3>Броней нет</h3>
        </#list>
    </div>
        <hr>
        <h3 class="main_reservation">Создать новую бронь</h3>
        <form action="/reservation/create" method="post">
            <#if user.isGuest()>
                Дата брони: <input type="datetime-local" name="date" step="60"/><br><br>
                Тема: <input type="text" name="subject"/><br><br>
                Описание: <input type="text" name="description"/><br><br>
                <#else>
                    Дата брони: <input type="datetime-local" name="date" step="60"/><br><br>
                    Тема: <input type="text" name="subject"/><br><br>
                    Описание: <input type="text" name="description"/><br><br>
                    Приоритет:
                    <select name="priority">
                        <option value="Средний" selected>--Выбрать--</option>
                        <option value="Высокий">Высокий</option>
                        <option value="Средний">Средний</option>
                        <option value="Низкий">Низкий</option>
                    </select><br><br>
                    Статус:
                    <select name="state">
                        <option value="Новая" selected>Новый</option>
                        <option value="В работе">В работе</option>
                        <option value="Закрыта">Закрыт</option>
                    </select><br><br>
                    Стол: <input type="number" name="tableId"/><br><br>
                    Id гостя: <input type="number" name="guest"/><br><br>
            </#if>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input class="input_main_reservation" type="submit" value="Забронировать">
        </form>
        <#else>
            <form action="/login" method="post">
                <input class="input_exit" type="submit" value="Забронировать столик"/>
            </form>
    </#if>
</div>
</body>
</html>