package model.domain;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.sql.Timestamp;

@Entity
public class Cashflow {
    private long idCashflow;
    private long idProiect;
    private String nume;
    private String tip;
    private String valoare;
    private String creatDe;
    private Timestamp creatLa;
    private String modificatDe;
    private Timestamp modificatLa;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_cashflow", nullable = false, insertable = true, updatable = true)
    public long getIdCashflow() {
        return idCashflow;
    }

    public void setIdCashflow(long idCashflow) {
        this.idCashflow = idCashflow;
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
    @Column(name = "nume", nullable = false, insertable = true, updatable = true, length = 150)
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    @Basic
    @Column(name = "tip", nullable = false, insertable = true, updatable = true, length = 45)
    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    @Basic
    @Column(name = "valoare", nullable = false, insertable = true, updatable = true, length = 45)
    public String getValoare() {
        return valoare;
    }

    public void setValoare(String valoare) {
        this.valoare = valoare;
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
    @Column(name = "modificat_de", nullable = false, insertable = true, updatable = true, length = 150)
    public String getModificatDe() {
        return modificatDe;
    }

    public void setModificatDe(String modificatDe) {
        this.modificatDe = modificatDe;
    }

    @Basic
    @LastModifiedDate
    @Column(name = "modificat_la", nullable = true, insertable = true, updatable = true)
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

        Cashflow cashflow = (Cashflow) o;

        if (idCashflow != cashflow.idCashflow) return false;
        if (idProiect != cashflow.idProiect) return false;
        if (nume != null ? !nume.equals(cashflow.nume) : cashflow.nume != null) return false;
        if (tip != null ? !tip.equals(cashflow.tip) : cashflow.tip != null) return false;
        if (valoare != null ? !valoare.equals(cashflow.valoare) : cashflow.valoare != null) return false;
        if (creatDe != null ? !creatDe.equals(cashflow.creatDe) : cashflow.creatDe != null) return false;
        if (creatLa != null ? !creatLa.equals(cashflow.creatLa) : cashflow.creatLa != null) return false;
        if (modificatDe != null ? !modificatDe.equals(cashflow.modificatDe) : cashflow.modificatDe != null) return false;
        if (modificatLa != null ? !modificatLa.equals(cashflow.modificatLa) : cashflow.modificatLa != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idCashflow ^ (idCashflow >>> 32));
        result = 31 * result + (int) (idProiect ^ (idProiect >>> 32));
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + (tip != null ? tip.hashCode() : 0);
        result = 31 * result + (valoare != null ? valoare.hashCode() : 0);
        result = 31 * result + (creatDe != null ? creatDe.hashCode() : 0);
        result = 31 * result + (creatLa != null ? creatLa.hashCode() : 0);
        result = 31 * result + (modificatDe != null ? modificatDe.hashCode() : 0);
        result = 31 * result + (modificatLa != null ? modificatLa.hashCode() : 0);
        return result;
    }
}
