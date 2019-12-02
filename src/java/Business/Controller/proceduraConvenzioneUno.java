/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import static Business.Controller.generateTirociniPDF.generaPdfUno;
import Business.Model.Candidatura;
import Business.Model.Studente;
import DAO.CandidaturaDAO;
import DAO.StudenteDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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
@WebServlet(name = "proceduraConvenzioneUno", urlPatterns = {"/proceduraConvenzioneUno"})
public class proceduraConvenzioneUno extends HttpServlet {

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
        String[] condizione = request.getParameterValues("condizione");
        List list = Arrays.asList(condizione);
        ArrayList<attualeCondizione> listCondizione = new ArrayList<>();
        String condizioneAttualeStudente = "";
        for(int i = 0; i<list.size(); i++){
            if(list.get(i).equals("laureando")){
                attualeCondizione att = new attualeCondizione("laureando", request.getParameter("laureando"));
                listCondizione.add(att);
            }
            if(list.get(i).equals("diplomato")){
                attualeCondizione att = new attualeCondizione("diplomato", request.getParameter("diplomato"));
                listCondizione.add(att);
            }
            if(list.get(i).equals("laureato")){
                attualeCondizione att = new attualeCondizione("laureato", request.getParameter("laureato"));
                listCondizione.add(att);
            }
            if(list.get(i).equals("dottorato")){
                attualeCondizione att = new attualeCondizione("dottorato", request.getParameter("dottorato"));
                listCondizione.add(att);
            }
            if(list.get(i).equals("scuola")){
                attualeCondizione att = new attualeCondizione("scuola", request.getParameter("scuola"));
                listCondizione.add(att);
            }
        }
        for(attualeCondizione x : listCondizione){
            condizioneAttualeStudente += x.getCheck() + ": " + x.getValue() + " ";
        }
        String handicap = request.getParameter("handicap");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String cfu = request.getParameter("cfu");
        String tutoreUniversitario = request.getParameter("tutoreUniversitario");
        String telefonoTutoreUni = request.getParameter("telefonoTutoreUni");
        String emailTutoreUni = request.getParameter("emailTutoreUni");
        String dataRichiesta = request.getParameter("today");
        String email_responsabile_azienda = request.getParameter("emailAz");
        String emailStudente = request.getParameter("emailStudente");
        String idOfferta = request.getParameter("idOfferta");
        String ragioneSociale = request.getParameter("ragioneSociale");
        String nomeStudente = request.getParameter("nomeStudente");
        String titoloOfferta = request.getParameter("titoloOfferta");
        String luogoNascita = request.getParameter("luogoNascita");
        String dataNascita = request.getParameter("dataNascita");
        String residenza = request.getParameter("residenza");
        String telefonoStudente = request.getParameter("telefonoStudente");
        String cf = request.getParameter("cf");
        String luogoTirocinio = request.getParameter("luogoTirocinio");
        String ambito = request.getParameter("ambito");
        String orari = request.getParameter("orari");
        String ore = request.getParameter("ore");
        String tutoreAziendale = request.getParameter("tutoreAziendale");
        String telefonoTutoreAz = request.getParameter("telefonoTutoreAz");
        String email_responsabile = request.getParameter("email_responsabile");
        String obiettivi = request.getParameter("obiettivi");
        String modalita = request.getParameter("modalita");
        String rimborsi = request.getParameter("rimborsi");
        
        Candidatura c = new Candidatura(condizioneAttualeStudente,  handicap, startDate, endDate, cfu, 
                tutoreUniversitario, telefonoTutoreUni, emailTutoreUni, dataRichiesta, email_responsabile_azienda, 
                emailStudente, idOfferta, ragioneSociale, nomeStudente, titoloOfferta, luogoNascita, dataNascita, 
                residenza, telefonoStudente, cf, luogoTirocinio, ambito, orari, ore, tutoreAziendale,
                telefonoTutoreAz, email_responsabile, obiettivi, modalita, rimborsi);
        
        generateEmail.emailRichiestaTirocinio(email_responsabile_azienda, c, "Azienda");
        generateEmail.emailRichiestaTirocinio(emailTutoreUni, c, "Università");
        Studente studente = (Studente) new StudenteDAO().getStudent(emailStudente);
        int idStudente = studente.getID();
        String testoDOC = generaPdfUno(c);
        boolean insert = inserisciCandidaturaDB(c, idStudente, testoDOC);
        
        if(insert){
            String notifica = "La tua richiesta è stata inviata!";
            request.setAttribute("notify", notifica);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }else{
            String notifica = "C'è stato un errore durante la richiesta!";
            request.setAttribute("err", notifica);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        
    }
    
    public boolean inserisciCandidaturaDB(Candidatura c, int idStudente, String testoDOC){
        ArrayList<Object> lista = new ArrayList<>();
        lista.add(idStudente);
        lista.add(c.getIdOfferta());
        lista.add(c.getStartDate());
        lista.add(c.getEndDate());
        lista.add(c.getCfu());
        lista.add(c.getTutoreUniversitario());
        lista.add(c.getTelefonoTutoreUni());
        lista.add(c.getEmailTutoreUni());
        lista.add(testoDOC);
        lista.add(c.getCondizioneAttualeStudente());
        
        boolean inserimentoCdb = new CandidaturaDAO().insert(lista);
        return inserimentoCdb;
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
