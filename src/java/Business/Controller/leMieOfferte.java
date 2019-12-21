/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import DAO.OffertaDAO;
import framework.result.HTMLResult;
import java.io.IOException;
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
@WebServlet(name = "leMieOfferte", urlPatterns = {"/leMieOfferte"})
public class leMieOfferte extends HttpServlet {

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
        if(stato.equals("chiudi")){
            chiudiOfferta(request, response);
        }
        if(stato.equals("apri")){
            apriOfferta(request, response);
        }
        if(stato.equals("dettaglio")){
            dettaglioOfferta(request, response);
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

    private void chiudiOfferta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ID = request.getParameter("id");
        String stato = "chiusa";
        int id = Integer.parseInt(ID);
        try{
            boolean Approvata = new OffertaDAO().chiudiApriOfferta(id, stato);
            if(Approvata){
                String info = "ATTENZIONE! L'offerta n° "+ ID + " è stata chiusa.";
                request.setAttribute("notify", info);
                RequestDispatcher rd = request.getRequestDispatcher("leMieOfferte.jsp");
                rd.forward(request, response);
            }
        }catch(IOException e){
            request.setAttribute("exception", e);
            action_error(request, response);
        }
    }
    
    private void apriOfferta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ID = request.getParameter("id");
        String stato = "aperta";
        int id = Integer.parseInt(ID);
        try{
            boolean Approvata = new OffertaDAO().chiudiApriOfferta(id, stato);
            if(Approvata){
                String info = "ATTENZIONE! L'offerta n° "+ ID + " è stata aperta.";
                request.setAttribute("notify", info);
                RequestDispatcher rd = request.getRequestDispatcher("offerteChiuse.jsp");
                rd.forward(request, response);
            }
        }catch(IOException e){
            request.setAttribute("exception", e);
            action_error(request, response);
        }
    }

    private void dettaglioOfferta(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id_offerta = request.getParameter("id");
        request.setAttribute("id_offerta", id_offerta);
        RequestDispatcher rd = request.getRequestDispatcher("listastudentiofferta.jsp");
        rd.forward(request, response);
    }

}
