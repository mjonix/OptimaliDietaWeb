package dietossudarymas;

import java.sql.SQLException;
import java.util.ArrayList;
import org.junit.Test;
import static org.junit.Assert.*;

public class DietosSudarymasTest {

    DietosSudarymas ds = new DietosSudarymas();

    @Test
    public void testKmi() {
        int ugis = 180;
        int svoris = 70;
        double teisingasRezultatas = 21.6;
        double gautasRezultatas = ds.kmi(ugis, svoris);
        assertEquals(teisingasRezultatas, gautasRezultatas, 0.1);
    }

    @Test
    public void testSuapvalinti() {
        double teisingasRezultatas = 21.6;
        double gautasRezultatas = ds.suapvalinti(21601000);
        assertEquals(teisingasRezultatas, gautasRezultatas, 0.1);
    }

    @Test
    public void testKilokalorijuPoreikis() {
        int amzius = 23;
        int lytis = 1;
        int ugis = 186;
        int svoris = 81;
        int aktyvumas = 2;
        int tikslas = 2;
        int teisingasRezultatas = 3313;
        int gautasRezultatas = ds.kilokalorijuPoreikis(lytis, ugis, svoris, amzius, aktyvumas, tikslas);
        assertEquals(teisingasRezultatas, gautasRezultatas);
    }

    @Test
    public void testPateiktiMedziaguNormas() {
        int amzius = 23;
        int lytis = 1;
        int ugis = 186;
        int svoris = 81;
        int aktyvumas = 2;
        int tikslas = 2;
        int poreikis = ds.kilokalorijuPoreikis(lytis, ugis, svoris, amzius, aktyvumas, tikslas);
        double kmi = ds.kmi(ugis, svoris);
        String teisingasRezultatas = "Rekomenduojama suvartoti: 124 - 165g baltymų, 455 - 496g angliavandenių, 55 - 73g riebalų,<br> "
                + "0.99 - 1.01g kalcio ir 41 - 51g skaidulinių medžiagų.";
        String gautasRezultatas = ds.pateiktiMedziaguNormas(kmi, aktyvumas, poreikis, amzius, lytis);
        assertEquals(teisingasRezultatas, gautasRezultatas);
    }

    @Test
    public void testImanomaSudarytiDieta() throws SQLException, ClassNotFoundException {
        ArrayList<String> nepageidaujamaKategorija = new ArrayList(), nepageidaujamiProduktai = new ArrayList();
        int kartai = 5;
        boolean mesaPietums = true;
        nepageidaujamaKategorija.add("mėsa");
        ArrayList<MaistoProduktas> produktai = ds.gautiProduktus(nepageidaujamaKategorija, nepageidaujamiProduktai);
        boolean teisingasRezultatas = false;
        boolean gautasRezultatas = ds.imanomaSudarytiDieta(produktai, kartai, mesaPietums);
        assertEquals(teisingasRezultatas, gautasRezultatas);
    }
}
