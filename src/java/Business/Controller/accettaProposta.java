/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import static Business.Controller.generateTirociniPDF.generaPdfUno;
import Business.Model.Candidatura;
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
@WebServlet(name = "accettaProposta", urlPatterns = {"/accettaProposta"})
public class accettaProposta extends HttpServlet {

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
        String stato = request.getParameter("stato");
        if(stato.equals("approva")){
            String id_candidatura = request.getParameter("id");
            String id_offerta = request.getParameter("id_offerta");
            request.setAttribute("id_candidatura", id_candidatura);
            request.setAttribute("id_offerta", id_offerta);
            RequestDispatcher rd = request.getRequestDispatcher("docTirocinio.jsp");
            rd.forward(request, response);
        }
        if(stato.equals("proposta")){
            iniziaTirocinio(request, response);
        }
        if(stato.equals("respingi")){
            respingiCandidatura(request, response);
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

    private void iniziaTirocinio(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String id_offerta = request.getParameter("id_offerta");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String id_candidatura = request.getParameter("id_candidatura");
        String id_studente = request.getParameter("id_studente");
        String id_azienda = request.getParameter("id_azienda");
        String titolo ="Documento Formativo - "+ request.getParameter("titolo");
        String doc = officialDocTirocinio(request,response);
        ArrayList<Object> list = new ArrayList<>();
        list.add(startDate);
        list.add(endDate);
        list.add(id_candidatura);
        
        boolean startTirocinio = CandidaturaDAO.approvaTirocinio(list);
        
        ArrayList<Object> stud = new ArrayList<>();
        stud.add(id_studente);
        stud.add(id_azienda);
        stud.add("studente");
        stud.add(doc);
        stud.add(titolo);
        ArrayList<Object> az = new ArrayList<>();
        az.add(id_studente);
        az.add(id_azienda);
        az.add("azienda");
        az.add(doc);
        az.add(titolo);
        if(startTirocinio){
            boolean registraDocStud = new DocumentiDAO().insert(stud);
            boolean registraDocAz = new DocumentiDAO().insert(az);
            String notifica = "Proposta di tirocinio accettata, documento in Download...";
            request.setAttribute("notify", notifica);
            request.setAttribute("id_offerta", id_offerta);
            RequestDispatcher rd = request.getRequestDispatcher("listastudentiofferta.jsp");
            rd.forward(request, response);
        }else{
            String errore = "Si è verificato un errore";
            request.setAttribute("err", errore);
            request.setAttribute("id_offerta", id_offerta);
            RequestDispatcher rd = request.getRequestDispatcher("listastudentiofferta.jsp");
            rd.forward(request, response);
        }
    }

    private String officialDocTirocinio(HttpServletRequest request, HttpServletResponse response) {
        String nomeCognome = request.getParameter("nomeCognome");
        String luogoNascita = request.getParameter("luogoNascita");
        String dataNascita = request.getParameter("dataNascita");
        String residenza = request.getParameter("residenza");
        String cf = request.getParameter("cf");
        String telefonoStudente = request.getParameter("telefonoStudente");
        String condizione = request.getParameter("condizione");
        String handicap = request.getParameter("handicap");
        String ragioneSociale = request.getParameter("ragioneSociale");
        String Luogo = request.getParameter("Luogo");
        String ambito = request.getParameter("ambito");
        String orari = request.getParameter("orari");
        String ore = request.getParameter("ore");
        String cfu = request.getParameter("cfu");
        String tutoreAziendale = request.getParameter("tutoreAziendale");
        String telefonoTutoreAz = request.getParameter("telefonoTutoreAz");
        String email_responsabile = request.getParameter("email_responsabile");
        String obiettivi = request.getParameter("obiettivi");
        String modalita = request.getParameter("modalita");
        String rimborsi = request.getParameter("rimborsi");
        String tutoreUniversitario = request.getParameter("tutoreUniversitario");
        String emailTutoreUni = request.getParameter("emailTutoreUni");
        String telefonoTutoreUni = request.getParameter("telefonoTutoreUni");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        Candidatura c = new Candidatura();
        c.setNomeStudente(nomeCognome);
        c.setLuogoNascita(luogoNascita);
        c.setDataNascita(dataNascita);
        c.setResidenza(residenza);
        c.setCf(cf);
        c.setTelefonoStudente(telefonoStudente);
        c.setCondizioneAttualeStudente(condizione);
        c.setHandicap(handicap);
        c.setRagioneSociale(ragioneSociale);
        c.setLuogoTirocinio(Luogo);
        c.setAmbito(ambito);
        c.setOrari(orari);
        c.setOre(ore);
        c.setCfu(cfu);
        c.setTutoreAziendale(tutoreAziendale);
        c.setTelefonoTutAz(telefonoTutoreAz);
        c.setEmail_responsabile_azienda(email_responsabile);
        c.setObiettivi(obiettivi);
        c.setModalita(modalita);
        c.setRimborsi(rimborsi);
        c.setTutoreUniversitario(tutoreUniversitario);
        c.setEmailTutoreUni(emailTutoreUni);
        c.setTelefonoTutoreUni(telefonoTutoreUni);
        c.setStartDate(startDate);
        c.setEndDate(endDate);
        String testo = generaPdfUno(c, true);
        return testo;
    }

    private void respingiCandidatura(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_candidatura = request.getParameter("id");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        boolean respingi = CandidaturaDAO.respingiCandidatura(id_candidatura);
        if(respingi){
            String notifica = "La candidatura di "+nome+" "+cognome+" è stata respinta.";
            request.setAttribute("notify", notifica);
            RequestDispatcher rd = request.getRequestDispatcher("listastudentiofferta.jsp");
            rd.forward(request, response);
        }else{
            String errore = "Si è verificato un errore";
            request.setAttribute("err", errore);
            RequestDispatcher rd = request.getRequestDispatcher("listastudentiofferta.jsp");
            rd.forward(request, response);
        }
    }

}
