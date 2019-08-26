/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import DAO.AziendaDAO;
import framework.result.HTMLResult;
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
@WebServlet(name = "admin", urlPatterns = {"/admin"})
public class admin extends HttpServlet {

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
        try{
            if(stato.equals("approvato")){
                approvaAzienda(request, response);
                generaDocumentoConvenzione(request, response);
            }else{
                disapprovaAzienda(request, response);
                System.out.println("L'azienda deve essere disapprovata");
            }
        }catch(IOException e){
            request.setAttribute("exception", e);
            action_error(request, response);
        }
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
    
    protected void generaDocumentoConvenzione(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        try{
            String stato = request.getParameter("stato");
            String id = request.getParameter("id");
            String ragioneSociale = request.getParameter("ragioneSociale");
            String nomeResponsabile = request.getParameter("nomeResponsabile");
            String cognomeResponsabile = request.getParameter("cognomeResponsabile");
            String rappresentante = nomeResponsabile + " " + cognomeResponsabile;
            String sedeLegale = request.getParameter("sedeLegale");
            String partitaIva = request.getParameter("partita_iva");
            String descrizione = request.getParameter("descrizione");
            String ambito = request.getParameter("ambito");
            String nome_legale_rappr = request.getParameter("nome_legale_rappr");
            String cognome_legale_rappr = request.getParameter("cognome_legale_rappr");
            String legaleRappresentante = nome_legale_rappr + " " + cognome_legale_rappr;

            String info = "L'azienda n° " + id + " è stata " + stato;

            request.setAttribute("getRagioneSociale", ragioneSociale);
            request.setAttribute("getRappresentante", rappresentante);
            request.setAttribute("getSedeLegale", sedeLegale);
            request.setAttribute("getPartitaIva", partitaIva);
            request.setAttribute("getDescrizione", descrizione);
            request.setAttribute("getAmbito", ambito);
            request.setAttribute("getLegaleRappresentante", legaleRappresentante);

            request.setAttribute("getInfo", info);
            RequestDispatcher rd = request.getRequestDispatcher("documentoConvenzione.jsp");
            rd.forward(request, response);
        }catch(IOException e){
            request.setAttribute("exception", e);
            action_error(request, response);
        }
    }
    
    protected void disapprovaAzienda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        //System.out.println("Si procede con la disapprovazione...");
        try{
            String email_azienda = request.getParameter("email_azienda");
            String ragioneSociale = request.getParameter("ragioneSociale");
            boolean disapprova = disapprovaConvenzione(email_azienda);
            if(disapprova){
                //System.out.println("L'azienda è stata disapprovata");
                generateEmail.emailDisapprovazione(email_azienda);
                String errore = ragioneSociale + " E' stata DISAPPROVATA!\n"
                        + "email inviata a " + email_azienda;
                request.setAttribute("err", errore);
                RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                rd.forward(request, response);
            }
        }catch(IOException e){
            request.setAttribute("exception", e);
            action_error(request, response);
        }
    }
    
    protected void approvaAzienda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        try{
            String email_azienda = request.getParameter("email_azienda");
             
            approvaConvenzione(email_azienda);
        }catch(Exception e){
            request.setAttribute("exception", e);
            action_error(request, response);
        }
    }
    
    public static boolean disapprovaConvenzione(String email){
        //System.out.println("passo i parametri al DAO");
        ArrayList<Object> lista = new ArrayList<>();
        lista.add(email);
        boolean nonApprovata = new AziendaDAO().disapprovaConvenzione(lista);
        return nonApprovata;
    }
    
    public static boolean approvaConvenzione(String email){
        //System.out.println("passo i parametri al DAO");
        ArrayList<Object> lista = new ArrayList<>();
        lista.add(email);
        boolean Approvata = new AziendaDAO().approvaConvenzione(lista);
        return Approvata;
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
