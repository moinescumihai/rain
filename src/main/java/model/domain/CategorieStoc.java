package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "categorie_stoc", schema = "", catalog = "raindrop")
public class CategorieStoc {
    private long idCategorieStoc;
    private String numeCategorie;

    @Id
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CategorieStoc that = (CategorieStoc) o;

        if (idCategorieStoc != that.idCategorieStoc) return false;
        if (numeCategorie != null ? !numeCategorie.equals(that.numeCategorie) : that.numeCategorie != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idCategorieStoc ^ (idCategorieStoc >>> 32));
        result = 31 * result + (numeCategorie != null ? numeCategorie.hashCode() : 0);
        return result;
    }
}
