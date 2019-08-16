/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import Business.Model.Amministratore;
import Business.Model.Azienda;
import Business.Model.Studente;
import DAO.AziendaDAO;
import DAO.StudenteDAO;
import framework.result.HTMLResult;
import java.io.IOException;
import java.util.ArrayList;
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
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

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
        try{
            if(request.getParameter("username") != null & request.getParameter("password") != null){
                //System.out.println("I parametri della login non sono vuoti");
                autenticazione(request, response);
            } else {
                String errore = "Inserire Username e password!";
                request.setAttribute("err", errore);
                errore_autenticazione(request, response);
            }
        } catch (IOException ex){
            request.setAttribute("exception", ex);
            action_error(request, response);
        }
    }
    
    private void autenticazione(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException{
        System.out.println("Si procede con l'autenticazione...");
        String email = request.getParameter("username");
        String pwd = request.getParameter("password");
        boolean verifica = verificacredenziali(email, pwd);
        if(verifica){
            System.out.println("L'utente è nel DB, accesso eseguito");
            sessione(request, response);
        } else{
            //System.out.println("Username o Password sbagliata!");
            String errore = "Username o Password sbagliata!";
            request.setAttribute("err", errore);
            errore_autenticazione(request, response);
        }
    }
    
    private void sessione(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException{
        String email = request.getParameter("username");
        HttpSession session = request.getSession();
        System.out.println(session);
        session.setAttribute("username", email);
        String str = session.getAttribute("username").toString();
        System.out.println(str + " è in sessione!");
        request.setAttribute("name", str);
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }
    
    private void errore_autenticazione(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        //System.out.println("Errore");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }
    
    public static boolean verificacredenziali(String email, String password){
        String e = email;
        String p = password;
        if(e.equals("") || p.equals("")){ //controllo ridondante
            System.out.println("Inserire username e pwd");
            return false;
        }
        //cerca utente nel db con le credenziali inserite dall'utente
        Amministratore amministratore = Amministratore.CercaAmministratore(e, p);
        if(amministratore != null){
            return true;
        }else{
            System.out.println("Non sei un Amministratore.");
            Azienda azienda = CercaAzienda(e, p);
            if(azienda != null){
                return true;
            }else{
                System.out.println("Non sei un Azienda.");
                Studente studente = CercaStudente(e, p);
                if(studente != null){
                    return true;
                }else{
                    System.out.println("Non sei uno Studente.");
                    System.out.println("Email o Password errati");
                    return false;
                }
            }
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
    
    
     public static Azienda CercaAzienda(String email, String password){
        System.out.println("Cerco l'azienda (model)");
        ArrayList<Object> lista = new ArrayList();
        lista.add(email);
        lista.add(password);
        Azienda azienda = (Azienda) new AziendaDAO().retrieve(lista);
        return azienda;
    }
    
    
    public static Studente CercaStudente(String email, String password){
        System.out.println("Cerco lo studente (model)");
        ArrayList<Object> lista = new ArrayList();
        lista.add(email);
        lista.add(password);
        Studente studente = (Studente) new StudenteDAO().retrieve(lista);
        return studente;
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
        System.out.println("La servlet ha chiamato il metodo GET");
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
        System.out.println("La servlet ha chiamato il metodo POST");
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
