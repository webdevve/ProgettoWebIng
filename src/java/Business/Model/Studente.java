/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Model;

import DAO.StudenteDAO;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Davide Simboli
 */
public class Studente {
    private static Studente instance;
    
    private int id;
    private String nome;
    private String cognome;
    private String luogo_nascita;
    private Date data_nascita;
    private String residenza;
    private String cf;
    private String telefono;
    private String corso_laurea;
    private String handicap; //enum
    private String email_studente;
    private String pwd_studente;
    
    private Studente(int id, String nome, String cognome, String luogo_nascita, 
            Date data_nascita, String residenza, String cf, String telefono,
            String corso_laurea, String handicap, String email_studente, String pwd_studente){
        this.id = id;
        this.nome = nome;
        this.cognome = cognome;
        this.luogo_nascita = luogo_nascita;
        this.data_nascita = data_nascita;
        this.residenza = residenza;
        this.cf = cf;
        this.telefono = telefono;
        this.corso_laurea = corso_laurea;
        this.handicap = handicap;
        this.email_studente = email_studente;
        this.pwd_studente = pwd_studente;
    }
    
    public int getID(){
        return id;
    }
    
    public void setNome(String NewNome){
        this.nome = NewNome;
    }
    
    public String getNome(){
        return nome;
    }
    
    public void setCognome(String NewCognome){
        this.cognome = NewCognome;
    }
    
    public String getCognome(){
        return cognome;
    }
    
    public void setLuogo_nascita(String NewLuogo_nascita){
        this.luogo_nascita = NewLuogo_nascita;
    }
    
    public String getLuogo_nascita(){
        return luogo_nascita;
    }
    
    public void setData_nascita(Date NewData_nascita){
        this.data_nascita = NewData_nascita;
    }
    
    public Date getData_nascita(){
        return data_nascita;
    }
    
    public void setResidenza(String NewResidenza){
        this.residenza = NewResidenza;
    }
    
    public String getResidenza(){
        return residenza;
    }
    
    public void setCF(String NewCF){
        this.cf = NewCF;
    }
    
    public String getCF(){
        return cf;
    }
    
    public void setTelefono(String NewTelefono){
        this.telefono = NewTelefono;
    }
    
    public String getTelefono(){
        return telefono;
    }
    
    public void setCorso_laurea(String NewCorso_laurea){
        this.corso_laurea = NewCorso_laurea;
    }
    
    public String getCorso_laurea(){
        return corso_laurea;
    }
    
    public void setHandicap(String NewHandicap){
        this.handicap = NewHandicap;
    }
    
    public String getHandicap(){
        return handicap;
    }
    
    public void setEmail_studente(String NewEmail_studente){
        this.email_studente = NewEmail_studente;
    }
    
    public String getEmail_studente(){
        return email_studente;
    }
    
    public void setPwd_studente(String NewPwd_studente){
        this.pwd_studente = NewPwd_studente;
    }
    
    public String getPwd_studente(){
        return pwd_studente;
    }
    
    public static Studente CercaStudente(String email, String password){
        System.out.println("Cerco lo studente (model)");
        ArrayList<Object> lista = new ArrayList();
        lista.add(email);
        lista.add(password);
        Studente studente = (Studente) new StudenteDAO().retrieve(lista);
        return studente;
    }
    
    public static final synchronized Studente setInstance(int id, String nome, String cognome, String luogo_nascita, 
            Date data_nascita,  String residenza, String cf, String telefono, String corso_laurea,
            String handicap, String email_studente, String pwd_studente) {
	if ( instance == null ) {
            instance = new Studente(id, nome, cognome, luogo_nascita, data_nascita, residenza,
            cf, telefono, corso_laurea, handicap, email_studente, pwd_studente);
	}
	return instance;
    }
    
}
