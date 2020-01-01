<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dietossudarymas.DietosSudarymas"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dietos planas</title>
    </head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <body id="main">
        <div class="container">
            <div class="jumbotron">
                <%
                    int lytis, amzius, ugis, svoris, aktyvumas, tikslas, kartai, laikotarpis;
                    String[] kategorija, ignoruojami;
                    boolean mesa = true;

                    lytis = Integer.parseInt(request.getParameter("lytis"));
                    amzius = Integer.parseInt(request.getParameter("amzius"));
                    ugis = Integer.parseInt(request.getParameter("ugis"));
                    svoris = Integer.parseInt(request.getParameter("svoris"));
                    aktyvumas = Integer.parseInt(request.getParameter("lygis"));
                    tikslas = Integer.parseInt(request.getParameter("tikslas"));
                    kartai = Integer.parseInt(request.getParameter("kartai"));
                    laikotarpis = Integer.parseInt(request.getParameter("laikotarpis"));
                    kategorija = request.getParameterValues("kategorija");

                    ArrayList<String> nepageidaujamaKategorija = new ArrayList();

                    if (kategorija != null) {
                        for (String k : kategorija) {
                            if (k.equals("mesa")) {
                                nepageidaujamaKategorija.add("mėsa");
                            }
                            if (k.equals("sokoladas")) {
                                nepageidaujamaKategorija.add("šokoladas");
                            }
                            if (k.equals("riesutai")) {
                                nepageidaujamaKategorija.add("riešutai");
                            }
                            if (k.equals("zuvis")) {
                                nepageidaujamaKategorija.add("žuvis");
                            }
                            if (k.equals("pienas")) {
                                nepageidaujamaKategorija.add("pienas");
                            }
                            if (k.equals("medus")) {
                                nepageidaujamaKategorija.add("medus");
                            }
                            if (k.equals("kiausiniai")) {
                                nepageidaujamaKategorija.add("kiaušiniai");
                            }
                            if (k.equals("miltai")) {
                                nepageidaujamaKategorija.add("miltai");
                            }
                            if (k.equals("kruopos")) {
                                nepageidaujamaKategorija.add("kruopos");
                            }
                            if (k.equals("uogos")) {
                                nepageidaujamaKategorija.add("uogos");
                            }
                            if (k.equals("grybai")) {
                                nepageidaujamaKategorija.add("grybai");
                            }
                        }
                    }
                    ignoruojami = request.getParameterValues("ignoruojami");
                    ArrayList<String> ignoruojamiKriterijai = new ArrayList();
                    if (ignoruojami != null) {
                        for (String i : ignoruojami) {
                            ignoruojamiKriterijai.add(i);
                        }
                    }
                    if (request.getParameterValues("mesa") == null) {
                        mesa = false;
                    }
                    DietosSudarymas ds = new DietosSudarymas();
                    int poreikis = ds.kilokalorijuPoreikis(lytis, ugis, svoris, amzius, aktyvumas, tikslas);
                    double kmi = ds.kmi(ugis, svoris);
                %>
                Pagal pateiktus duomenis, rekomenduojama paros energijos suvartojimo norma yra: <%= poreikis%>kcal <br> <%= ds.medziagos(kmi,
                aktyvumas, poreikis, amzius, lytis)%><br><br>Pavyzdinė dieta:<br><br>
                <%=ds.dietosSudarymas(kmi, poreikis, aktyvumas, amzius, lytis, kartai, laikotarpis, nepageidaujamaKategorija,
                new ArrayList<String>(), ignoruojamiKriterijai, mesa)%>

                <form  method="post">
                    <input type="submit" value="Sudaryti dietą iš naujo"  class="btn-success btn-xs" id="isNaujo">
                </form>
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
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</html>