package model.domain;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * @author Ciprian on 7/4/2015.
 *         <p>
 *         rain
 */
@Entity
@Table(name = "tranzactie_stoc", schema = "", catalog = "raindrop")
public class TranzactieStoc {
    private long idTranzactieStoc;
    private String idColet;
    private long idStoc;
    private long idLoc;
    private long idResurseUmane;
    private Timestamp dataTranzactie;
    private String creatDe;
    private Timestamp creatLa;
    private String modificatDe;
    private Timestamp modificatLa;

    @Id
    @Column(name = "id_tranzactie_stoc", nullable = false, insertable = true, updatable = true)
    public long getIdTranzactieStoc() {
        return idTranzactieStoc;
    }

    public void setIdTranzactieStoc(long idTranzactieStoc) {
        this.idTranzactieStoc = idTranzactieStoc;
    }

    @Basic
    @Column(name = "id_colet", nullable = false, insertable = true, updatable = true, length = 50)
    public String getIdColet() {
        return idColet;
    }

    public void setIdColet(String idColet) {
        this.idColet = idColet;
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
    @Column(name = "data_tranzactie", nullable = false, insertable = true, updatable = true)
    public Timestamp getDataTranzactie() {
        return dataTranzactie;
    }

    public void setDataTranzactie(Timestamp dataTranzactie) {
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
    @Column(name = "creat_la", nullable = false, insertable = true, updatable = true)
    public Timestamp getCreatLa() {
        return creatLa;
    }

    public void setCreatLa(Timestamp creatLa) {
        this.creatLa = creatLa;
    }

    @Basic
    @Column(name = "modificat_de", nullable = true, insertable = true, updatable = true, length = 150)
    public String getModificatDe() {
        return modificatDe;
    }

    public void setModificatDe(String modificatDe) {
        this.modificatDe = modificatDe;
    }

    @Basic
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

        TranzactieStoc that = (TranzactieStoc) o;

        if (idTranzactieStoc != that.idTranzactieStoc) return false;
        if (idStoc != that.idStoc) return false;
        if (idLoc != that.idLoc) return false;
        if (idResurseUmane != that.idResurseUmane) return false;
        if (idColet != null ? !idColet.equals(that.idColet) : that.idColet != null) return false;
        if (dataTranzactie != null ? !dataTranzactie.equals(that.dataTranzactie) : that.dataTranzactie != null) return false;
        if (creatDe != null ? !creatDe.equals(that.creatDe) : that.creatDe != null) return false;
        if (creatLa != null ? !creatLa.equals(that.creatLa) : that.creatLa != null) return false;
        if (modificatDe != null ? !modificatDe.equals(that.modificatDe) : that.modificatDe != null) return false;
        if (modificatLa != null ? !modificatLa.equals(that.modificatLa) : that.modificatLa != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idTranzactieStoc ^ (idTranzactieStoc >>> 32));
        result = 31 * result + (idColet != null ? idColet.hashCode() : 0);
        result = 31 * result + (int) (idStoc ^ (idStoc >>> 32));
        result = 31 * result + (int) (idLoc ^ (idLoc >>> 32));
        result = 31 * result + (int) (idResurseUmane ^ (idResurseUmane >>> 32));
        result = 31 * result + (dataTranzactie != null ? dataTranzactie.hashCode() : 0);
        result = 31 * result + (creatDe != null ? creatDe.hashCode() : 0);
        result = 31 * result + (creatLa != null ? creatLa.hashCode() : 0);
        result = 31 * result + (modificatDe != null ? modificatDe.hashCode() : 0);
        result = 31 * result + (modificatLa != null ? modificatLa.hashCode() : 0);
        return result;
    }
}
