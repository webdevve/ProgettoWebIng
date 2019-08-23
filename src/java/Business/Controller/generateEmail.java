/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

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
        Date data = new Date();
        File file = new File("C:\\Users\\Davide Simboli\\Desktop/disapprovazione-"+email_azienda+".txt");
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
        Date data = new Date();
        File file = new File("C:\\Users\\Davide Simboli\\Desktop/convenzione-"+email_azienda+".txt");
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
}
