/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

/**
 *
 * @author Davide Simboli
 */
public class attualeCondizione {
    String check;
    String value;
    
    public attualeCondizione(String check, String value){
        this.check = check;
        this.value = value;
    }
    
    public void setCheck(String check){
        this.check = check;
    }
    public String getCheck(){
        return check;
    }
    public void setValue(String value){
        this.value = value;
    }
    public String getValue(){
        return value;
    }
}
