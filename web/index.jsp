<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Optimali dieta</title>
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
                <h1>Automatinis asmeninio dietos plano sudarymas</h1>
            </div>
            <div class="jumbotron">
                <p>
                <form action="http://localhost:8080/OptimaliDietaWeb/dietosplanas.jsp" id="asmeniniaiParametrai">  <br>


                    Lytis: <input type="radio" name="lytis" value="1"/>Vyras
                    <input type="radio" name="lytis" value="2"/>Moteris<br><br>

                    Amžius: <input type="text" name ="amzius">m<br><br>
                    Ūgis: <input type="text" name ="ugis">cm<br><br>

                    Svoris: <input type="text" name ="svoris" >kg<br><br>

                    Aktyvumo lygis: <input type="radio" name="lygis" value="1"/>Žemas
                    <input type="radio" name="lygis" value="2"/>Vidutinis
                    <input type="radio" name="lygis" value="3"/>Aukštas
                    <br><br>

                    Tikslas: <input type="radio" name="tikslas" value="1"/>Numesti svorio
                    <input type="radio" name="tikslas" value="2"/>Palaikyti esamą svorį
                    <input type="radio" name="tikslas" value="3"/>Priaugti svorio
                    <br><br>

                    Nepageidaujamų produktų kategorijos: <br><input type="checkbox" name="kategorija" value="mesa"/>Mėsa
                    <input type="checkbox" name="kategorija" value="sokoladas"/>Šokoladas
                    <input type="checkbox" name="kategorija" value="riesutai"/>Riešutai
                    <input type="checkbox" name="kategorija" value="zuvis"/>Žuvis
                    <input type="checkbox" name="kategorija" value="pienas"/>Pieno produktai
                    <input type="checkbox" name="kategorija" value="medus"/>Medus
                    <input type="checkbox" name="kategorija" value="kiausiniai"/>Kiaušiniai
                    <input type="checkbox" name="kategorija" value="miltai"/>Miltai
                    <input type="checkbox" name="kategorija" value="kruopos"/>Kruopos
                    <input type="checkbox" name="kategorija" value="uogos"/>Uogos
                    <input type="checkbox" name="kategorija" value="grybai"/>Grybai
                    <br><br>

                    Kiek kartų per dieną planuojate valgyti: <input type="radio" name="kartai" value="3"/>3
                    <input type="radio" name="kartai" value="5"/>5
                    <br><br>

                    Laikotarpis, kuriam dietą norėtumėte sudaryti: <input type="radio" name="laikotarpis" value="1"/>1 dienai
                    <input type="radio" name="laikotarpis" value="3"/>3 dienoms
                    <input type="radio" name="laikotarpis" value="7"/>Savaitei
                    <br><br>

                    Ignoruojami dietos sudarymo kriterijai: <input type="checkbox" name="ignoruojami" value="baltymai"/>Baltymai
                    <input type="checkbox" name="ignoruojami" value="angliavandeniai"/>Angliavandeniai
                    <input type="checkbox" name="ignoruojami" value="riebalai"/>Riebalai
                    <input type="checkbox" name="ignoruojami" value="kalcis"/>Kalcis
                    <input type="checkbox" name="ignoruojami" value="cholesterolis"/>Cholesterolis
                    <input type="checkbox" name="ignoruojami" value="skaidulines"/>Skaidulinės medžiagos
                    <br><br>

                    <input type="checkbox" name="mesa" value="1"/>Būtinai įtraukti mėsišką produktą pietums<br>
                    <input type="submit" value="Sudaryti dietą" class="btn-success btn-xs" id="sudarytiDieta">
                </form>
                </p>
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
        document.getElementById('asmeniniaiParametrai').onsubmit = function () {
            var elementas = getRadioElementas(this, 'lytis');
            if (elementas == null) {
                alert("Prašome nurodyti lytį!");
                return false;
            }

            elementas = this.elements["amzius"].value;
            if (!/^\d+$/.test(elementas)) {
                alert("Prašome nurodyti amžių kaip natūralųjį skaičių!");
                return false;
            }

            elementas = this.elements["ugis"].value;
            if (!/^\d+$/.test(elementas)) {
                alert("Prašome nurodyti ūgį kaip natūralųjį skaičių!");
                return false;
            }

            elementas = this.elements["svoris"].value;
            if (!/^\d+$/.test(elementas)) {
                alert("Prašome nurodyti svorį kaip natūralųjį skaičių!");
                return false;
            }

            elementas = getRadioElementas(this, 'lygis');
            if (elementas == null) {
                alert("Prašome nurodyti aktyvumo lygį!");
                return false;
            }

            elementas = getRadioElementas(this, 'tikslas');
            if (elementas == null) {
                alert("Prašome nurodyti tikslą!");
                return false;
            }

            elementas = getRadioElementas(this, 'kartai');
            if (elementas == null) {
                alert("Prašome norodyti, kiek kartų per dieną pageidaujate valgyti.");
                return false;
            }

            elementas = getRadioElementas(this, 'laikotarpis');
            if (elementas == null) {
                alert("Prašome nurodyti, kokiam laikotarpiui dietą norite susidaryti.");
                return false;
            }
        }

        function getRadioElementas(forma, pavadinimas) {
            var elementas;
            var radio = forma.elements[pavadinimas];

            for (var i = 0, length = radio.length; i < length; i++) {
                if (radio[i].checked) {
                    elementas = radio[i].value;
                    break;
                }
            }
            return elementas;
        }
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</html>