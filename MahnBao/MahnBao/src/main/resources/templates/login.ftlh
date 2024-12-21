<!DOCTYPE html>
<html>
<head>
    <title>Ресторан</title>
    <link rel="stylesheet" href="/static/css/login.css">
</head>
<body>
<div class="container">
    <h1 class="bg_color">Ресторан</h1>
    <h4>Авторизация</h4>
    <form action="/login" method="post">
        Эл. почта: <input class="" type="email" name="username"><br><br>
        Пароль: <input class="" type="password" name="password"><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input class="input__enter " type="submit" value="Вход"/>
    </form>
    <a class="btn_registration" href="/registration">Зарегистрироваться</a>
</div>
</body>
</html>