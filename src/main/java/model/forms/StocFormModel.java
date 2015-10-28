package model.forms;

import java.sql.Timestamp;

public class StocFormModel {
    private long idStoc;
    private long idCategorieStoc;
    private long idGrupStoc;
    private String numeStoc;
    private String codStoc;
    private long idStare;
    private long idLoc;
    private long idResurseUmane;
    private String detalii;
    private long factura;
    private long imagine;
    private String creatDe;
    private Timestamp creatLa;
    private Timestamp modificatLa;
    private String modificatDe;

    public long getIdStoc() {
        return idStoc;
    }

    public void setIdStoc(long idStoc) {
        this.idStoc = idStoc;
    }

    public long getIdCategorieStoc() {
        return idCategorieStoc;
    }

    public void setIdCategorieStoc(long idCategorieStoc) {
        this.idCategorieStoc = idCategorieStoc;
    }

    public long getIdGrupStoc() {
        return idGrupStoc;
    }

    public void setIdGrupStoc(long idGrupStoc) {
        this.idGrupStoc = idGrupStoc;
    }

    public String getNumeStoc() {
        return numeStoc;
    }

    public void setNumeStoc(String numeStoc) {
        this.numeStoc = numeStoc;
    }

    public String getCodStoc() {
        return codStoc;
    }

    public void setCodStoc(String codStoc) {
        this.codStoc = codStoc;
    }

    public long getIdStare() {
        return idStare;
    }

    public void setIdStare(long idStare) {
        this.idStare = idStare;
    }

    public long getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(long idLoc) {
        this.idLoc = idLoc;
    }

    public long getIdResurseUmane() {
        return idResurseUmane;
    }

    public void setIdResurseUmane(long idResurseUmane) {
        this.idResurseUmane = idResurseUmane;
    }

    public String getDetalii() {
        return detalii;
    }

    public void setDetalii(String detalii) {
        this.detalii = detalii;
    }

    public long getFactura() {
        return factura;
    }

    public void setFactura(long factura) {
        this.factura = factura;
    }

    public long getImagine() {
        return imagine;
    }

    public void setImagine(long imagine) {
        this.imagine = imagine;
    }

    public String getCreatDe() {
        return creatDe;
    }

    public void setCreatDe(String creatDe) {
        this.creatDe = creatDe;
    }

    public Timestamp getCreatLa() {
        return creatLa;
    }

    public void setCreatLa(Timestamp creatLa) {
        this.creatLa = creatLa;
    }

    public Timestamp getModificatLa() {
        return modificatLa;
    }

    public void setModificatLa(Timestamp modificatLa) {
        this.modificatLa = modificatLa;
    }

    public String getModificatDe() {
        return modificatDe;
    }

    public void setModificatDe(String modificatDe) {
        this.modificatDe = modificatDe;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof StocFormModel)) return false;

        StocFormModel that = (StocFormModel) o;

        if (idStoc != that.idStoc) return false;
        if (idCategorieStoc != that.idCategorieStoc) return false;
        if (idGrupStoc != that.idGrupStoc) return false;
        if (idStare != that.idStare) return false;
        if (idLoc != that.idLoc) return false;
        if (idResurseUmane != that.idResurseUmane) return false;
        if (factura != that.factura) return false;
        if (imagine != that.imagine) return false;
        if (numeStoc != null ? !numeStoc.equals(that.numeStoc) : that.numeStoc != null) return false;
        if (codStoc != null ? !codStoc.equals(that.codStoc) : that.codStoc != null) return false;
        if (detalii != null ? !detalii.equals(that.detalii) : that.detalii != null) return false;
        if (creatDe != null ? !creatDe.equals(that.creatDe) : that.creatDe != null) return false;
        if (creatLa != null ? !creatLa.equals(that.creatLa) : that.creatLa != null) return false;
        if (modificatLa != null ? !modificatLa.equals(that.modificatLa) : that.modificatLa != null) return false;
        return !(modificatDe != null ? !modificatDe.equals(that.modificatDe) : that.modificatDe != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idStoc ^ (idStoc >>> 32));
        result = 31 * result + (int) (idCategorieStoc ^ (idCategorieStoc >>> 32));
        result = 31 * result + (int) (idGrupStoc ^ (idGrupStoc >>> 32));
        result = 31 * result + (numeStoc != null ? numeStoc.hashCode() : 0);
        result = 31 * result + (codStoc != null ? codStoc.hashCode() : 0);
        result = 31 * result + (int) (idStare ^ (idStare >>> 32));
        result = 31 * result + (int) (idLoc ^ (idLoc >>> 32));
        result = 31 * result + (int) (idResurseUmane ^ (idResurseUmane >>> 32));
        result = 31 * result + (detalii != null ? detalii.hashCode() : 0);
        result = 31 * result + (int) (factura ^ (factura >>> 32));
        result = 31 * result + (int) (imagine ^ (imagine >>> 32));
        result = 31 * result + (creatDe != null ? creatDe.hashCode() : 0);
        result = 31 * result + (creatLa != null ? creatLa.hashCode() : 0);
        result = 31 * result + (modificatLa != null ? modificatLa.hashCode() : 0);
        result = 31 * result + (modificatDe != null ? modificatDe.hashCode() : 0);
        return result;
    }
}