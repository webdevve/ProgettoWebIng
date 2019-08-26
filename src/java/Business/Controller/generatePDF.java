/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Davide Simboli
 */
@WebServlet(name = "generatePDF", urlPatterns = {"/generatePDF"})
public class generatePDF extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //System.out.println("richiesta di stampa");
        String richiesta = request.getParameter("stampa");
        if(richiesta.equals("convenzione")){
            generateConvenzionePDF(request, response);
        }
        response.sendRedirect("admin.jsp");
    }
    
    protected void generateConvenzionePDF(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String ragioneSociale = request.getParameter("ragioneSociale");
        String sedeLegale = request.getParameter("sedeLegale");
        String partitaIva = request.getParameter("partitaIva");
        String rappresentante = request.getParameter("rappresentante");
        String descrizione = request.getParameter("descrizione");
        String ambito = request.getParameter("ambito");
        String legaleRappresentante = request.getParameter("legaleRappresentante");
        //System.out.println("Preparazione documento convenzione...");
        String testo = "";
        String pag1 = "UNIVERSITA' DEGLI STUDI DELL'AQUILA"+System.getProperty("line.separator")
                +"Dipartimento di INGEGNERIA E SCIENZE DELL'INFORMAZIONE E MATEMATICA"+System.getProperty("line.separator")
                +"SEGRETERIA AMMINISTRATIVA PER LA DIDATTICA"+System.getProperty("line.separator")
                +"___________________________________________________________________"+System.getProperty("line.separator")
                +"parte riservata all'universita'.....................................data di ricevimento:....................."+System.getProperty("line.separator")
                +".................................................................................prot. n. ........................................."
                +System.getProperty("line.separator")
                +"___________________________________________________________________"+System.getProperty("line.separator")
                +System.getProperty("line.separator")
                +"CONVENZIONE PER LO SVOLGIMENTO DI ATTIVITA' DI TIROCINIO E DI \n" +
                "ORIENTAMENTO (AI SENSI DELL'ART.18 L.196/97, DELL'ART.1 DECRETO\n" +
                "MINISTERO DEL LAVORO E PREVIDENZA SOCIALE N.142/98 E DELLA LEGGE 148\n" +
                "del 14/09/2011) PER STUDENTI E LAUREATI DEL DIPARTIMENTO DI INGEGNERIA E\n" +
                "SCIENZE DELL’INFORMAZIONE E MATEMATICA DELL'UNIVERSITA' DEGLI STUDI\n" +
                "DELL'AQUILA"+System.getProperty("line.separator")
                +"tra:"+System.getProperty("line.separator")
                +"L’Università degli Studi di L’Aquila – Dipartimento di Ingegneria e Scienze\n" +
                "dell’Informazione e Matematica, con sede legale in L’Aquila, C.F./P.I. 01021630668,\n" +
                "rappresentata per la stipula del presente atto convenzionale, dal Direttore del Dipartimento\n" +
                "di Ingegneria e Scienze dell’Informazione e Matematica Prof. Guido Proietti, nato a\n" +
                "Roma il 13.06.1966, domiciliato per il presente atto presso la sede legale del l’Università, e\n" +
                "autorizzato e delegato alla stipula della presente Convenzione dal Rettore dell’Università\n" +
                "con D.R n. 522-2018, prot. n. 22151 del 17.05.2018\n"+System.getProperty("line.separator")
                +"e"+System.getProperty("line.separator")
                +System.getProperty("line.separator")
                +"L’Ente/Azienda " + ragioneSociale + System.getProperty("line.separator")
                +"con sede legale in (indirizzo) " + sedeLegale +System.getProperty("line.separator")
                +"Codice Fiscale (o Partita IVA) " + partitaIva +System.getProperty("line.separator")
                +"rappresentato da " + rappresentante +System.getProperty("line.separator")
                +"Premesso:" +System.getProperty("line.separator")
                +" • che l’Ente/Azienda "+ragioneSociale+" intende avviare progetti di\n" +
                "collaborazione con il DISIM finalizzati alla realizzazione di tirocini\n" +
                "formativi e di orientamento curriculari rivolti agli studenti dell'Università degli Studi\n" +
                "dell'Aquila, con particolare riguardo a tematiche inerenti(1)"+System.getProperty("line.separator")
                + descrizione +System.getProperty("line.separator")
                +"che rientrano negli ambiti di interesse scientifico e didattico del DISIM, e in particolare\n"
                +"del/i Corso/i di Studio "+ ambito +System.getProperty("line.separator")
                +"____________________________"+System.getProperty("line.separator")
                +"(1)L’Ente/Azienda deve inserire una breve descrizione di alto livello dei progetti formativi di interesse, enfatizzandone il legame con il proprio profilo aziendale o istituzionale"
                +System.getProperty("line.separator")
                +System.getProperty("line.separator");
        testo = pag1;
        String pag2 = " • che i tirocini formativi e di orientamento sono ora disciplinati dall'articolo 18 della legge\n" +
                "24 giugno 1997 n.196, dal suo regolamento di attuazione emanato con Decreto 25\n" +
                "marzo 1998, n.142 e dalla legge 148 del 14/09/2011;"+System.getProperty("line.separator")
                +" • che il Dipartimento di Ingegneria e Scienze dell’Informazione e Matematica intende"+System.getProperty("line.separator")
                +"attuare progetti diretti al raggiungimento delle finalità indicate dall'art.18 L. 24 giugno"+System.getProperty("line.separator")
                +"1997 n.196 e dall'art.1 del suddetto decreto 25 marzo 1998 n. 142, che promuovono"+System.getProperty("line.separator")
                +"tirocini formativi e di orientamento presso le aziende;"+System.getProperty("line.separator")
                +" • che al fine di agevolare le scelte professionali mediante la conoscenza diretta del \n"+System.getProperty("line.separator")
                + "mondo del lavoro e realizzare momenti di alternanza tra studio e lavoro nell'ambito dei "+System.getProperty("line.separator")
                + "processi formativi i soggetti richiamati dall'art.18, comma 1, lett. a) della legge 24 "+System.getProperty("line.separator")
                + "giugno 1997 n.196, tra cui le Università, possono promuovere tirocini formativi e di "+System.getProperty("line.separator")
                + "orientamento presso datori di lavori pubblici e privati a beneficio di coloro che abbiano "+System.getProperty("line.separator")
                + "già assolto l'obbligo scolastico ai sensi della legge 31.12.62 n.1859;\n"+System.getProperty("line.separator")
                +"si conviene quanto segue:\n"+System.getProperty("line.separator")+System.getProperty("line.separator")
                +"le premesse costituiscono parte integrante e sostanziale della presente Convenzione.\n"+System.getProperty("line.separator")
                +"Art. 1 Oggetto"+System.getProperty("line.separator")
                + "1.1 L'Ente/l'Azienda si impegna ad accogliere presso le proprie strutture soggetti in "+System.getProperty("line.separator")
                + "tirocinio di formazione ed orientamento, ai sensi dell'art. 18 della legge 24 giugno 1997 n. "+System.getProperty("line.separator")
                + "196 e della legge 148 del 14/09/2011, in numero non superiore a quanto disposto "+System.getProperty("line.separator")
                + "dall'articolo 1, comma 3, lettera c), del decreto 142/98. In particolare non possono essere "+System.getProperty("line.separator")
                + "attivati tirocini presso aziende che non hanno dipendenti.\n" +System.getProperty("line.separator")
                +"Potranno effettuare periodi di tirocinio (stage), studenti, neo-laureati e neo-diplomati del "+System.getProperty("line.separator")
                + "Dipartimento di Ingegneria e Scienze dell’Informazione e Matematica dell'Università degli "+System.getProperty("line.separator")
                + "Studi di L'Aquila, a condizione che il tirocinio inizi non oltre i 12 mesi successivi al "+System.getProperty("line.separator")
                + "conseguimento della laurea o del diploma.\n" +System.getProperty("line.separator")
                +"Potranno effettuare periodi di tirocinio (stage), anche coloro che frequentano dottorati di "+System.getProperty("line.separator")
                + "ricerca e scuole o corsi di perfezionamento e specializzazione.\n"+System.getProperty("line.separator")
                + "1.2 Ai fini dello svolgimento del tirocinio l’Ente/l'Azienda mette a disposizione del "+System.getProperty("line.separator")
                + "Dipartimento di Ingegneria e Scienze dell’Informazione e Matematica dell'Università le "+System.getProperty("line.separator")
                + "proprie strutture. L'accesso alle strutture sarà guidato dal personale dell’Ente/Azienda "+System.getProperty("line.separator")
                + "ospitante, con compiti di illustrazione e formazione."+System.getProperty("line.separator")
                +"Art. 2 Rapporti con i tirocinanti"+System.getProperty("line.separator")
                + "2.1 Il tirocinio formativo e di orientamento, ai sensi dell'art. 18, comma 1 lett. d) della legge "+System.getProperty("line.separator")
                + "196 del 1997 non costituisce rapporto di lavoro e non dà luogo ad alcuna ipotesi di attività "+System.getProperty("line.separator")
                + "occupazionale. L'Ente/l'Azienda non ha alcun obbligo di assunzione al termine del periodo "+System.getProperty("line.separator")
                + "di tirocinio."+System.getProperty("line.separator");
        testo = testo + pag2;
        String pag3 = "2.2 Durante lo svolgimento del tirocinio, l'attività di formazione ed orientamento è seguita e "+System.getProperty("line.separator")
                + "verificata da un tutore designato dal Dipartimento di Ingegneria e Scienze "+System.getProperty("line.separator")
                + "dell’Informazione e Matematica dell'Università in veste di responsabile didattico - "+System.getProperty("line.separator")
                + "organizzativo (il cui nominativo risulterà dal Progetto formativo e di orientamento dei "+System.getProperty("line.separator")
                + "singoli stagisti) e da un responsabile aziendale indicato dall’ Ente/l'Azienda (risultante dal "+System.getProperty("line.separator")
                + "predetto Progetto)"+System.getProperty("line.separator")
                +"2.3 Per ciascun tirocinante da inserirsi nell'Ente/Azienda ospitante verrà predisposto tra le "+System.getProperty("line.separator")
                + "parti un Progetto formativo e di orientamento, come da ALLEGATO 1, contenente:\n" +System.getProperty("line.separator")
                +" a)	le generalità del tirocinante; \n" +System.getProperty("line.separator") 
                +" b)	i nominativi del tutore e del responsabile aziendale;\n" +System.getProperty("line.separator")
                +" c)	durata, obiettivi e modalità di svolgimento del tirocinio;\n" +System.getProperty("line.separator")
                +" d)	le strutture aziendali (sedi ed uffici) presso cui si svolge il tirocinio;\n" +System.getProperty("line.separator")
                +" e)	gli estremi identificativi delle assicurazioni INAIL e per la responsabilità civile."+System.getProperty("line.separator")
                +"2.4 L'avvio operativo per lo svolgimento dei singoli tirocini avverrà con scambio di lettera di "+System.getProperty("line.separator")
                + "conferma tra l'Ente/l'Azienda ospitante ed il tirocinante, con allegata copia del relativo "+System.getProperty("line.separator")
                + "Progetto di cui al n.2.3 che precede, sottoscritto dall’Ente/l'Azienda, dal Dipartimento di "+System.getProperty("line.separator")
                + "Ingegneria e Scienze dell’Informazione e Matematica e dallo stagista per adesione ed "+System.getProperty("line.separator")
                + "accettazione."+System.getProperty("line.separator")
                +"2.5 E' consentita, con l'approvazione del responsabile aziendale, la partecipazione del "+System.getProperty("line.separator")
                + "tirocinante ad attività aziendali fuori sede. In tal caso le spese di viaggio e di soggiorno o "+System.getProperty("line.separator")
                + "eventuali altre spese saranno sostenute dall'Ente/Azienda, secondo le norme e le "+System.getProperty("line.separator")
                + "procedure interne all'Ente/Azienda stessa."+System.getProperty("line.separator")
                +"Art. 3 Svolgimento e durata del tirocinio"+System.getProperty("line.separator")
                +"3.1 Come previsto dalla normativa vigente la durata massima dei tirocini potrà essere di 6 "+System.getProperty("line.separator")
                + "mesi nel caso di neolaureati/neodiplomati e di 12 mesi per gli studenti. Nel caso di "+System.getProperty("line.separator")
                + "iniziative rivolte a persone con disabilità la durata è estensibile a 18 mesi.\n" +System.getProperty("line.separator")
                +"La durata viene specificata nel Progetto di cui al n. 2.3 che precede relativo ad ogni "+System.getProperty("line.separator")
                + "tirocinante. La durata stessa potrà essere prorogata, previo accordo tra le parti, entro i limiti massimi "+System.getProperty("line.separator")
                + "indicati dall'art. 7 del decreto n. 142/98."+System.getProperty("line.separator")
                +"3.2 È consentita, per giustificati motivi, la richiesta da parte del tirocinante di una "+System.getProperty("line.separator")
                + "interruzione temporanea dello stage, comunque non superiore a n.° 2 settimane "+System.getProperty("line.separator")
                + "consecutive, previa comunicazione all’Ente/Azienda ospitante, ferma restando la durata "+System.getProperty("line.separator")
                + "complessiva del tirocinio come prevista nel progetto formativo individuale."+System.getProperty("line.separator")
                +"3.3 Durante lo svolgimento del tirocinio formativo e di orientamento il tirocinante è tenuto "
                + "a:"+System.getProperty("line.separator")
                +" - svolgere le attività previste dal Progetto formativo e di orientamento;"+System.getProperty("line.separator");
        testo = testo + pag3;
        String pag4 = " - cooperare al conseguimento degli obiettivi che lo riguardano, osservando gli orari "+System.getProperty("line.separator")
                + "concordati e rispettando l'ambiente di lavoro e le esigenze di coordinamento dell'attività "+System.getProperty("line.separator")
                + "di ricerca dell'azienda;"+System.getProperty("line.separator")
                +" - rispettare le norme in materia di igiene, sicurezza e salute sui luoghi di lavoro con "+System.getProperty("line.separator")
                + "particolare riferimento all’art. 20 del D.Lgs. n. 81/2008 “Obblighi del lavoratore”;"+System.getProperty("line.separator")
                +" - mantenere la necessaria riservatezza per quanto attiene ai dati, informazioni e/o "+System.getProperty("line.separator")
                + "conoscenze in merito ad attività di ricerca dell’Ente/l'Azienda (ed ai relativi contenuti e "+System.getProperty("line.separator")
                + "risultati), acquisiti durante lo svolgimento del tirocinio;"+System.getProperty("line.separator")
                +" - inviare al Direttore del Dipartimento di Ingegneria e Scienze dell’Informazione e "+System.getProperty("line.separator")
                + "Matematica dell'Università degli Studi dell'Aquila, mensilmente ed entro il giorno 8 del "+System.getProperty("line.separator")
                + "mese successivo a quello cui si riferiscono, le presenze effettive in tirocinio presso "+System.getProperty("line.separator")
                + "l’Ente/Azienda, rilevate dalla scheda che sarà consegnata all'atto della compilazione "+System.getProperty("line.separator")
                + "del Progetto."+System.getProperty("line.separator")
                +"3.4 Qualora si verificassero, da parte del tirocinante, comportamenti lesivi di diritti o "+System.getProperty("line.separator")
                + "interessi dell’Ente/l'Azienda essa potrà, previa informazione al tutore incaricato dal "+System.getProperty("line.separator")
                + "Dipartimento di Ingegneria e Scienze dell’Informazione e Matematica, sospendere o "+System.getProperty("line.separator")
                + "interrompere lo svolgimento del tirocinio."+System.getProperty("line.separator")
                +"3.5 La realizzazione del tirocinio non comporta per l’Ente/l'Azienda e per il Dipartimento di "+System.getProperty("line.separator")
                + "Ingegneria e Scienze dell’Informazione e Matematica dell'Università degli Studi dell'Aquila "+System.getProperty("line.separator")
                + "alcun onere finanziario, né obblighi di altra natura salvo quelli previsti nella presente "+System.getProperty("line.separator")
                + "Convenzione."+System.getProperty("line.separator")
                +"L’Ente/l'Azienda potrà peraltro erogare eventuali somme a titolo di rimborso spese (da "+System.getProperty("line.separator")
                + "prevedere nel progetto formativo), secondo le norme e le procedure interne all’ "+System.getProperty("line.separator")
                + "Ente/l'Azienda stesso, ovvero eventuali sussidi di formazione e consentire ai tirocinanti "+System.getProperty("line.separator")
                + "l'utilizzo dei servizi aziendali (in particolare, servizio mensa), senza che tali erogazioni "+System.getProperty("line.separator")
                + "possano determinare modifiche alla natura dei rapporti oggetto della presente "+System.getProperty("line.separator")
                + "Convenzione, o facoltà o diritti ulteriori o diversi da quelli previsti dalla Convenzione stessa "+System.getProperty("line.separator")
                + "e dalle relative disposizioni normative. Potranno essere erogati eventuali premi in denaro "+System.getProperty("line.separator")
                + "nei particolari casi di eccellenza della ricerca svolta e dei risultati raggiunti."+System.getProperty("line.separator")
                +"3.6 L’Azienda/Ente ospitante si impegna a garantire che il tirocinio si svolga presso "+System.getProperty("line.separator")
                + "strutture aziendali (stabilimenti, sedi, reparti, uffici ecc.) che rispettino le vigenti "+System.getProperty("line.separator")
                + "disposizioni normative in tema di prevenzione incendi, igiene e sicurezza del lavoro, "+System.getProperty("line.separator")
                + "garantendo, in particolare, che i locali, le attrezzature e le strumentazioni siano idonee e "+System.getProperty("line.separator")
                + "adeguate ai sensi del D. lgs. 81 del 9 Aprile 2008."+System.getProperty("line.separator")
                +"L’Azienda/Ente ospitante si impegna inoltre ad assolvere a tutti gli obblighi indicati dal D. "+System.getProperty("line.separator")
                + "lgs 81/2008 con particolare riguardo al Titolo I, Capo III, sez. IV “Formazione, informazione "+System.getProperty("line.separator")
                + "e addestramento”, sezione V “Sorveglianza sanitaria” per i casi eventualmente previsti "+System.getProperty("line.separator")
                + "(presenza di rischi specifici), e al Titolo III, Capo II “Uso dei dispositivi di protezione "+System.getProperty("line.separator")
                + "individuali”."+System.getProperty("line.separator");
        testo = testo + pag4;
        String pag5 = "Art. 4 Coperture assicurative"+System.getProperty("line.separator")
                +"4.1 L'Università degli Studi di L'Aquila si impegna ad assicurare i tirocinanti contro gli "+System.getProperty("line.separator")
                + "infortuni sul lavoro presso l'INAIL, nonché per la responsabilità civile presso compagnie "+System.getProperty("line.separator")
                + "assicurative operanti nel settore ed indicate nel progetto formativo. L'assicurazione dovrà "+System.getProperty("line.separator")
                + "coprire anche le attività svolte nell'ambito del tirocinio fuori sede ai sensi del punto 2.5. Gli "+System.getProperty("line.separator")
                + "estremi identificativi delle assicurazioni predette saranno indicati nei Progetti."+System.getProperty("line.separator")
                +"4.2 In caso di infortunio durante lo svolgimento del tirocinio, l’Ente/l'Azienda si impegna a "+System.getProperty("line.separator")
                + "segnalare l'evento, entro i tempi previsti dalla normativa vigente, agli istituti assicurativi "+System.getProperty("line.separator")
                + "(quali risultanti dal Progetto formativo e di orientamento e facendo riferimento al numero "+System.getProperty("line.separator")
                + "della polizza sottoscritta dall'Università degli Studi di L'Aquila) ed all'Università stessa."+System.getProperty("line.separator")
                +"Art. 5 Comunicazioni"+System.getProperty("line.separator")
                +"Il Dipartimento di Ingegneria e Scienze dell’Informazione e Matematica dell'Università degli "+System.getProperty("line.separator")
                + "Studi di L'Aquila si impegna a far pervenire alla Regione o alla Provincia delegata, alle "+System.getProperty("line.separator")
                + "strutture provinciali del Ministero del Lavoro e della Previdenza sociale competenti per "+System.getProperty("line.separator")
                + "territorio in materia di ispezione copia della Convenzione e di ciascun Progetto formativo e "+System.getProperty("line.separator")
                + "di orientamento."+System.getProperty("line.separator")
                +"L’ Ente/l'Azienda per delega che l'Università degli Studi di L'Aquila le conferisce con la "+System.getProperty("line.separator")
                + "presente, provvederà a far pervenire alle Rappresentanze Sindacali dei Lavoratori copia "+System.getProperty("line.separator")
                + "della presente Convenzione e di ciascun Progetto formativo e di orientamento, ai sensi "+System.getProperty("line.separator")
                + "della normativa vigente."+System.getProperty("line.separator")
                +"In ottemperanza a quanto previsto dalla legge n.296/2006 (Finanziaria 2007) "+System.getProperty("line.separator")
                + "l’Ente/Azienda ospitante è tenuto ad effettuare obbligatoriamente la comunicazione "+System.getProperty("line.separator")
                + "dell'avvio dello stage/tirocinio al centro per l'impiego competente entro le ore 24 del giorno "+System.getProperty("line.separator")
                + "antecedente, solo ed esclusivamente per i neolaureati."+System.getProperty("line.separator")
                +"Art. 6 Risoluzione delle controversie"+System.getProperty("line.separator")
                +"Ogni attività prevista dalla presente Convenzione si svolgerà nel rispetto dell'Ordinamento "+System.getProperty("line.separator")
                + "generale dello Stato e delle leggi che regolano l'attività di entrambi gli Enti." +System.getProperty("line.separator")
                +"Le parti concordano di definire amichevolmente qualsiasi controversia dovesse insorgere "+System.getProperty("line.separator")
                + "dall'interpretazione o applicazione del presente Atto." +System.getProperty("line.separator")
                +"Qualora non fosse possibile raggiungere tale accordo, il Foro competente a dirimere la "+System.getProperty("line.separator")
                + "controversia sarà quello di: "+sedeLegale +System.getProperty("line.separator")
                +"Art. 7 Trattamento dati" +System.getProperty("line.separator")
                +"Le parti dichiarano di essersi reciprocamente informate, di acconsentire che i dati " +System.getProperty("line.separator")
                + "personali raccolti per la formalizzazione del presente atto siano oggetto di trattamento per " +System.getProperty("line.separator")
                + "gli adempimenti di legge ai sensi del d. lgs. 196/03 e di essere a conoscenza di quanto " +System.getProperty("line.separator")
                + "previsto dall’art.13 dello stesso decreto." +System.getProperty("line.separator");
        testo = testo + pag5;
        String pag6 = "Art. 8 Richiami"
                +"Per tutto quanto non previsto dalla presente Convenzione le parti fanno riferimento alla "
                + "legislazione vigente in materia."+sedeLegale +System.getProperty("line.separator")
                +"Art. 9 Decorrenza della presente Convenzione \n"
                + "La presente Convenzione decorre dalla data in calce, ha durata di .................... "
                + "e si intenderà rinnovata tacitamente, a meno di disdetta da comunicarsi entro i tre "
                + "mesi precedenti alla data di scadenza.\n"
                +"Art. 10 Referenti per la Convenzione"+sedeLegale +System.getProperty("line.separator")
                +"Referenti per la presente Convenzione e per i rapporti fra gli Enti Contraenti nell'ambito "
                + "della Convenzione stessa sono:\n"
                +"per Il Dipartimento di Ingegneria e Scienze dell’Informazione e Matematica dell’Università "
                + "degli Studi L'Aquila: \n"
                + "___________________________________________\n"
                + "per l’Ente/l'Azienda: "+ rappresentante
                +"\n"
                + "Art. 11 Registrazione e spese\n"
                + "La presente Convenzione sarà registrata a tassa fissa, in caso d'uso, ai sensi degli "
                + "artt. 5 e 39 del D.P.R. 131 del 26.4.86."
                + "\n\n"
                + "L'Aquila, lì _________________________"
                + "\n\n"
                + "Il Direttore\n"
                + "(Prof. Guido Proietti)\n"
                + "______________________\n\n"
                +"Il Rappresentante\n"
                + "Legale dell’Azienda\n"
                + legaleRappresentante;
        testo = testo + pag6;
        generatePDF(testo, ragioneSociale);
    }
    
    protected void generatePDF(String documento, String name)
            throws IOException{
        try{
            String userprofile = System.getenv("USERPROFILE");
            String fileName = userprofile + "\\Downloads/Convenzione-"+name+".pdf";
            Document document = new Document();
        
            PdfWriter.getInstance(document, new FileOutputStream(fileName));
            document.open();
            Paragraph para = new Paragraph(documento);
            document.add(para);
            document.close();
            //System.out.println("Documento pdf creato");
        }catch(Exception e){
            System.out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
