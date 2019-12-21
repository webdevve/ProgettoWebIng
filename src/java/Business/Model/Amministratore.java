/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Model;

import DAO.AmministratoreDAO;
import java.util.ArrayList;

/**
 *
 * @author Davide Simboli
 */
public class Amministratore {
    private static Amministratore instance;
    
    private int id;
    private String nome;
    private String cognome;
    private String email;
    private String password;
    
    private Amministratore(int id, String nome, String cognome, String email, String password){
        this.id = id;
        this.nome = nome;
        this.cognome = cognome;
        this.email = email;
        this.password = password;
    }
    
    public int getID(){
        return id;
    }
    
    public void setNome(String NuovoNome){
        this.nome = NuovoNome;
    }
    
    public String getNome(){
        return nome;
    }
    
    public void setCognome(String NuovoCognome){
        this.cognome = NuovoCognome;
    }
    
    public String getCognome(){
        return cognome;
    }
    
    public void setEmail(String NuovaEmail){
        this.email = NuovaEmail;
    }
    
    public String getEmail(){
        return email;
    }
    
    public void setPassword(String NuovaPassword){
        this.password = NuovaPassword;
    }
    
    public String getPassword(){
        return password;
    }
    
    public static Amministratore CercaAmministratore(String email, String password){
        System.out.println("Cerco l'admin (model)");
        ArrayList<Object> lista = new ArrayList();
        lista.add(email);
        lista.add(password);
        Amministratore admin = (Amministratore) new AmministratoreDAO().retrieve(lista);
        return admin;
    }
    
    public static final synchronized Amministratore setInstance(int id, String nome, String cognome, String email, String password) {
	if ( instance == null ) {
            instance = new Amministratore(id, nome, cognome, email, password);
	}
	return instance;
    }
}
