/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;
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
        
        String id = request.getParameter("id");
        String ragioneSociale = request.getParameter("ragioneSociale");
        String nomeResponsabile = request.getParameter("nomeResponsabile");
        String cognomeResponsabile = request.getParameter("cognomeResponsabile");
        String rappresentante = nomeResponsabile + " " + cognomeResponsabile;
        String sedeLegale = request.getParameter("sedeLegale");
        String partitaIva = request.getParameter("partita_iva");
        String descrizione = request.getParameter("descrizione");
        String ambito = request.getParameter("ambito");
        
        String info = "L'azienda n° " + id + " è stata " + stato;
        
        request.setAttribute("getRagioneSociale", ragioneSociale);
        request.setAttribute("getRappresentante", rappresentante);
        request.setAttribute("getSedeLegale", sedeLegale);
        request.setAttribute("getPartitaIva", partitaIva);
        request.setAttribute("getDescrizione", descrizione);
        request.setAttribute("getAmbito", ambito);
        
        request.setAttribute("getInfo", info);
        RequestDispatcher rd = request.getRequestDispatcher("documentoConvenzione.jsp");
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
