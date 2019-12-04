/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import Business.Model.Candidatura;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

/**
 *
 * @author Davide Simboli
 */
public class generateEmail {
    public static void emailDisapprovazione(String email_azienda)throws IOException{
        String userprofile = System.getenv("USERPROFILE");
        //System.out.println("Profilo: "+userprofile);
        Date data = new Date();
        File file = new File(userprofile + "\\Downloads/disapprovazione-"+email_azienda+".txt");
        if(file.exists()){
            System.out.println("il file esiste");
        }else if(file.createNewFile()){
            FileWriter fw = new FileWriter(file);
            fw.write("TO: " + email_azienda + System.getProperty("line.separator"));
            fw.write("FROM: InternshipTutor" + System.getProperty("line.separator"));
            fw.write("OGGETTO: Disapprovazione" + System.getProperty("line.separator")+System.getProperty("line.separator"));
            fw.write("La sua azienda non è stata convenzionata, ci scusiamo per l'inconveniente.");
            fw.write(System.getProperty("line.separator")+System.getProperty("line.separator")+"InternshipTutor");
            fw.write(System.getProperty("line.separator")+System.getProperty("line.separator")+data);
            fw.flush();
            fw.close();
            System.out.println("creato");
        }
    }
    
    public static void emailApprovazione(String email_azienda)throws IOException{
        String userprofile = System.getenv("USERPROFILE");
        Date data = new Date();
        File file = new File(userprofile + "\\Downloads/convenzione-"+email_azienda+".txt");
        if(file.exists()){
            System.out.println("il file esiste");
        }else if(file.createNewFile()){
            FileWriter fw = new FileWriter(file);
            fw.write("TO: " + email_azienda + System.getProperty("line.separator"));
            fw.write("FROM: InternshipTutor" + System.getProperty("line.separator"));
            fw.write("OGGETTO: Conferma Convenzione" + System.getProperty("line.separator")+System.getProperty("line.separator"));
            fw.write("Complimenti!"+System.getProperty("line.separator"));
            fw.write("La sua azienda è stata convenzionata, ora è possibile accedere al sistema.");
            fw.write(System.getProperty("line.separator")+System.getProperty("line.separator")+"InternshipTutor");
            fw.write(System.getProperty("line.separator")+System.getProperty("line.separator")+data);
            fw.flush();
            fw.close();
            System.out.println("creato");
        }
    }
    
    public static void emailRichiestaTirocinio(String email_destinatario, Candidatura c, String swich) throws IOException{
        String userprofile = System.getenv("USERPROFILE");
        Date data = new Date();
        File file = new File(userprofile + "\\Downloads/Candidatura per "+swich+"-"+ c.getNomeStudente() +".txt");
        if(file.exists()){
            System.out.println("il file esiste");
        }else if(file.createNewFile()){
            FileWriter fw = new FileWriter(file);
            fw.write("TO: " + email_destinatario + System.getProperty("line.separator"));
            fw.write("FROM: InternshipTutor" + System.getProperty("line.separator"));
            fw.write("OGGETTO: Candidatura ad offerta di tirocinio: " + c.getTitoloOfferta() + System.getProperty("line.separator")+System.getProperty("line.separator"));
            fw.write("Lo studente " + c.getNomeStudente() + " nato a " + c.getLuogoNascita() + " il " + c.getDataNascita()+
                    ", residente in " + c.getResidenza()+ "; "+ System.getProperty("line.separator")
                    + "con seguente condizione attuale: " + c.getCondizioneAttualeStudente() + "; " + System.getProperty("line.separator")
                    + "con handicap: " + c.getHandicap()+ "; " + System.getProperty("line.separator")
                    + "si è candidato per l'offerta di tirocinio \""
                    + c.getTitoloOfferta() +"\"" + " pubblicata dall'Azienda " + c.getRagioneSociale()
                    + " per il periodo: "+System.getProperty("line.separator")
                    + "da " + c.getStartDate() + " al " + c.getEndDate() + " per un totale di n° " 
                    + c.getCfu() + " CFU."
                    + System.getProperty("line.separator") + System.getProperty("line.separator") 
                    + "Telefono Studente: " + c.getTelefonoStudente() + System.getProperty("line.separator")
                    + "Email Studente: " + c.getEmailStudente() + System.getProperty("line.separator")
                    + "Tutore: " + c.getTutoreUniversitario() + System.getProperty("line.separator")
                    + "Telefono Tutore: " + c.getTelefonoTutoreUni() + System.getProperty("line.separator")
                    + "Email Tutore: " +c.getEmailTutoreUni() + System.getProperty("line.separator")
                    + "Email Responsabile Azienda: " + c.getEmail_responsabile_azienda()
            );
            
            
            fw.write(System.getProperty("line.separator")+System.getProperty("line.separator")+"InternshipTutor");
            fw.write(System.getProperty("line.separator")+System.getProperty("line.separator")+data);
            fw.flush();
            fw.close();
        }
    }
    
    public static void emailConfermaTirocinio(String email_destinatario, String studente, String titolo) throws IOException{
        String userprofile = System.getenv("USERPROFILE");
        Date data = new Date();
        File file = new File(userprofile + "\\Downloads/Attivazione tirocinio"+studente+".txt");
        if(file.exists()){
            System.out.println("il file esiste");
        }else if(file.createNewFile()){
            FileWriter fw = new FileWriter(file);
            fw.write("TO: " + email_destinatario + System.getProperty("line.separator"));
            fw.write("FROM: InternshipTutor" + System.getProperty("line.separator"));
            fw.write("OGGETTO: Conferma attivazione tirocinio " + titolo + System.getProperty("line.separator")+System.getProperty("line.separator"));
            fw.write("Caro studente, "+ System.getProperty("line.separator")
                    + "siamo lieti di informarti che il tirocinio " + titolo + System.getProperty("line.separator")
                    +" è stato attivato.");
            
            fw.write(System.getProperty("line.separator")+System.getProperty("line.separator")+"InternshipTutor");
            fw.write(System.getProperty("line.separator")+System.getProperty("line.separator")+data);
            fw.flush();
            fw.close();
        }
    }
}
