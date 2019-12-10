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
public class Recensione {
    private static Recensione instance;
    private int id;
    private int id_studente;
    private int id_azienda;
    private double valutazione;
    
    public Recensione(){
        
    }
    public Recensione(int id, int id_studente, int id_azienda, double valutazione){
        this.id = id;
        this.id_studente = id_studente;
        this.id_azienda = id_azienda;
        this.valutazione = valutazione;
    }
    
    public int getId(){
        return id;
    }
    public void setIdStudente(int id_studente){
        this.id_studente = id_studente;
    }
    public int getIdStudente(){
        return id_studente;
    }
    public void setIdAzienda(int id_azienda){
        this.id_azienda = id_azienda;
    }
    public int getIdAzienda(){
        return id_azienda;
    }
    public void setValutazione(double valutazione){
        this.valutazione = valutazione;
    }
    public double getValutazione(){
        return valutazione;
    }
    
    public static final synchronized Recensione setInstance(int id, int id_studente, int id_azienda, double valutazione){
        if(instance==null){
            instance = new Recensione(id, id_studente, id_azienda, valutazione);
        }
        return instance;
    }
}
