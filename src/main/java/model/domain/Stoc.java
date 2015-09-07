package model.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "stoc", schema = "", catalog = "raindrop")
public class Stoc {
    private long idStoc;
    private CategorieStoc idCategorieStoc;
    private GrupStoc idGrupStoc;
    private String numeStoc;
    private String codStoc;
    private StareStoc idStare;
    private Loc idLoc;
    private ResurseUmane idResurseUmane;
    private String detalii;
    private Attachment factura;
    private Attachment imagine;
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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_categorie_stoc")
    public CategorieStoc getIdCategorieStoc() {
        return idCategorieStoc;
    }

    public void setIdCategorieStoc(CategorieStoc idCategorieStoc) {
        this.idCategorieStoc = idCategorieStoc;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_grup_stoc")
    public GrupStoc getIdGrupStoc() {
        return idGrupStoc;
    }

    public void setIdGrupStoc(GrupStoc idGrupStoc) {
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
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(name = "cod_stoc", nullable = true, insertable = true, updatable = false, length = 255)
    public String getCodStoc() {
        return codStoc;
    }

    public void setCodStoc(String codStoc) {
        this.codStoc = codStoc;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_resurse_umane")
    public ResurseUmane getIdResurseUmane() {
        return idResurseUmane;
    }

    public void setIdResurseUmane(ResurseUmane idResurseUmane) {
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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "factura")
    public Attachment getFactura() {
        return factura;
    }

    public void setFactura(Attachment factura) {
        this.factura = factura;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "imagine")
    public Attachment getImagine() {
        return imagine;
    }

    public void setImagine(Attachment imagine) {
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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_stare")
    public StareStoc getIdStare() {
        return idStare;
    }

    public void setIdStare(StareStoc idStare) {
        this.idStare = idStare;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_loc")
    public Loc getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(Loc idLoc) {
        this.idLoc = idLoc;
    }
}
