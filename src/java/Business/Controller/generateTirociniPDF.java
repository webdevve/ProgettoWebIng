/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import Business.Model.Candidatura;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

/**
 *
 * @author Davide Simboli
 */
public class generateTirociniPDF {
    public static String generaPdfUno(Candidatura c){
        String testo = "UNIVERSITA' DEGLI STUDI DELL'AQUILA"+System.getProperty("line.separator")
                +"Dipartimento di INGEGNERIA E SCIENZE DELL'INFORMAZIONE E MATEMATICA"+System.getProperty("line.separator")
                +"SEGRETERIA AMMINISTRATIVA PER LA DIDATTICA"+System.getProperty("line.separator")
                +"___________________________________________________________________"+System.getProperty("line.separator")
                +"parte riservata all'universita'.....................................data di ricevimento:....................."+System.getProperty("line.separator")
                +".................................................................................prot. n. ........................................."
                +System.getProperty("line.separator")
                +"___________________________________________________________________"+System.getProperty("line.separator")
                +System.getProperty("line.separator")+""
                + "alla Convenzione per lo svolgimento di attività di tirocinio e "
                + "di orientamento (ai sensi dell'art. 18 L.196/97 e dell'Art. 1 "
                + "Decreto Ministero del Lavoro e Previdenza Sociale N. 142/98 e "
                + "della Legge 148 del 14/09/2011) per studenti, laureati e diplomati "
                + "del Dipartimento di Ingegneria, Scienze dell’Informazione e Matematica "
                + "dell’Università degli Studi dell'Aquila. \n"
                + System.getProperty("line.separator")
                + "PROGETTO FORMATIVO E DI ORIENTAMENTO \n"
                + System.getProperty("line.separator")
                + "Nominativo del tirocinante " + c.getNomeStudente()+"\n"
                + "Nato a "+ c.getLuogoNascita() + " il "+c.getDataNascita()+"\n"
                + "Residente in "+c.getResidenza()+"\n"
                + "Codice fiscale "+c.getCf()+"\n"
                + "Telefono "+c.getTelefonoStudente()+"\n"
                + System.getProperty("line.separator")
                + "Attuale condizione \n"
                + System.getProperty("line.separator")
                + c.getCondizioneAttualeStudente()+"\n"
                + System.getProperty("line.separator")
                + "Trattasi di soggetto portatore di handicap: "+ c.getHandicap()+"\n"
                + "Ente/Azienda ospitante: "+c.getRagioneSociale()+"\n"
                + "Luogo di effettuazione del tirocinio: "+c.getLuogoTirocinio()+"\n"
                + "Settore di inserimento: "+c.getAmbito()+"\n"
                + "Tempi di accesso ai locali aziendali: "+c.getOrari()+"\n"
                + "Periodo di tirocinio: dal "+c.getStartDate() + " al "+c.getEndDate()+"\n"
                + "(con possibilità di proroga entro i limiti massimi previsti dalla normativa vigente) \n"
                + "numero ore di tirocinio: "+c.getOre()+" per il conseguimento di n. "+c.getCfu()+" CFU\n"
                + System.getProperty("line.separator")
                + "Tutore universitario: "+c.getTutoreUniversitario()+"\n"
                + "Telefono: "+c.getTelefonoTutoreUni()+"\n"
                + "Email: "+c.getEmailTutoreUni()+"\n"
                + "Tutore aziendale: "+c.getTutoreAziendale()+"\n"
                + "Telefono: "+c.getTelefonoTutAz()+"\n"
                + "Email: "+c.getEmailTutAz()+"\n"
                + System.getProperty("line.separator")
                + "Polizze assicurative:\n"
                + "Copertura assicurativa per rischio responsabilità civile terzi: \n"
                + "Compagnia assicurativa: QBE Insurance Assicurazioni \n"
                + "Polizza n. 060.0000176 \n"
                + "Scadenza 31/12/2020 \n"
                + "Copertura assicurativa per rischio infortuni cumulativa: \n"
                + "Compagnia assicurativa: Compagnia di Assicurazioni Generali Spa \n"
                + "Polizza n. 380147665 \n"
                + "Scadenza 31/12/2020 \n"
                + System.getProperty("line.separator")
                + "Posizione INAIL: \n"
                + "Copertura assicurativa “in conto Stato” ex art. 2 D.P.R. N. 156 del 9.04.1999 \n"
                + System.getProperty("line.separator")
                + "Obiettivi del tirocinio: "+c.getObiettivi()+"\n"
                + "Modalità: "+c.getModalita()+"\n"
                + "Facilitazioni previste: (sussidio di formazione e servizi aziendali) "+c.getRimborsi()+"\n"
                + System.getProperty("line.separator")
                + "Obblighi del tirocinante: \n"
                + System.getProperty("line.separator")
                + "- Aver seguito il corso online di formazione generale per lasicurezza "
                + "sui luoghi di lavoro disponibile alla pagina web di Ateneo "
                + "https://moodle.univaq.it/course/view.php?id=300, per il quale "
                + "si allega la relativa certificazione; \n"
                + "- Seguire le indicazioni dei tutori e fare riferimento ad essi "
                + "su qualsiasi esigenza di tipo organizzativo ed altre evenienze;\n"
                + "- Rispettare gli obblighi di riservatezza per quanto attiene ai "
                + "dati, informazioni e conoscenze in merito all'attività di ricerca "
                + "dell'Ente/Azienda, acquisiti durante e dopo lo svolgimento del "
                + "tirocinio; \n"
                + "- Rispettare i regolamenti aziendali e le norme in materia di "
                + "igiene e sicurezza; "
                + "- Inviare al Dipartimento di Ingegneria, Scienze dell’Informazione "
                + "e Matematica dell'Università degli Studi dell'Aquila, mensilmente, "
                + "le presenze effettive presso l'Azienda rilevate da una scheda che "
                + "viene consegnata dall’Azienda stessa all'atto della compilazione "
                + "del presente Progetto. \n"
                + System.getProperty("line.separator")
                + "Ai sensi degli artt. 10 e seguenti della legge 675/ 96, sulla "
                + "tutela delle persone e di altri soggetti rispetto al trattamento "
                + "dei dati personali, con la sottoscrizione il tirocinante esprime "
                + "il suo consenso a che i suoi dati personali vengano comunicati "
                + "all'Università limitatamente ai trattamenti connessi alle finalità "
                + "del presente rapporto di tirocinio. La sottoscrizione del presente "
                + "modello comporta anche il consenso del tirocinante al trattamento "
                + "dei suoi dati personali nel senso sopraindicato. \n"
                + System.getProperty("line.separator")
                + "L'Aquila, "+c.getDataRichiesta()+"\n"
                + System.getProperty("line.separator")
                + "Firma per visione e accettazione del tirocinante \n"
                + c.getNomeStudente()+"\n"
                + System.getProperty("line.separator")+"\n"
                + "Dipartimento di Ingegneria, Scienze dell’Informazione e Matematica "
                + "dell’Università degli Studi di L'Aquila \n"
                + "Il Tutor \n"
                + "_______________________ \n"
                + System.getProperty("line.separator")
                + "L'Ente/Azienda \n"
                + "_______________________ \n"
                + System.getProperty("line.separator")
                + "Il Tutor aziendale \n"
                + "_______________________ \n"
                + System.getProperty("line.separator")
                + "Il Direttore del Dipartimento di Ingegneria e Scienze dell’Informazione e Matematica. \n"
                + "Prof. Guido Proietti "
                + "_______________________ \n";
        
        generateFile(testo, c.getNomeStudente());
        return testo;
    }
    
    public static void generateFile(String testo, String name){
        try{
            String userprofile = System.getenv("USERPROFILE");
            String fileName = userprofile + "\\Downloads/Documento formativo-"+name+".pdf";
            Document document = new Document();
        
            PdfWriter.getInstance(document, new FileOutputStream(fileName));
            document.open();
            Paragraph para = new Paragraph(testo);
            document.add(para);
            document.close();
            //System.out.println("Documento pdf creato");
        }catch(DocumentException | FileNotFoundException e){
            System.out.println(e);
        }
    }
}
