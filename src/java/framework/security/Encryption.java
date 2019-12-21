/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package framework.security;

/**
 *
 * @author Davide Simboli
 */
public class Encryption {
    public static String cripta(String str){
        String encryptedSTR = "";
        char c;
        for(int i = 0; i<str.length(); i++){
            c = str.charAt(i);
            switch (c){
                case 'a': {
                    encryptedSTR = encryptedSTR + 'b';
                    break;
                }
                case 'b':{
                    encryptedSTR = encryptedSTR + 'c';
                    break;
                }
                case 'c':{
                    encryptedSTR = encryptedSTR + 'd';
                    break;
                }
                case 'd':{
                    encryptedSTR = encryptedSTR + 'e';
                    break;
                }
                case 'e':{
                    encryptedSTR = encryptedSTR + 'f';
                    break;
                }
                case 'f':{
                    encryptedSTR = encryptedSTR + 'g';
                    break;
                }
                case 'g':{
                    encryptedSTR = encryptedSTR + 'h';
                    break;
                }
                case 'h':{
                    encryptedSTR = encryptedSTR + 'i';
                    break;
                }
                case 'i':{
                    encryptedSTR = encryptedSTR + 'j';
                    break;
                }
                case 'j':{
                    encryptedSTR = encryptedSTR + 'k';
                    break;
                }
                case 'k':{
                    encryptedSTR = encryptedSTR + 'l';
                    break;
                }
                case 'l':{
                    encryptedSTR = encryptedSTR + 'm';
                    break;
                }
                case 'm':{
                    encryptedSTR = encryptedSTR + 'n';
                    break;
                }
                case 'n':{
                    encryptedSTR = encryptedSTR + 'o';
                    break;
                }
                case 'o':{
                    encryptedSTR = encryptedSTR + 'p';
                    break;
                }
                case 'p':{
                    encryptedSTR = encryptedSTR + 'q';
                    break;
                }
                case 'q':{
                    encryptedSTR = encryptedSTR + 'r';
                    break;
                }
                case 'r':{
                    encryptedSTR = encryptedSTR + 's';
                    break;
                }
                case 's':{
                    encryptedSTR = encryptedSTR + 't';
                    break;
                }
                case 't':{
                    encryptedSTR = encryptedSTR + 'u';
                    break;
                }
                case 'u':{
                    encryptedSTR = encryptedSTR + 'v';
                    break;
                }
                case 'v':{
                    encryptedSTR = encryptedSTR + 'w';
                    break;
                }
                case 'w':{
                    encryptedSTR = encryptedSTR + 'x';
                    break;
                }
                case 'x':{
                    encryptedSTR = encryptedSTR + 'y';
                    break;
                }
                case 'y':{
                    encryptedSTR = encryptedSTR + 'z';
                    break;
                }
                case 'z':{
                    encryptedSTR = encryptedSTR + 'a';
                    break;
                }
                case 'A': {
                    encryptedSTR = encryptedSTR + 'B';
                    break;
                }
                case 'B':{
                    encryptedSTR = encryptedSTR + 'C';
                    break;
                }
                case 'C':{
                    encryptedSTR = encryptedSTR + 'D';
                    break;
                }
                case 'D':{
                    encryptedSTR = encryptedSTR + 'E';
                    break;
                }
                case 'E':{
                    encryptedSTR = encryptedSTR + 'F';
                    break;
                }
                case 'F':{
                    encryptedSTR = encryptedSTR + 'G';
                    break;
                }
                case 'G':{
                    encryptedSTR = encryptedSTR + 'H';
                    break;
                }
                case 'H':{
                    encryptedSTR = encryptedSTR + 'I';
                    break;
                }
                case 'I':{
                    encryptedSTR = encryptedSTR + 'J';
                    break;
                }
                case 'J':{
                    encryptedSTR = encryptedSTR + 'K';
                    break;
                }
                case 'K':{
                    encryptedSTR = encryptedSTR + 'L';
                    break;
                }
                case 'L':{
                    encryptedSTR = encryptedSTR + 'M';
                    break;
                }
                case 'M':{
                    encryptedSTR = encryptedSTR + 'N';
                    break;
                }
                case 'N':{
                    encryptedSTR = encryptedSTR + 'O';
                    break;
                }
                case 'O':{
                    encryptedSTR = encryptedSTR + 'P';
                    break;
                }
                case 'P':{
                    encryptedSTR = encryptedSTR + 'Q';
                    break;
                }
                case 'Q':{
                    encryptedSTR = encryptedSTR + 'R';
                    break;
                }
                case 'R':{
                    encryptedSTR = encryptedSTR + 'S';
                    break;
                }
                case 'S':{
                    encryptedSTR = encryptedSTR + 'T';
                    break;
                }
                case 'T':{
                    encryptedSTR = encryptedSTR + 'U';
                    break;
                }
                case 'U':{
                    encryptedSTR = encryptedSTR + 'V';
                    break;
                }
                case 'V':{
                    encryptedSTR = encryptedSTR + 'W';
                    break;
                }
                case 'W':{
                    encryptedSTR = encryptedSTR + 'X';
                    break;
                }
                case 'X':{
                    encryptedSTR = encryptedSTR + 'Y';
                    break;
                }
                case 'Y':{
                    encryptedSTR = encryptedSTR + 'Z';
                    break;
                }
                case 'Z':{
                    encryptedSTR = encryptedSTR + 'A';
                    break;
                }
                default:{
                    encryptedSTR = encryptedSTR + c;
                }
            }
        }
        return encryptedSTR;
    }
    
    public static String decripta(String str){
        String decryptedSTR = "";
        char c;
        for(int i = 0; i<str.length(); i++){
            c = str.charAt(i);
            switch (c){
                case 'a': {
                    decryptedSTR = decryptedSTR + 'z';
                    break;
                }
                case 'b':{
                    decryptedSTR = decryptedSTR + 'a';
                    break;
                }
                case 'c':{
                    decryptedSTR = decryptedSTR + 'b';
                    break;
                }
                case 'd':{
                    decryptedSTR = decryptedSTR + 'c';
                    break;
                }
                case 'e':{
                    decryptedSTR = decryptedSTR + 'd';
                    break;
                }
                case 'f':{
                    decryptedSTR = decryptedSTR + 'e';
                    break;
                }
                case 'g':{
                    decryptedSTR = decryptedSTR + 'f';
                    break;
                }
                case 'h':{
                    decryptedSTR = decryptedSTR + 'g';
                    break;
                }
                case 'i':{
                    decryptedSTR = decryptedSTR + 'h';
                    break;
                }
                case 'j':{
                    decryptedSTR = decryptedSTR + 'i';
                    break;
                }
                case 'k':{
                    decryptedSTR = decryptedSTR + 'j';
                    break;
                }
                case 'l':{
                    decryptedSTR = decryptedSTR + 'k';
                    break;
                }
                case 'm':{
                    decryptedSTR = decryptedSTR + 'l';
                    break;
                }
                case 'n':{
                    decryptedSTR = decryptedSTR + 'm';
                    break;
                }
                case 'o':{
                    decryptedSTR = decryptedSTR + 'n';
                    break;
                }
                case 'p':{
                    decryptedSTR = decryptedSTR + 'o';
                    break;
                }
                case 'q':{
                    decryptedSTR = decryptedSTR + 'p';
                    break;
                }
                case 'r':{
                    decryptedSTR = decryptedSTR + 'q';
                    break;
                }
                case 's':{
                    decryptedSTR = decryptedSTR + 'r';
                    break;
                }
                case 't':{
                    decryptedSTR = decryptedSTR + 's';
                    break;
                }
                case 'u':{
                    decryptedSTR = decryptedSTR + 't';
                    break;
                }
                case 'v':{
                    decryptedSTR = decryptedSTR + 'u';
                    break;
                }
                case 'w':{
                    decryptedSTR = decryptedSTR + 'v';
                    break;
                }
                case 'x':{
                    decryptedSTR = decryptedSTR + 'w';
                    break;
                }
                case 'y':{
                    decryptedSTR = decryptedSTR + 'x';
                    break;
                }
                case 'z':{
                    decryptedSTR = decryptedSTR + 'y';
                    break;
                }
                case 'A': {
                    decryptedSTR = decryptedSTR + 'Z';
                    break;
                }
                case 'B':{
                    decryptedSTR = decryptedSTR + 'A';
                    break;
                }
                case 'C':{
                    decryptedSTR = decryptedSTR + 'B';
                    break;
                }
                case 'D':{
                    decryptedSTR = decryptedSTR + 'C';
                    break;
                }
                case 'E':{
                    decryptedSTR = decryptedSTR + 'D';
                    break;
                }
                case 'F':{
                    decryptedSTR = decryptedSTR + 'E';
                    break;
                }
                case 'G':{
                    decryptedSTR = decryptedSTR + 'F';
                    break;
                }
                case 'H':{
                    decryptedSTR = decryptedSTR + 'G';
                    break;
                }
                case 'I':{
                    decryptedSTR = decryptedSTR + 'H';
                    break;
                }
                case 'J':{
                    decryptedSTR = decryptedSTR + 'I';
                    break;
                }
                case 'K':{
                    decryptedSTR = decryptedSTR + 'J';
                    break;
                }
                case 'L':{
                    decryptedSTR = decryptedSTR + 'K';
                    break;
                }
                case 'M':{
                    decryptedSTR = decryptedSTR + 'L';
                    break;
                }
                case 'N':{
                    decryptedSTR = decryptedSTR + 'M';
                    break;
                }
                case 'O':{
                    decryptedSTR = decryptedSTR + 'N';
                    break;
                }
                case 'P':{
                    decryptedSTR = decryptedSTR + 'O';
                    break;
                }
                case 'Q':{
                    decryptedSTR = decryptedSTR + 'P';
                    break;
                }
                case 'R':{
                    decryptedSTR = decryptedSTR + 'Q';
                    break;
                }
                case 'S':{
                    decryptedSTR = decryptedSTR + 'R';
                    break;
                }
                case 'T':{
                    decryptedSTR = decryptedSTR + 'S';
                    break;
                }
                case 'U':{
                    decryptedSTR = decryptedSTR + 'T';
                    break;
                }
                case 'V':{
                    decryptedSTR = decryptedSTR + 'U';
                    break;
                }
                case 'W':{
                    decryptedSTR = decryptedSTR + 'V';
                    break;
                }
                case 'X':{
                    decryptedSTR = decryptedSTR + 'W';
                    break;
                }
                case 'Y':{
                    decryptedSTR = decryptedSTR + 'X';
                    break;
                }
                case 'Z':{
                    decryptedSTR = decryptedSTR + 'Y';
                    break;
                }
                default:{
                    decryptedSTR = decryptedSTR + c;
                }
            }
        }
        return decryptedSTR;
    }
}
