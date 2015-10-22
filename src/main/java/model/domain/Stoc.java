package model.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "stoc", schema = "", catalog = "raindrop")
public class Stoc extends BaseEntity {
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
    private int deleted;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
    @Column(name = "nume_stoc", nullable = false, insertable = true, updatable = true)
    public String getNumeStoc() {
        return numeStoc;
    }

    public void setNumeStoc(String numeStoc) {
        this.numeStoc = numeStoc;
    }

    @Basic
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(name = "cod_stoc", nullable = false, insertable = true, updatable = false)
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
    @Column(name = "detalii", nullable = true, insertable = true, updatable = true)
    public String getDetalii() {
        return detalii;
    }

    public void setDetalii(String detalii) {
        this.detalii = detalii;
    }

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "factura")
    public Attachment getFactura() {
        return factura;
    }

    public void setFactura(Attachment factura) {
        this.factura = factura;
    }

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "imagine")
    public Attachment getImagine() {
        return imagine;
    }

    public void setImagine(Attachment imagine) {
        this.imagine = imagine;
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

    @Basic
    @Column(name = "deleted", nullable = false, insertable = true, updatable = true, columnDefinition = "INT(1) default '0'")
    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Stoc)) return false;

        Stoc stoc = (Stoc) o;

        if (idStoc != stoc.idStoc) return false;
        if (deleted != stoc.deleted) return false;
        if (idCategorieStoc != null ? !idCategorieStoc.equals(stoc.idCategorieStoc) : stoc.idCategorieStoc != null) return false;
        if (idGrupStoc != null ? !idGrupStoc.equals(stoc.idGrupStoc) : stoc.idGrupStoc != null) return false;
        if (numeStoc != null ? !numeStoc.equals(stoc.numeStoc) : stoc.numeStoc != null) return false;
        if (codStoc != null ? !codStoc.equals(stoc.codStoc) : stoc.codStoc != null) return false;
        if (idStare != null ? !idStare.equals(stoc.idStare) : stoc.idStare != null) return false;
        if (idLoc != null ? !idLoc.equals(stoc.idLoc) : stoc.idLoc != null) return false;
        if (idResurseUmane != null ? !idResurseUmane.equals(stoc.idResurseUmane) : stoc.idResurseUmane != null) return false;
        if (detalii != null ? !detalii.equals(stoc.detalii) : stoc.detalii != null) return false;
        if (factura != null ? !factura.equals(stoc.factura) : stoc.factura != null) return false;
        return !(imagine != null ? !imagine.equals(stoc.imagine) : stoc.imagine != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idStoc ^ (idStoc >>> 32));
        result = 31 * result + (idCategorieStoc != null ? idCategorieStoc.hashCode() : 0);
        result = 31 * result + (idGrupStoc != null ? idGrupStoc.hashCode() : 0);
        result = 31 * result + (numeStoc != null ? numeStoc.hashCode() : 0);
        result = 31 * result + (codStoc != null ? codStoc.hashCode() : 0);
        result = 31 * result + (idStare != null ? idStare.hashCode() : 0);
        result = 31 * result + (idLoc != null ? idLoc.hashCode() : 0);
        result = 31 * result + (idResurseUmane != null ? idResurseUmane.hashCode() : 0);
        result = 31 * result + (detalii != null ? detalii.hashCode() : 0);
        result = 31 * result + (factura != null ? factura.hashCode() : 0);
        result = 31 * result + (imagine != null ? imagine.hashCode() : 0);
        result = 31 * result + deleted;
        return result;
    }
}
