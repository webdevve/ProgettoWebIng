/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import Business.Model.Studente;
import DAO.StudenteDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Davide Simboli
 */
@WebServlet(name = "aderisciOfferta", urlPatterns = {"/aderisciOfferta"})
public class aderisciOfferta extends HttpServlet {

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
        int offerta =Integer.parseInt(request.getParameter("idOfferta"));
        request.setAttribute("id", offerta);
        String str = request.getParameter("str");
        if(!"null".equals(str)){
            Studente studente = (Studente) new StudenteDAO().getStudent(str);
            String nome = studente.getNome();
            String cognome = studente.getCognome();
            String nomeCognome = nome+" "+cognome;
            request.setAttribute("nomeCognome", nomeCognome);
            request.setAttribute("nomeStudente", nome);
            request.setAttribute("luogoNascita", studente.getLuogo_nascita());
            request.setAttribute("dataNascita", studente.getData_nascita());
            request.setAttribute("residenza", studente.getResidenza());
            request.setAttribute("cf", studente.getCF());
            request.setAttribute("telefonoStudente", studente.getTelefono());
            //request.setAttribute("provNascita", studente.getProvinciaNascita);
        }
        //request.setAttribute("luogoNascita", studente.getLuogo_nascita());
        RequestDispatcher rd = request.getRequestDispatcher("aderisciOfferta.jsp");
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
