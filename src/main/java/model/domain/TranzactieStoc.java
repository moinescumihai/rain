package model.domain;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;

@Entity
@Table(name = "tranzactie_stoc", schema = "", catalog = "raindrop")
public class TranzactieStoc {
    private long idTranzactieStoc;
    private long idStoc;
    private String nume;
    private String cantitate;
    private int idUMStoc;
    private String tipTranzactie;
    private long idUserResponsabil;
    private Date dataTranzactie;
    private String creatDe;
    private Timestamp creatLa;

    @Id
    @Column(name = "id_tranzactie_stoc", nullable = false, insertable = true, updatable = true)
    public long getIdTranzactieStoc() {
        return idTranzactieStoc;
    }

    public void setIdTranzactieStoc(long idTranzactieStoc) {
        this.idTranzactieStoc = idTranzactieStoc;
    }

    @Basic
    @Column(name = "id_stoc", nullable = false, insertable = true, updatable = true)
    public long getIdStoc() {
        return idStoc;
    }

    public void setIdStoc(long idStoc) {
        this.idStoc = idStoc;
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
    @Column(name = "cantitate", nullable = false, insertable = true, updatable = true, length = 45)
    public String getCantitate() {
        return cantitate;
    }

    public void setCantitate(String cantitate) {
        this.cantitate = cantitate;
    }

    @Basic
    @Column(name = "id_u_m_stoc", nullable = false, insertable = true, updatable = true)
    public int getIdUMStoc() {
        return idUMStoc;
    }

    public void setIdUMStoc(int idUMStoc) {
        this.idUMStoc = idUMStoc;
    }

    @Basic
    @Column(name = "tip_tranzactie", nullable = false, insertable = true, updatable = true, length = 2)
    public String getTipTranzactie() {
        return tipTranzactie;
    }

    public void setTipTranzactie(String tipTranzactie) {
        this.tipTranzactie = tipTranzactie;
    }

    @Basic
    @Column(name = "id_user_responsabil", nullable = false, insertable = true, updatable = true)
    public long getIdUserResponsabil() {
        return idUserResponsabil;
    }

    public void setIdUserResponsabil(long idUserResponsabil) {
        this.idUserResponsabil = idUserResponsabil;
    }

    @Basic
    @Column(name = "data_tranzactie", nullable = false, insertable = true, updatable = true)
    public Date getDataTranzactie() {
        return dataTranzactie;
    }

    public void setDataTranzactie(Date dataTranzactie) {
        this.dataTranzactie = dataTranzactie;
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

        TranzactieStoc that = (TranzactieStoc) o;

        if (idTranzactieStoc != that.idTranzactieStoc) return false;
        if (idStoc != that.idStoc) return false;
        if (idUMStoc != that.idUMStoc) return false;
        if (idUserResponsabil != that.idUserResponsabil) return false;
        if (nume != null ? !nume.equals(that.nume) : that.nume != null) return false;
        if (cantitate != null ? !cantitate.equals(that.cantitate) : that.cantitate != null) return false;
        if (tipTranzactie != null ? !tipTranzactie.equals(that.tipTranzactie) : that.tipTranzactie != null) return false;
        if (dataTranzactie != null ? !dataTranzactie.equals(that.dataTranzactie) : that.dataTranzactie != null) return false;
        if (creatDe != null ? !creatDe.equals(that.creatDe) : that.creatDe != null) return false;
        if (creatLa != null ? !creatLa.equals(that.creatLa) : that.creatLa != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idTranzactieStoc ^ (idTranzactieStoc >>> 32));
        result = 31 * result + (int) (idStoc ^ (idStoc >>> 32));
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + (cantitate != null ? cantitate.hashCode() : 0);
        result = 31 * result + idUMStoc;
        result = 31 * result + (tipTranzactie != null ? tipTranzactie.hashCode() : 0);
        result = 31 * result + (int) (idUserResponsabil ^ (idUserResponsabil >>> 32));
        result = 31 * result + (dataTranzactie != null ? dataTranzactie.hashCode() : 0);
        result = 31 * result + (creatDe != null ? creatDe.hashCode() : 0);
        result = 31 * result + (creatLa != null ? creatLa.hashCode() : 0);
        return result;
    }
}
