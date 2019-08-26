/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import DAO.OffertaDAO;
import framework.result.HTMLResult;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "addOfferta", urlPatterns = {"/addOfferta"})
public class addOfferta extends HttpServlet {

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
        String titoloTirocinio = request.getParameter("titoloTirocinio");
        String descrizioneTirocinio = request.getParameter("descrizioneTirocinio");
        String luogo = request.getParameter("luogo");
        String orari = request.getParameter("orari");
        String durata = request.getParameter("durata");
        String obiettivi = request.getParameter("obiettivi");
        String modalita = request.getParameter("modalita");
        String rimborsi = request.getParameter("rimborsi");
        String idAzienda = request.getParameter("id");
        
        if(titoloTirocinio != null && descrizioneTirocinio != null && luogo != null &&
                orari != null && durata != null && obiettivi != null && modalita != null
                && rimborsi != null && idAzienda != null){
            aggiungiOfferta(request, response);
            response.sendRedirect("azienda.jsp");
        }else{
            String errore = "Campi non validi!";
            request.setAttribute("err", errore);
            RequestDispatcher rd = request.getRequestDispatcher("azienda.jsp");
            rd.forward(request, response);
        }
    }
    
    private void aggiungiOfferta(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException{
        String titoloTirocinio = request.getParameter("titoloTirocinio");
        String descrizioneTirocinio = request.getParameter("descrizioneTirocinio");
        String luogo = request.getParameter("luogo");
        String orari = request.getParameter("orari");
        String durata = request.getParameter("durata");
        String obiettivi = request.getParameter("obiettivi");
        String modalita = request.getParameter("modalita");
        String rimborsi = request.getParameter("rimborsi");
        String idAzienda = request.getParameter("id");
        
        boolean verifica = aggiungiOffertaDB(titoloTirocinio,descrizioneTirocinio,
                luogo,orari,durata,obiettivi,modalita,rimborsi,idAzienda);
        if(verifica){
            String notifica = "Offerta Registrata!";
            request.setAttribute("notify", notifica);
            RequestDispatcher rd = request.getRequestDispatcher("azienda.jsp");
            rd.forward(request, response);
        }else{
            String errore = "Errore durante il caricamento...";
            request.setAttribute("err", errore);
            RequestDispatcher rd = request.getRequestDispatcher("azienda.jsp");
            rd.forward(request, response);
        }
    }
    
    public static boolean aggiungiOffertaDB(String titoloTirocinio, String descrizioneTirocinio, 
            String luogo, String orari, String durata, String obiettivi, String modalita,
            String rimborsi, String idAzienda){
        ArrayList<Object> lista = new ArrayList<>();
        lista.add(titoloTirocinio);
        lista.add(descrizioneTirocinio);
        lista.add(luogo);
        lista.add(orari);
        lista.add(durata);
        lista.add(obiettivi);
        lista.add(modalita);
        lista.add(rimborsi);
        lista.add(idAzienda);
        boolean inserimentoOffertaDB = new OffertaDAO().insert(lista);
        return inserimentoOffertaDB;
    }
    
    private void action_error(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //assumiamo che l'eccezione sia passata tramite gli attributi della request
        //we assume that the exception has been passed using the request attributes
        Exception exception = (Exception) request.getAttribute("exception");
        String message;
        if (exception != null && exception.getMessage() != null) {
            message = exception.getMessage();
        } else {
            message = "Unknown error";
        }
        HTMLResult result = new HTMLResult(getServletContext());
        result.setTitle("ERROR");
        result.setBody("<p>" + message + "</p>");
        try {
            result.activate(request, response);
        } catch (IOException ex) {
            //if error page cannot be sent, try a standard HTTP error message
            //se non possiamo inviare la pagina di errore, proviamo un messaggio di errore HTTP standard
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, ex.getMessage());
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
