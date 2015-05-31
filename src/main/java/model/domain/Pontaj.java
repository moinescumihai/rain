package model.domain;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;

@Entity
public class Pontaj {
    private long idPontaj;
    private long idResurseUmane;
    private int idUMPontaj;
    private String zi;
    private String luna;
    private String an;
    private Date data;
    private String creatDe;
    private Timestamp creatLa;
    private String modificatDe;
    private Timestamp modificatLa;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id_pontaj", nullable = false, insertable = true, updatable = true)
    public long getIdPontaj() {
        return idPontaj;
    }

    public void setIdPontaj(long idPontaj) {
        this.idPontaj = idPontaj;
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
    @Column(name = "id_u_m_pontaj", nullable = false, insertable = true, updatable = true)
    public int getIdUMPontaj() {
        return idUMPontaj;
    }

    public void setIdUMPontaj(int idUMPontaj) {
        this.idUMPontaj = idUMPontaj;
    }

    @Basic
    @Column(name = "zi", nullable = true, insertable = true, updatable = true, length = 45)
    public String getZi() {
        return zi;
    }

    public void setZi(String zi) {
        this.zi = zi;
    }

    @Basic
    @Column(name = "luna", nullable = true, insertable = true, updatable = true, length = 45)
    public String getLuna() {
        return luna;
    }

    public void setLuna(String luna) {
        this.luna = luna;
    }

    @Basic
    @Column(name = "an", nullable = true, insertable = true, updatable = true, length = 45)
    public String getAn() {
        return an;
    }

    public void setAn(String an) {
        this.an = an;
    }

    @Basic
    @Column(name = "data", nullable = true, insertable = true, updatable = true)
    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
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

        Pontaj pontaj = (Pontaj) o;

        if (idPontaj != pontaj.idPontaj) return false;
        if (idResurseUmane != pontaj.idResurseUmane) return false;
        if (idUMPontaj != pontaj.idUMPontaj) return false;
        if (zi != null ? !zi.equals(pontaj.zi) : pontaj.zi != null) return false;
        if (luna != null ? !luna.equals(pontaj.luna) : pontaj.luna != null) return false;
        if (an != null ? !an.equals(pontaj.an) : pontaj.an != null) return false;
        if (data != null ? !data.equals(pontaj.data) : pontaj.data != null) return false;
        if (creatDe != null ? !creatDe.equals(pontaj.creatDe) : pontaj.creatDe != null) return false;
        if (creatLa != null ? !creatLa.equals(pontaj.creatLa) : pontaj.creatLa != null) return false;
        if (modificatDe != null ? !modificatDe.equals(pontaj.modificatDe) : pontaj.modificatDe != null) return false;
        if (modificatLa != null ? !modificatLa.equals(pontaj.modificatLa) : pontaj.modificatLa != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idPontaj ^ (idPontaj >>> 32));
        result = 31 * result + (int) (idResurseUmane ^ (idResurseUmane >>> 32));
        result = 31 * result + idUMPontaj;
        result = 31 * result + (zi != null ? zi.hashCode() : 0);
        result = 31 * result + (luna != null ? luna.hashCode() : 0);
        result = 31 * result + (an != null ? an.hashCode() : 0);
        result = 31 * result + (data != null ? data.hashCode() : 0);
        result = 31 * result + (creatDe != null ? creatDe.hashCode() : 0);
        result = 31 * result + (creatLa != null ? creatLa.hashCode() : 0);
        result = 31 * result + (modificatDe != null ? modificatDe.hashCode() : 0);
        result = 31 * result + (modificatLa != null ? modificatLa.hashCode() : 0);
        return result;
    }
}
