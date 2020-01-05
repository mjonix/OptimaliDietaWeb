<%@page import="java.util.ArrayList"%>
<%@page import="dietossudarymas.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Maisto produktų duomenų bazė</title>
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
            <div class="page-header">
                <h1>Maisto produktų duomenų bazė</h1>
            </div>
            <div class="jumbotron">
                <form id="paieska">                
                    <input  placeholder="Ieškoti pagal pavadinimą" size="33">
                </form>
                <table>
                    <tr>
                        <td><input value="Produkto pavadinimas" disabled="true" size="23" style="background: black; color: yellow"></td>
                        <td><input value="Kcal (100g)" disabled="true" size="9" style="background: black; color: yellow"></td>
                        <td><input value="Baltymai (%)" disabled="true" size="10" style="background: black; color: yellow"></td>
                        <td><input value="Angliavandeniai (%)" disabled="true" size="15" style="background: black; color: yellow"></td>
                        <td><input value="Riebalai (%)" disabled="true" size="9" style="background: black; color: yellow"></td>
                        <td><input value="Cholesterolis (%)" disabled="true" size="13" style="background: black; color: yellow"></td>
                        <td><input value="Kalcis (%)" disabled="true" size="8" style="background: black; color: yellow"></td>
                        <td><input value="Skaidulinės m. (%)" disabled="true" size="14" style="background: black; color: yellow"></td>
                    </tr>
                </table>
                <div id="lentele">
                    <table>
                        <%  DietosSudarymas ds = new DietosSudarymas();
                            ArrayList<MaistoProduktas> produktai = ds.gautiProduktus(new ArrayList<String>(), new ArrayList<String>());
                            for (int i = 0; i < produktai.size(); i++) {%>
                        <tr>
                            <td><input value="<%=produktai.get(i).pavadinimas%>" disabled="true" size="23" style="background: yellow"></td>
                            <td><input value="<%=produktai.get(i).kilokalorijos%>" disabled="true" size="9" style="background: yellow"></td>
                            <td><input value="<%=ds.suapvalinti((double) produktai.get(i).baltymai)%>" disabled="true" size="10" style="background: yellow"></td>
                            <td><input value="<%=ds.suapvalinti((double) produktai.get(i).angliavandeniai)%>" disabled="true" size="15" style="background: yellow"></td>
                            <td><input value="<%=ds.suapvalinti((double) produktai.get(i).riebalai)%>" disabled="true" size="9" style="background: yellow"></td>
                            <td><input value="<%=ds.suapvalinti((double) produktai.get(i).cholesterolis)%>" disabled="true" size="13" style="background: yellow"></td>
                            <td><input value="<%=ds.suapvalinti((double) produktai.get(i).kalcis)%>" disabled="true" size="8" style="background: yellow"></td>
                            <td><input value="<%=ds.suapvalinti((double) produktai.get(i).skaidulines)%>" disabled="true" size="14" style="background: yellow"></td>
                        </tr>
                        <%}%>
                    </table>
                </div>
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

    <script>
        const paieskosLaukas = document.forms['paieska'].querySelector('input');
        const lentele = document.querySelector('#lentele table');
        paieskosLaukas.addEventListener('keyup', function (e) {
            const paieskosTekstas = e.target.value.toLowerCase();
            const eiles = lentele.getElementsByTagName('tr');
            Array.from(eiles).forEach(function (eile) {
                var elementai = eile.getElementsByTagName('input');
                var i = 0;
                Array.from(elementai).forEach(function (elementas) {
                    if (i % 8 === 0) {
                        var rezultatas = elementas.value;
                        if (rezultatas.toLowerCase().indexOf(paieskosTekstas) != -1) {
                            eile.style.display = 'block';
                        } else {
                            eile.style.display = 'none';
                        }
                    }
                    i++;
                });
            });
        });
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</html>