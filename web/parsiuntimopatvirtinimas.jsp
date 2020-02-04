<%@page import="dietossudarymas.DietosSudarymas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dietos planas parsiųstas</title>
    </head>
    <body>
        <h1>Dietos planas parsiųstas sėkmingai! Jį rasite savo parsiųstų failų kataloge.</h1>
    </body>
    <%
        request.setCharacterEncoding("UTF-8");
        DietosSudarymas.parsiustiFaila(request.getParameter("rezultatas"));
    %>
</html>