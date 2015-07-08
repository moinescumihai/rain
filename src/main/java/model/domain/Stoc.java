package model.domain;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * @author Ciprian on 7/4/2015.
 *         <p>
 *         rain
 */
@Entity
public class Stoc {
    private long idStoc;
    private long idCategorieStoc;
    private long idGrupStoc;
    private String numeStoc;
    private String codStoc;
    private int idStare;
    private long idLoc;
    private long idResurseUmane;
    private String detalii;
    private long factura;
    private long imagine;
    private String creatDe;
    private Timestamp creatLa;
    private Timestamp modificatLa;
    private String modificatDe;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_stoc", nullable = false, insertable = true, updatable = true)
    public long getIdStoc() {
        return idStoc;
    }

    public void setIdStoc(long idStoc) {
        this.idStoc = idStoc;
    }

    @Basic
    @Column(name = "id_categorie_stoc", nullable = false, insertable = true, updatable = true)
    public long getIdCategorieStoc() {
        return idCategorieStoc;
    }

    public void setIdCategorieStoc(long idCategorieStoc) {
        this.idCategorieStoc = idCategorieStoc;
    }

    @Basic
    @Column(name = "id_grup_stoc", nullable = false, insertable = true, updatable = true)
    public long getIdGrupStoc() {
        return idGrupStoc;
    }

    public void setIdGrupStoc(long idGrupStoc) {
        this.idGrupStoc = idGrupStoc;
    }

    @Basic
    @Column(name = "nume_stoc", nullable = false, insertable = true, updatable = true, length = 255)
    public String getNumeStoc() {
        return numeStoc;
    }

    public void setNumeStoc(String numeStoc) {
        this.numeStoc = numeStoc;
    }

    @Basic
    @Column(name = "cod_stoc", nullable = false, insertable = true, updatable = true, length = 255)
    public String getCodStoc() {
        return codStoc;
    }

    public void setCodStoc(String codStoc) {
        this.codStoc = codStoc;
    }

    @Basic
    @Column(name = "id_stare", nullable = false, insertable = true, updatable = true)
    public int getIdStare() {
        return idStare;
    }

    public void setIdStare(int idStare) {
        this.idStare = idStare;
    }

    @Basic
    @Column(name = "id_loc", nullable = false, insertable = true, updatable = true)
    public long getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(long idLoc) {
        this.idLoc = idLoc;
    }

    @Basic
    @Column(name = "id_resurse_umane", nullable = false, insertable = true, updatable = true)
    public long getIdResurseUmane() {
        return idResurseUmane;
    }

    public void setIdResurseUmane(long idResurseUmane) {
        this.idResurseUmane = idResurseUmane;
    }

    @Basic
    @Column(name = "detalii", nullable = true, insertable = true, updatable = true, length = 65535)
    public String getDetalii() {
        return detalii;
    }

    public void setDetalii(String detalii) {
        this.detalii = detalii;
    }

    @Basic
    @Column(name = "factura", nullable = false, insertable = true, updatable = true)
    public long getFactura() {
        return factura;
    }

    public void setFactura(long factura) {
        this.factura = factura;
    }

    @Basic
    @Column(name = "imagine", nullable = false, insertable = true, updatable = true)
    public long getImagine() {
        return imagine;
    }

    public void setImagine(long imagine) {
        this.imagine = imagine;
    }

    @Basic
    @Column(name = "creat_de", nullable = false, insertable = true, updatable = true, length = 150)
    public String getCreatDe() {
        return creatDe;
    }

    public void setCreatDe(String creatDe) {
        this.creatDe = creatDe;
    }

    @Basic
    @Column(name = "creat_la", nullable = true, insertable = true, updatable = true)
    public Timestamp getCreatLa() {
        return creatLa;
    }

    public void setCreatLa(Timestamp creatLa) {
        this.creatLa = creatLa;
    }

    @Basic
    @Column(name = "modificat_la", nullable = true, insertable = true, updatable = true)
    public Timestamp getModificatLa() {
        return modificatLa;
    }

    public void setModificatLa(Timestamp modificatLa) {
        this.modificatLa = modificatLa;
    }

    @Basic
    @Column(name = "modificat_de", nullable = true, insertable = true, updatable = true, length = 150)
    public String getModificatDe() {
        return modificatDe;
    }

    public void setModificatDe(String modificatDe) {
        this.modificatDe = modificatDe;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Stoc stoc = (Stoc) o;

        if (idStoc != stoc.idStoc) return false;
        if (idCategorieStoc != stoc.idCategorieStoc) return false;
        if (idGrupStoc != stoc.idGrupStoc) return false;
        if (idStare != stoc.idStare) return false;
        if (idLoc != stoc.idLoc) return false;
        if (idResurseUmane != stoc.idResurseUmane) return false;
        if (factura != stoc.factura) return false;
        if (imagine != stoc.imagine) return false;
        if (numeStoc != null ? !numeStoc.equals(stoc.numeStoc) : stoc.numeStoc != null) return false;
        if (codStoc != null ? !codStoc.equals(stoc.codStoc) : stoc.codStoc != null) return false;
        if (detalii != null ? !detalii.equals(stoc.detalii) : stoc.detalii != null) return false;
        if (creatDe != null ? !creatDe.equals(stoc.creatDe) : stoc.creatDe != null) return false;
        if (creatLa != null ? !creatLa.equals(stoc.creatLa) : stoc.creatLa != null) return false;
        if (modificatLa != null ? !modificatLa.equals(stoc.modificatLa) : stoc.modificatLa != null) return false;
        if (modificatDe != null ? !modificatDe.equals(stoc.modificatDe) : stoc.modificatDe != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idStoc ^ (idStoc >>> 32));
        result = 31 * result + (int) (idCategorieStoc ^ (idCategorieStoc >>> 32));
        result = 31 * result + (int) (idGrupStoc ^ (idGrupStoc >>> 32));
        result = 31 * result + (numeStoc != null ? numeStoc.hashCode() : 0);
        result = 31 * result + (codStoc != null ? codStoc.hashCode() : 0);
        result = 31 * result + idStare;
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
