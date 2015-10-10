package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "categorie_stoc", schema = "", catalog = "raindrop")
public class CategorieStoc {
    private long idCategorieStoc;
    private String numeCategorie;
    private Integer idCategorieParinte;
    private Byte esteSubcategorie;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_categorie_stoc", nullable = false, insertable = true, updatable = true)
    public long getIdCategorieStoc() {
        return idCategorieStoc;
    }

    public void setIdCategorieStoc(long idCategorieStoc) {
        this.idCategorieStoc = idCategorieStoc;
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
    @Column(name = "id_categorie_parinte", nullable = true, insertable = true, updatable = true)
    public Integer getIdCategorieParinte() {
        return idCategorieParinte;
    }

    public void setIdCategorieParinte(Integer idCategorieParinte) {
        this.idCategorieParinte = idCategorieParinte;
    }

    @Basic
    @Column(name = "este_subcategorie", nullable = true, insertable = true, updatable = true)
    public Byte getEsteSubcategorie() {
        return esteSubcategorie;
    }

    public void setEsteSubcategorie(Byte esteSubcategorie) {
        this.esteSubcategorie = esteSubcategorie;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CategorieStoc)) return false;

        CategorieStoc that = (CategorieStoc) o;

        if (idCategorieStoc != that.idCategorieStoc) return false;
        if (numeCategorie != null ? !numeCategorie.equals(that.numeCategorie) : that.numeCategorie != null) return false;
        if (idCategorieParinte != null ? !idCategorieParinte.equals(that.idCategorieParinte) : that.idCategorieParinte != null) return false;
        return !(esteSubcategorie != null ? !esteSubcategorie.equals(that.esteSubcategorie) : that.esteSubcategorie != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idCategorieStoc ^ (idCategorieStoc >>> 32));
        result = 31 * result + (numeCategorie != null ? numeCategorie.hashCode() : 0);
        result = 31 * result + (idCategorieParinte != null ? idCategorieParinte.hashCode() : 0);
        result = 31 * result + (esteSubcategorie != null ? esteSubcategorie.hashCode() : 0);
        return result;
    }
}
