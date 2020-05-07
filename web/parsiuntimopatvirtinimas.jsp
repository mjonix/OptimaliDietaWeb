<%@page import="dietossudarymas.DietosSudarymas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dietos planas parsiųstas</title>
    </head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <body id="main">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <form action="http://localhost:8080/OptimaliDietaWeb/index.jsp">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Automatinis asmeninio dietos plano sudarymas</button>
            </form>
            <form action="http://localhost:8080/OptimaliDietaWeb/duomenubaze.jsp">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Maisto produktų duomenų bazė</button>
            </form>
        </nav>
        <div class="container">
            <div class="jumbotron">
                <h1>Dietos planas parsiųstas sėkmingai! Jį rasite savo parsiųstų failų kataloge.</h1>
            </div>
        </div>
    </body>
    <style type="text/css">
        .jumbotron {
            background-image: url("images/dieta.jpg");
            color: white;
        }
        #main {
            background-image: url("images/dieta.jpg");
            color: white;
        }
    </style>
    <%
        request.setCharacterEncoding("UTF-8");
        DietosSudarymas.parsiustiFaila(request.getParameter("rezultatas"));
    %>
</html>