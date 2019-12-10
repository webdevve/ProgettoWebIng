/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import DAO.CandidaturaDAO;
import DAO.DocumentiDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Davide Simboli
 */
@WebServlet(name = "terminaTirocinio", urlPatterns = {"/terminaTirocinio"})
public class terminaTirocinio extends HttpServlet {

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
        String status = request.getParameter("stato");
        if(status.equals("terminaTirocinio")){
            redirectPageDoc(request, response);
        }
        if(status.equals("termina")){
            terminaTirocinioStudente(request, response);
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

    private void redirectPageDoc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_candidatura = request.getParameter("id");
        String ragione_soc = request.getParameter("ragione_soc");
        String partita_iva = request.getParameter("partita_iva");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String condizione = request.getParameter("condizione");
        String data_inizio = request.getParameter("data_inizio");
        String data_fine = request.getParameter("data_fine");
        String durata = request.getParameter("durata");
        String luogo = request.getParameter("luogo");
        String obiettivi = request.getParameter("obiettivi");
        String nome_responsabile = request.getParameter("nome_responsabile");
        String cognome_responsabile = request.getParameter("cognome_responsabile");
        String responsabile = nome_responsabile + " "+cognome_responsabile;
        String id_studente = request.getParameter("id_studente");
        String id_azienda = request.getParameter("id_azienda");
        String titolo = request.getParameter("titolo");
        
        request.setAttribute("id_candidatura", id_candidatura);
        request.setAttribute("ragione_soc", ragione_soc);
        request.setAttribute("partita_iva", partita_iva);
        request.setAttribute("nome_studente", nome);
        request.setAttribute("cognome_studente", cognome);
        request.setAttribute("condizione", condizione);
        request.setAttribute("data_inizio", data_inizio);
        request.setAttribute("data_fine", data_fine);
        request.setAttribute("durata", durata);
        request.setAttribute("luogo", luogo);
        request.setAttribute("obiettivi", obiettivi);
        request.setAttribute("responsabile", responsabile);
        request.setAttribute("id_studente", id_studente);
        request.setAttribute("id_azienda", id_azienda);
        request.setAttribute("titolo", titolo);
        
        RequestDispatcher rd = request.getRequestDispatcher("progettoFormativoAz.jsp");
        rd.forward(request, response);
    }

    private void terminaTirocinioStudente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String documento = generaDocFinale(request, response);
        String id_candidatura = request.getParameter("id_candidatura");
        String id_studente = request.getParameter("id_studente");
        String id_azienda = request.getParameter("id_azienda");
        String titolo = request.getParameter("titolo");
        String nome_studente = request.getParameter("nome_studente");
        String cognome_studente = request.getParameter("cognome_studente");
        boolean chiudi = CandidaturaDAO.chiudiTirocinio(id_candidatura);
        if(chiudi){
            ArrayList<Object> list1 = new ArrayList<>();
            list1.add(id_studente);
            list1.add(id_azienda);
            list1.add("studente");
            list1.add(documento);
            list1.add("Resoconto finale "+titolo);
            ArrayList<Object> list2 = new ArrayList<>();
            list2.add(id_studente);
            list2.add(id_azienda);
            list2.add("azienda");
            list2.add(documento);
            list2.add("Resoconto finale "+titolo);
            boolean salvaDoc1 = DocumentiDAO.salvaDocFinale(list1);
            boolean salvaDoc2 = DocumentiDAO.salvaDocFinale(list2);
            if(salvaDoc1 && salvaDoc2){
                String notifica = "Tirocinio "+ titolo+" di "+ nome_studente+" "+cognome_studente+" è stato chiuso correttamente.";
                RequestDispatcher rd = request.getRequestDispatcher("tirociniInCorso.jsp");
                request.setAttribute("notify", notifica);
                rd.forward(request, response);
            }else{
                String errore = "Si è verificato un errore!";
                RequestDispatcher rd = request.getRequestDispatcher("tirociniInCorso.jsp");
                request.setAttribute("err", errore);
                rd.forward(request, response);
            }
        }else{
            String errore = "Si è verificato un errore!";
            RequestDispatcher rd = request.getRequestDispatcher("tirociniInCorso.jsp");
            request.setAttribute("err", errore);
            rd.forward(request, response);
        }
    }

    private String generaDocFinale(HttpServletRequest request, HttpServletResponse response) {
        String ragione_soc = request.getParameter("ragione_soc");
        String partita_iva = request.getParameter("partita_iva");
        String nome_studente = request.getParameter("nome_studente");
        String cognome_studente = request.getParameter("cognome_studente");
        String condizione = request.getParameter("condizione");
        String data_inizio = request.getParameter("data_inizio");
        String data_fine = request.getParameter("data_fine");
        String durata = request.getParameter("durata");
        String luogo = request.getParameter("luogo");
        String obiettivi = request.getParameter("obiettivi");
        String responsabile = request.getParameter("responsabile");
        
        String testo = "UNIVERSITA' DEGLI STUDI DELL'AQUILA"+System.getProperty("line.separator")
                +"Dipartimento di INGEGNERIA E SCIENZE DELL'INFORMAZIONE E MATEMATICA"+System.getProperty("line.separator")
                +"SEGRETERIA AMMINISTRATIVA PER LA DIDATTICA"+System.getProperty("line.separator")
                +System.getProperty("line.separator")
                +"(da compilare a cura dell’Azienda)"+System.getProperty("line.separator")
                +"Ente/Azienda "+ragione_soc+System.getProperty("line.separator")
                +"Codice Fiscale Ente/Azienda "+partita_iva+System.getProperty("line.separator")
                +"Tirocinante:"+System.getProperty("line.separator")
                +"Cognome "+cognome_studente+" Nome "+nome_studente
                +System.getProperty("line.separator")
                +"(Codice identificativo tirocinio: Dipartimento, Corso di Laurea "
                + "o diploma, anno, n progressivo, altro)"+System.getProperty("line.separator")
                +condizione+System.getProperty("line.separator")
                +"Periodo del tirocinio:"+System.getProperty("line.separator")
                +"dal "+data_inizio+" al "+data_fine+System.getProperty("line.separator")
                +"Per un totale di "+ durata+System.getProperty("line.separator")
                +"Sede di svolgimento del tirocinio "+luogo
                +"Descrizione attività svolta:"+System.getProperty("line.separator")
                +request.getParameter("descrizione")+System.getProperty("line.separator")
                +"Si attesta che il/la Sig " +nome_studente+" "+cognome_studente+System.getProperty("line.separator")
                +"Ha effettuato i compiti affidatigli conseguendo il seguente risultato:"
                +System.getProperty("line.separator")
                +obiettivi+System.getProperty("line.separator")
                +"Data " + request.getParameter("data")+System.getProperty("line.separator")
                +"Il Tutor aziendale"+System.getProperty("line.separator")
                +responsabile;
        return testo;
    }

}
