/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import DAO.CandidaturaDAO;
import java.io.File;
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
@WebServlet(name = "azioniTirocinio", urlPatterns = {"/azioniTirocinio"})
public class azioniTirocinio extends HttpServlet {

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
        String action = request.getParameter("stato");
        String file = request.getParameter("myFile");
        if(action.equals("confermaDocumento") && !file.isEmpty()){
            confermaTirocinio(request, response);
        }else{
            String errore = "Selezionare un File!";
            request.setAttribute("err", errore);
            RequestDispatcher rd = request.getRequestDispatcher("confermaConvenzione.jsp");
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

    private void confermaTirocinio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_candidatura = request.getParameter("id");
        String file = request.getParameter("myFile");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String titolo = request.getParameter("titolo");
        String email_studente = request.getParameter("email_studente");
        String studente = nome+cognome;
        File f = new File(file);
        String fileName = f.getName();
        ArrayList<Object> list = new ArrayList<>();
        list.add(fileName);
        list.add(id_candidatura);
        boolean conferma = CandidaturaDAO.confermaTirocinio(list);
        if(conferma){
            generateEmail.emailConfermaTirocinio(email_studente, studente, titolo);
            String notifica = "E' stato attivato il tirocinio "+titolo+" per lo studente "+ nome +" "+cognome;
            request.setAttribute("notify", notifica);
            RequestDispatcher rd = request.getRequestDispatcher("leMieOfferte.jsp");
            rd.forward(request, response);
        }else{
            String errore = "ERRORE: tirocinio non attivato."; 
            request.setAttribute("err", errore);
            RequestDispatcher rd = request.getRequestDispatcher("leMieOfferte.jsp");
            rd.forward(request, response);
        }
    }

}
