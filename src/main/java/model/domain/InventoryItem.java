package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.sql.Timestamp;

/**
 * @author Ciprian on 7/4/2015.
 *         <p>
 *         rain
 */
@Entity
@Table(name = "inventory_item", schema = "", catalog = "raindrop")
public class InventoryItem {
    private long idStoc;
    private String numeCategorie;
    private String numeGrup;
    private String numeStoc;
    private String codStoc;
    private String numeLoc;
    private String nume;
    private String detalii;
    private int idStare;
    private String imagine;
    private String factura;
    private String creatDe;
    private Timestamp creatLa;

    @Basic
    @Column(name = "id_stoc", nullable = false, insertable = true, updatable = true)
    public long getIdStoc() {
        return idStoc;
    }

    public void setIdStoc(long idStoc) {
        this.idStoc = idStoc;
    }

    @Basic
    @Column(name = "nume_categorie", nullable = false, insertable = true, updatable = true, length = 255)
    public String getNumeCategorie() {
        return numeCategorie;
    }

    public void setNumeCategorie(String numeCategorie) {
        this.numeCategorie = numeCategorie;
    }

    @Basic
    @Column(name = "nume_grup", nullable = false, insertable = true, updatable = true, length = 255)
    public String getNumeGrup() {
        return numeGrup;
    }

    public void setNumeGrup(String numeGrup) {
        this.numeGrup = numeGrup;
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
    @Column(name = "nume_loc", nullable = false, insertable = true, updatable = true, length = 255)
    public String getNumeLoc() {
        return numeLoc;
    }

    public void setNumeLoc(String numeLoc) {
        this.numeLoc = numeLoc;
    }

    @Basic
    @Column(name = "nume", nullable = true, insertable = true, updatable = true, length = 301)
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
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
    @Column(name = "id_stare", nullable = false, insertable = true, updatable = true)
    public int getIdStare() {
        return idStare;
    }

    public void setIdStare(int idStare) {
        this.idStare = idStare;
    }

    @Basic
    @Column(name = "imagine", nullable = false, insertable = true, updatable = true, length = 65535)
    public String getImagine() {
        return imagine;
    }

    public void setImagine(String imagine) {
        this.imagine = imagine;
    }

    @Basic
    @Column(name = "factura", nullable = false, insertable = true, updatable = true, length = 65535)
    public String getFactura() {
        return factura;
    }

    public void setFactura(String factura) {
        this.factura = factura;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        InventoryItem that = (InventoryItem) o;

        if (idStoc != that.idStoc) return false;
        if (idStare != that.idStare) return false;
        if (numeCategorie != null ? !numeCategorie.equals(that.numeCategorie) : that.numeCategorie != null) return false;
        if (numeGrup != null ? !numeGrup.equals(that.numeGrup) : that.numeGrup != null) return false;
        if (numeStoc != null ? !numeStoc.equals(that.numeStoc) : that.numeStoc != null) return false;
        if (codStoc != null ? !codStoc.equals(that.codStoc) : that.codStoc != null) return false;
        if (numeLoc != null ? !numeLoc.equals(that.numeLoc) : that.numeLoc != null) return false;
        if (nume != null ? !nume.equals(that.nume) : that.nume != null) return false;
        if (detalii != null ? !detalii.equals(that.detalii) : that.detalii != null) return false;
        if (imagine != null ? !imagine.equals(that.imagine) : that.imagine != null) return false;
        if (factura != null ? !factura.equals(that.factura) : that.factura != null) return false;
        if (creatDe != null ? !creatDe.equals(that.creatDe) : that.creatDe != null) return false;
        if (creatLa != null ? !creatLa.equals(that.creatLa) : that.creatLa != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idStoc ^ (idStoc >>> 32));
        result = 31 * result + (numeCategorie != null ? numeCategorie.hashCode() : 0);
        result = 31 * result + (numeGrup != null ? numeGrup.hashCode() : 0);
        result = 31 * result + (numeStoc != null ? numeStoc.hashCode() : 0);
        result = 31 * result + (codStoc != null ? codStoc.hashCode() : 0);
        result = 31 * result + (numeLoc != null ? numeLoc.hashCode() : 0);
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + (detalii != null ? detalii.hashCode() : 0);
        result = 31 * result + idStare;
        result = 31 * result + (imagine != null ? imagine.hashCode() : 0);
        result = 31 * result + (factura != null ? factura.hashCode() : 0);
        result = 31 * result + (creatDe != null ? creatDe.hashCode() : 0);
        result = 31 * result + (creatLa != null ? creatLa.hashCode() : 0);
        return result;
    }
}
