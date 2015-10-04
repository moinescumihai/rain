package model.domain;

public class GrupStocFormModel {
    private long idGrupStoc;
    private String numeGrup;
    private long idCategorieStoc;

    public long getIdGrupStoc() {
        return idGrupStoc;
    }

    public void setIdGrupStoc(long idGrupStoc) {
        this.idGrupStoc = idGrupStoc;
    }

    public String getNumeGrup() {
        return numeGrup;
    }

    public void setNumeGrup(String numeGrup) {
        this.numeGrup = numeGrup;
    }

    public long getIdCategorieStoc() {
        return idCategorieStoc;
    }

    public void setIdCategorieStoc(long idCategorieStoc) {
        this.idCategorieStoc = idCategorieStoc;
    }
}
