/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import Business.Model.Offerta;
import DAO.OffertaDAO;
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
        
        System.out.println(titolo);
            System.out.println(descrizione);
            System.out.println(luogo);
            System.out.println(orari);
            System.out.println(durata);
            System.out.println(obiettivi);
            System.out.println(modalita);
            System.out.println(rimborsi);
            
    
    }
    
}
