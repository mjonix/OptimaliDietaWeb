# Aprašymas

Web aplikacija, skirta asmeniniam optimalios dietos plano sudarymui. Kol kas įgyvendintas tik automatinis dietos parinkimas ir maisto produktų duomenų bazės peržiūra,
tačiau ateityje planuojama pridėti daugiau funkcijų.

# Jeigu norite paleisti aplikaciją savo įrenginyje

Failas DUOMENU_BAZE.db turi būti serveryje, konfigūracijos direktorijoje. Jeigu duomenų bazę norite laikyti kitoje
direktorijoje, reikia pakeisti failo /src/java/dietossudarymas/DietosSudarymas.java 133 eilutę, nurodant teisingą duomenų bazės
lokaciją. Aplikacijos įvykdymas pradedamas paleidžiant failą /web/index.jsp.

# Naudojamos technologijos

JSP, JAVA, JUnit, Bootstrap, JavaScript, HTML, CSS, SQLite, JDBC, Oracle GlassFish Server.
