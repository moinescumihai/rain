package model.domain;

import javax.persistence.*;
import java.sql.Timestamp;


@Entity
@Table(name = "inventory_item", schema = "", catalog = "raindrop")
public class InventoryItem {
    private long idStoc;
    private String numeCategorie;
    private String numeGrup;
    private String numeStoc;
    private String codStoc;
    private String numeLoc;
    private long idLoc;
    private String nume;
    private String detalii;
    private int idStare;
    private String imagine;
    private String factura;
    private String creatDe;
    private String modificatDe;
    private Timestamp creatLa;
    private Timestamp modificatLa;

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

    @Basic
    @Column(name = "modificat_de", nullable = true, insertable = true, updatable = true)
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

    @Basic
    @Column(name = "id_loc", nullable = false, insertable = true, updatable = true, length = 20)
    public long getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(long idLoc) {
        this.idLoc = idLoc;
    }
}
