package model.domain;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "pontaj", schema = "", catalog = "raindrop")
public class Pontaj extends BaseEntity {
    private long idPontaj;
    private ResurseUmane idResurseUmane;
    private UMPontaj idUMPontaj;
    private String zi;
    private String luna;
    private String an;
    private Date data;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_pontaj", nullable = false, insertable = true, updatable = true)
    public long getIdPontaj() {
        return idPontaj;
    }

    public void setIdPontaj(long idPontaj) {
        this.idPontaj = idPontaj;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_resurse_umane")
    public ResurseUmane getIdResurseUmane() {
        return idResurseUmane;
    }

    public void setIdResurseUmane(ResurseUmane idResurseUmane) {
        this.idResurseUmane = idResurseUmane;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_u_m_pontaj")
    public UMPontaj getIdUMPontaj() {
        return idUMPontaj;
    }

    public void setIdUMPontaj(UMPontaj idUMPontaj) {
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

}
