package com.example.baumard.ppe4_baumard;

/**
 * Created by Alban on 08/02/2016.
 */
public class Inspecteur {

    private String nom;
    private String prenom;
    private String tel;


    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder("Chaîne à stocker");
        sb.append("chaîne à concatener à la précédente");
        sb.append(nom).append("\n ");/* \n signifie retour ligne*/
        sb.append("autre chaîne");
        return sb.toString(); /*retour de la chaîne*/
    }

}
