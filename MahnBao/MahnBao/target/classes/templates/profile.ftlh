<!DOCTYPE html>
<html>
<head>
    <title>Ресторан</title>
</head>
<body>
<div class="container">
    <h1 class="bg_color">Ресторан</h1>
    <h4>Личный кабинет</h4>
    <hr class="no_hr">
    <br>
    <div>
        <h2 class="big_block">${user.name}</h2>
        <br>
        Электронная почта: <b>${user.email}</b>
        <br>
        Номер телефона: <b>${user.phoneNumber}</b>
        <br>
        <br>
        <#if user.isAdmin()>
            <a class="big_block" href="/admin">
                Панель администратора
            </a><br>
        </#if>
        <a class="big_block" href="/my/reservations/${user.id}">
            Мои записи
        </a>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn_registration" type="submit">
                Выйти из аккаунта
            </button>
        </form>
    </div>
</div>
</body>
</html>