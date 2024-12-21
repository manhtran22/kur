<!DOCTYPE html>
<html>
<head>
    <title>Ресторан</title>
    <link rel="stylesheet" href="/static/css/my-reservations.css">
</head>
<body>
<div class="container">
    <h1 class="bg_color">Ресторан</h1>
    <hr>
    <h4 class="big_block">Брони пользователя ${user.name}</h4>
    <hr class="no_hr">
    <div>
        <#list reservations as reservation>
            <a href="/reservation/${reservation.id}">
                <div>
                    <div>
                        <form action="/reservation/delete/${reservation.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        </form>
                    </div>
                    <div>
                        <p>Тема: ${reservation.subject}</p>
                        <h3>Дата: ${reservation.date}</h3>
                    </div>
                    <form action="/reservation/delete/${reservation.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input class="ui-button" type="submit" value="Удалить"/>
                    </form>
                </div>
            </a>
        <#else>

            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
    <hr class="big_block">
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
</div>
</div>
</body>
</html>