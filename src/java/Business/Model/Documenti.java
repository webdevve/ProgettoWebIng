/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Model;

/**
 *
 * @author Davide Simboli
 */
public class Documenti {
    private int id;
    private int id_studente;
    private int id_azienda;
    private String utente;
    private String doc;
    
    public Documenti(){
        
    }
    public Documenti(int id, int id_studente, int id_azienda, String utente, String doc){
        this.id = id;
        this.id_studente = id_studente;
        this.id_azienda = id_azienda;
        this.utente = utente;
        this.doc = doc;
    }
    
    public int getId(){
        return id;
    }
    public int getIdStudente(){
        return id_studente;
    }
    public void setIdStudente(int id_studente){
        this.id_studente = id_studente;
    }
    public int getIdAzienda(){
        return id_azienda;
    }
    public void setIdAzienda(int id_azienda){
        this.id_azienda = id_azienda;
    }
    public String getUtente(){
        return utente;
    }
    public void setUtente(String utente){
        this.utente = utente;
    }
    public String getDoc(){
        return doc;
    }
    public void setDoc(String doc){
        this.doc = doc;
    }
}
