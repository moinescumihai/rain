package model.domain;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "buget_proiect", schema = "", catalog = "raindrop")
public class BugetProiect {
    private long idBuget;
    private long idProiect;
    private Integer idCategorieBuget;
    private String nume;
    private int idUMBuget;
    private String costPrognozat;
    private String costEfectiv;
    private String nrUnitatiPrognozat;
    private String nrUnitatiEfectiv;
    private String costUnitate;
    private String diferenta;
    private String diferentaProc;
    private String creatDe;
    private Timestamp creatLa;
    private String modificatDe;
    private Timestamp modificatLa;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_buget", nullable = false, insertable = true, updatable = true)
    public long getIdBuget() {
        return idBuget;
    }

    public void setIdBuget(long idBuget) {
        this.idBuget = idBuget;
    }

    @Basic
    @Column(name = "id_proiect", nullable = false, insertable = true, updatable = true)
    public long getIdProiect() {
        return idProiect;
    }

    public void setIdProiect(long idProiect) {
        this.idProiect = idProiect;
    }

    @Basic
    @Column(name = "id_categorie_buget", nullable = true, insertable = true, updatable = true)
    public Integer getIdCategorieBuget() {
        return idCategorieBuget;
    }

    public void setIdCategorieBuget(Integer idCategorieBuget) {
        this.idCategorieBuget = idCategorieBuget;
    }

    @Basic
    @Column(name = "nume", nullable = true, insertable = true, updatable = true, length = 150)
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    @Basic
    @Column(name = "id_u_m_buget", nullable = false, insertable = true, updatable = true)
    public int getIdUMBuget() {
        return idUMBuget;
    }

    public void setIdUMBuget(int idUMBuget) {
        this.idUMBuget = idUMBuget;
    }

    @Basic
    @Column(name = "cost_prognozat", nullable = false, insertable = true, updatable = true, length = 45)
    public String getCostPrognozat() {
        return costPrognozat;
    }

    public void setCostPrognozat(String costPrognozat) {
        this.costPrognozat = costPrognozat;
    }

    @Basic
    @Column(name = "cost_efectiv", nullable = false, insertable = true, updatable = true, length = 45)
    public String getCostEfectiv() {
        return costEfectiv;
    }

    public void setCostEfectiv(String costEfectiv) {
        this.costEfectiv = costEfectiv;
    }

    @Basic
    @Column(name = "nr_unitati_prognozat", nullable = true, insertable = true, updatable = true, length = 45)
    public String getNrUnitatiPrognozat() {
        return nrUnitatiPrognozat;
    }

    public void setNrUnitatiPrognozat(String nrUnitatiPrognozat) {
        this.nrUnitatiPrognozat = nrUnitatiPrognozat;
    }

    @Basic
    @Column(name = "nr_unitati_efectiv", nullable = true, insertable = true, updatable = true, length = 45)
    public String getNrUnitatiEfectiv() {
        return nrUnitatiEfectiv;
    }

    public void setNrUnitatiEfectiv(String nrUnitatiEfectiv) {
        this.nrUnitatiEfectiv = nrUnitatiEfectiv;
    }

    @Basic
    @Column(name = "cost_unitate", nullable = true, insertable = true, updatable = true, length = 45)
    public String getCostUnitate() {
        return costUnitate;
    }

    public void setCostUnitate(String costUnitate) {
        this.costUnitate = costUnitate;
    }

    @Basic
    @Column(name = "diferenta", nullable = true, insertable = true, updatable = true, length = 45)
    public String getDiferenta() {
        return diferenta;
    }

    public void setDiferenta(String diferenta) {
        this.diferenta = diferenta;
    }

    @Basic
    @Column(name = "diferenta_proc", nullable = true, insertable = true, updatable = true, length = 45)
    public String getDiferentaProc() {
        return diferentaProc;
    }

    public void setDiferentaProc(String diferentaProc) {
        this.diferentaProc = diferentaProc;
    }

    @Basic
    @CreatedBy
    @Column(name = "creat_de", nullable = false, insertable = true, updatable = true, length = 150)
    public String getCreatDe() {
        return creatDe;
    }

    public void setCreatDe(String creatDe) {
        this.creatDe = creatDe;
    }

    @Basic
    @CreatedDate
    @Column(name = "creat_la", nullable = true, insertable = true, updatable = true)
    public Timestamp getCreatLa() {
        return creatLa;
    }

    public void setCreatLa(Timestamp creatLa) {
        this.creatLa = creatLa;
    }

    @Basic
    @LastModifiedBy
    @Column(name = "modificat_de", nullable = true, insertable = true, updatable = true, length = 150)
    public String getModificatDe() {
        return modificatDe;
    }

    public void setModificatDe(String modificatDe) {
        this.modificatDe = modificatDe;
    }

    @Basic
    @LastModifiedDate
    @Column(name = "modificat_la", nullable = false, insertable = true, updatable = true)
    public Timestamp getModificatLa() {
        return modificatLa;
    }

    public void setModificatLa(Timestamp modificatLa) {
        this.modificatLa = modificatLa;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BugetProiect that = (BugetProiect) o;

        if (idBuget != that.idBuget) return false;
        if (idProiect != that.idProiect) return false;
        if (idUMBuget != that.idUMBuget) return false;
        if (idCategorieBuget != null ? !idCategorieBuget.equals(that.idCategorieBuget) : that.idCategorieBuget != null) return false;
        if (nume != null ? !nume.equals(that.nume) : that.nume != null) return false;
        if (costPrognozat != null ? !costPrognozat.equals(that.costPrognozat) : that.costPrognozat != null) return false;
        if (costEfectiv != null ? !costEfectiv.equals(that.costEfectiv) : that.costEfectiv != null) return false;
        if (nrUnitatiPrognozat != null ? !nrUnitatiPrognozat.equals(that.nrUnitatiPrognozat) : that.nrUnitatiPrognozat != null) return false;
        if (nrUnitatiEfectiv != null ? !nrUnitatiEfectiv.equals(that.nrUnitatiEfectiv) : that.nrUnitatiEfectiv != null) return false;
        if (costUnitate != null ? !costUnitate.equals(that.costUnitate) : that.costUnitate != null) return false;
        if (diferenta != null ? !diferenta.equals(that.diferenta) : that.diferenta != null) return false;
        if (diferentaProc != null ? !diferentaProc.equals(that.diferentaProc) : that.diferentaProc != null) return false;
        if (creatDe != null ? !creatDe.equals(that.creatDe) : that.creatDe != null) return false;
        if (creatLa != null ? !creatLa.equals(that.creatLa) : that.creatLa != null) return false;
        if (modificatDe != null ? !modificatDe.equals(that.modificatDe) : that.modificatDe != null) return false;
        if (modificatLa != null ? !modificatLa.equals(that.modificatLa) : that.modificatLa != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idBuget ^ (idBuget >>> 32));
        result = 31 * result + (int) (idProiect ^ (idProiect >>> 32));
        result = 31 * result + (idCategorieBuget != null ? idCategorieBuget.hashCode() : 0);
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + idUMBuget;
        result = 31 * result + (costPrognozat != null ? costPrognozat.hashCode() : 0);
        result = 31 * result + (costEfectiv != null ? costEfectiv.hashCode() : 0);
        result = 31 * result + (nrUnitatiPrognozat != null ? nrUnitatiPrognozat.hashCode() : 0);
        result = 31 * result + (nrUnitatiEfectiv != null ? nrUnitatiEfectiv.hashCode() : 0);
        result = 31 * result + (costUnitate != null ? costUnitate.hashCode() : 0);
        result = 31 * result + (diferenta != null ? diferenta.hashCode() : 0);
        result = 31 * result + (diferentaProc != null ? diferentaProc.hashCode() : 0);
        result = 31 * result + (creatDe != null ? creatDe.hashCode() : 0);
        result = 31 * result + (creatLa != null ? creatLa.hashCode() : 0);
        result = 31 * result + (modificatDe != null ? modificatDe.hashCode() : 0);
        result = 31 * result + (modificatLa != null ? modificatLa.hashCode() : 0);
        return result;
    }
}
