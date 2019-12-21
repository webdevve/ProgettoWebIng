/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import DAO.AziendaDAO;
import java.io.File;
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
@WebServlet(name = "confermaConvenzione", urlPatterns = {"/confermaConvenzione"})
public class confermaConvenzione extends HttpServlet {

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
            confermaDocumento(request, response);
        }else{
            String errore = "Selezionare un File!";
            request.setAttribute("err", errore);
            RequestDispatcher rd = request.getRequestDispatcher("confermaConvenzione.jsp");
            rd.forward(request, response);
        }
        
    }
    
    protected void confermaDocumento(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String email_azienda = request.getParameter("email_azienda");
        String ragioneSociale = request.getParameter("ragioneSociale");
        String file = request.getParameter("myFile");
        File f = new File(file);
        String fileName = f.getName();
        System.out.println("File: "+ fileName);
        ArrayList<Object> lista = new ArrayList<>();
        lista.add(fileName);
        lista.add(email_azienda);
        boolean convenzioneDOC = new AziendaDAO().convenzionaAziendaDOC(lista);
        if(convenzioneDOC){
                generateEmail.emailApprovazione(email_azienda);
                String notifica = "L'Azienda "+ragioneSociale+" e' stata convenzionata!\n"
                        + "Email inviata a "+ email_azienda;
                request.setAttribute("notify", notifica);
                RequestDispatcher rd = request.getRequestDispatcher("confermaConvenzione.jsp");
                rd.forward(request, response);
        }else{
            String errore = "Errore durante la convalida.";
            request.setAttribute("err", errore);
            RequestDispatcher rd = request.getRequestDispatcher("confermaConvenzione.jsp");
            rd.forward(request, response);
        }
        response.sendRedirect("confermaConvenzione.jsp");
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
