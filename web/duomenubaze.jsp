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
                    (Paspauskite stulpelio, pagal kurį norite rūšiuoti, pavadinimą)
                </form>
                <table>
                    <tr>
                        <td><input value="Produkto pavadinimas"   style="background: black; color: #F0FD23; width:230px" type="submit" onclick="rusiuoti(0)" id="0"></td>
                        <td><input value="Kcal (100g)" style="background: black; color: #F0FD23; width:94px" type="submit" onclick="rusiuoti(1)" id="1"></td>
                        <td><input value="Baltymai (%)" style="background: black; color: #F0FD23; width:104px" type="submit" onclick="rusiuoti(2)" id="2"></td>
                        <td><input value="Angliavandeniai (%)" style="background: black; color: #F0FD23; width:152px" type="submit" onclick="rusiuoti(3)" id="3"></td>
                        <td><input value="Riebalai (%)" style="background: black; color: #F0FD23; width:94px" type="submit" onclick="rusiuoti(4)" id="4"></td>
                        <td><input value="Cholesterolis (%)" style="background: black; color: #F0FD23; width:134px" type="submit" onclick="rusiuoti(5)" id="5"></td>
                        <td><input value="Kalcis (%)" style="background: black; color: #F0FD23; width:83px" type="submit" onclick="rusiuoti(6)" id="6"></td>
                        <td><input value="Skaidulinės m. (%)" style="background: black; color: #F0FD23; width:143px" type="submit" onclick="rusiuoti(7)" id="7"></td>
                    </tr>
                </table> 
                    <table id="produktuLentele">
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
        const lentele = document.querySelector('#produktuLentele');
        var didejanciaTvarka = true;
        var indeksas;
        
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
        
        function rusiuoti (stulpelis) {
            var lentele, eiles, apkeitimas, i, x, y, apkeisti;
            lentele = document.getElementById("produktuLentele");
            apkeitimas = true;
            if (indeksas === stulpelis) {
                didejanciaTvarka = !didejanciaTvarka;
            } else {
                didejanciaTvarka = false;
            }
            indeksas = stulpelis;
            while (apkeitimas) {
                apkeitimas = false;
                eiles = lentele.rows;
                for (i = 0; i < (eiles.length - 1); i++) {
                    apkeisti = false;
                    if (didejanciaTvarka) {
                        x = eiles[i].getElementsByTagName("td")[stulpelis];
                        y = eiles[i+1].getElementsByTagName("td")[stulpelis];
                    } else {
                        x = eiles[i+1].getElementsByTagName("td")[stulpelis];
                        y = eiles[i].getElementsByTagName("td")[stulpelis];
                    }
                    if (stulpelis === 0) {
                        if ((x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase())) {
                            apkeisti = true;
                            break;
                        }
                    } else {
                        if (parseFloat(x.innerHTML.split("\"")[1]) > parseFloat(y.innerHTML.split("\"")[1])) {
                            apkeisti = true;
                            break;
                        }
                    }
                }
                if (apkeisti) {
                    eiles[i].parentNode.insertBefore(eiles[i+1], eiles[i]);
                    apkeitimas = true;
                }
            }
            nustatytiSriftoSpalvas(stulpelis);  
        }
        
        function nustatytiSriftoSpalvas(stulpelis){
            var mygtukas;
            for (var i = 0; i < 8; i++) {
                mygtukas = document.getElementById(i);
                if (i === stulpelis){
                    if (didejanciaTvarka) {
                        mygtukas.style.color = "#F52323";
                    } else {
                        mygtukas.style.color = "#07BE0D";
                    }
                } else {
                    mygtukas.style.color = "#F0FD23";
                }
            }
        }
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</html>