<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>

    <body>
        <form action="loginIndex.htm" method="get">
            ${login_error}
            <br>
            <label>Username :</label>
            <input type="text" name="txtUser" />
            <br>
            <label>Password :</label>
            <input type="password" name="txtPass" />
            <br>
            <input type="submit"/>
        </form>
    </body>
</html>
