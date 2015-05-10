package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author Ciprian on 5/10/2015.
 *         <p>
 *         rain
 */
@Entity
@Table(name = "categorie_proiect", schema = "", catalog = "raindrop")
public class CategorieProiect {
    private String nume;
    private Integer idCategorieParinte;
    private Byte esteSubcategorie;

    @Basic
    @Column(name = "nume", nullable = false, insertable = true, updatable = true, length = 150)
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
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
        if (o == null || getClass() != o.getClass()) return false;

        CategorieProiect that = (CategorieProiect) o;

        if (nume != null ? !nume.equals(that.nume) : that.nume != null) return false;
        if (idCategorieParinte != null ? !idCategorieParinte.equals(that.idCategorieParinte) : that.idCategorieParinte != null) return false;
        if (esteSubcategorie != null ? !esteSubcategorie.equals(that.esteSubcategorie) : that.esteSubcategorie != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = nume != null ? nume.hashCode() : 0;
        result = 31 * result + (idCategorieParinte != null ? idCategorieParinte.hashCode() : 0);
        result = 31 * result + (esteSubcategorie != null ? esteSubcategorie.hashCode() : 0);
        return result;
    }
}
