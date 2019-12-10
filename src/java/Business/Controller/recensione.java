/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import DAO.RecensioneDAO;
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
@WebServlet(name = "recensione", urlPatterns = {"/recensione"})
public class recensione extends HttpServlet {

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
        String rating = request.getParameter("rating");
        int id_studente = Integer.parseInt(request.getParameter("id_studente"));
        int id_azienda = Integer.parseInt(request.getParameter("id_azienda"));
        int id_candidatura = Integer.parseInt(request.getParameter("id_candidatura"));
        double value = Double.parseDouble(rating);
        ArrayList<Object> list = new ArrayList<>();
        list.add(id_studente);
        list.add(id_azienda);
        list.add(value);
        boolean recensione = new RecensioneDAO().insert(list);
        boolean recensito = RecensioneDAO.setRecensito(id_candidatura);
        if(recensione && recensito){
            String notifica = "Recensione avvenuta con successo!";
            request.setAttribute("notify", notifica);
            RequestDispatcher rd = request.getRequestDispatcher("recensioni.jsp");
            rd.forward(request, response);
        }else{
            String errore = "C'è stato un problema durante la recensione!";
            request.setAttribute("err", errore);
            RequestDispatcher rd = request.getRequestDispatcher("recensioni.jsp");
            rd.forward(request, response);
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
