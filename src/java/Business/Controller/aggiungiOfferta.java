/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import static Business.Controller.registrazioneStudente.inserimentoStudenteDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import Business.Model.Offerta;
import DAO.OffertaDAO;
import DAO.StudenteDAO;
import framework.result.HTMLResult;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alesi
 */
@WebServlet(name = "aggiungiOfferta", urlPatterns = {"/aggiungiOfferta"})
public class aggiungiOfferta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String titolo = request.getParameter("titolo");
        String descrizione = request.getParameter("descrizione");
        String luogo = request.getParameter("luogo");
        String orari = request.getParameter("orari");
        String durata = request.getParameter("durata");
        String obiettivi = request.getParameter("obiettivi");
        String modalita= request.getParameter("modalita");
        String rimborsi = request.getParameter("rimborsi");
        
        try{
            if(titolo.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(descrizione.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(luogo.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
        
            if(orari.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
           
            
            if(durata.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            
            if(obiettivi.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            
            if(modalita.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(rimborsi.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            } else {
                aggiungi(request, response);
            }
            
            
            
            System.out.println(titolo);
            System.out.println(descrizione);
            System.out.println(luogo);
            System.out.println(orari);
            System.out.println(durata);
            System.out.println(obiettivi);
            System.out.println(modalita);
            System.out.println(rimborsi);
            
            
            
        
        }catch(IOException ex){
            request.setAttribute("exception", ex);
            action_error(request, response);
        }
    
    
    }
    
    
    
    private void aggiungi(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        System.out.println("Si procede con la registrazione...");
        String titolo = request.getParameter("titolo");
        String descrizione = request.getParameter("descrizione");
        String luogo = request.getParameter("luogo");
        String orari = request.getParameter("orari");
        String durata = request.getParameter("durata");
        String obiettivi = request.getParameter("obiettivi");
        String modalita= request.getParameter("modalita");
        String rimborsi = request.getParameter("rimborsi");
        int id_azienda=2;
        
        
        boolean inserimentoOfferta = inserimentoOffertaDB(titolo, 
                    descrizione, luogo, orari, durata, obiettivi,         
                    modalita, rimborsi, id_azienda);
            if(inserimentoOfferta){
                System.out.println("Registrazione offerta avvenuta con successo");
                response.sendRedirect("index.jsp");
            }
    }
    
    public static boolean inserimentoOffertaDB(String titolo, String descrizione,
            String luogo, String orari, String durata, String obiettivi, String modalita,
            String rimborsi, int id_azienda){
        System.out.println("Procedo all'inserimento (model)");
        ArrayList<Object> lista = new ArrayList<>();
        lista.add(titolo);
        lista.add(descrizione);
        lista.add(luogo);
        lista.add(orari);
        lista.add(durata);
        lista.add(obiettivi);
        lista.add(modalita);
        lista.add(rimborsi);
        lista.add(id_azienda);
        
        
        boolean inserimentoOFdb = new OffertaDAO().insert(lista);
        return inserimentoOFdb;
    }
        
    
    private void errore_compilazione(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        //System.out.println("Errore");
        RequestDispatcher rd = request.getRequestDispatcher("aggiungiOfferta.jsp");
        rd.forward(request, response);
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
    
    
}
