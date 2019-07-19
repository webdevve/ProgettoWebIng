/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

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
@WebServlet(name = "registrazioneAzienda", urlPatterns = {"/registrazioneAzienda"})
public class registrazioneAzienda extends HttpServlet {

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
        String ragione_sociale = request.getParameter("ragione_sociale");
        String via = request.getParameter("via");
        String città = request.getParameter("citta");
        String provincia = request.getParameter("provincia");
        String cap = request.getParameter("cap");
        String partita_iva = request.getParameter("partita_iva");
        String codice_fiscale = request.getParameter("codice_fiscale");
        String nome_legale_rappr = request.getParameter("nome_legale_rappr");
        String cognome_legale_rappr = request.getParameter("cognome_legale_rappr");
        String nome_responsabile = request.getParameter("nome_responsabile");
        String cognome_responsabile = request.getParameter("cognome_responsabile");
        String telefono_responsabile = request.getParameter("telefono_responsabile");
        String email_responsabile = request.getParameter("email_responsabile");
        String foro = request.getParameter("foro");
        String email_azienda = request.getParameter("email_azienda");
        String pwd = request.getParameter("pwd");
        String pwd_azienda = request.getParameter("pwd_azienda");
        
        String indirizzo, sp;
        sp = ", ";
        indirizzo = via + sp + città + sp + provincia + sp + cap;
        
        if(ragione_sociale.equals("")){
            String errore = "Compilare tutti i campi!";
            request.setAttribute("err", errore);
            errore_compilazione(request, response);
        }
        
        System.out.println(indirizzo);
        
    }
    
    private void errore_compilazione(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        //System.out.println("Errore");
        RequestDispatcher rd = request.getRequestDispatcher("registrazioneAzienda.jsp");
        rd.forward(request, response);
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
