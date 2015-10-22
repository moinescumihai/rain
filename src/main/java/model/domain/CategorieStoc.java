package model.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "categorie_stoc", schema = "", catalog = "raindrop")
public class CategorieStoc extends BaseEntity {
    private long idCategorieStoc;
    private Long codCategorie;
    private String numeCategorie;
    private CategorieStoc parent;
    private Collection<CategorieStoc> children;

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

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JsonBackReference
    public CategorieStoc getParent() {
        return parent;
    }

    public void setParent(CategorieStoc parent) {
        this.parent = parent;
    }

    @OneToMany(mappedBy = "parent", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonManagedReference
    public Collection<CategorieStoc> getChildren() {
        return children;
    }

    public void setChildren(Collection<CategorieStoc> children) {
        this.children = children;
    }

    @Basic
    @Column(name = "cod_categorie", nullable = true, insertable = true, updatable = true)
    public Long getCodCategorie() {
        return codCategorie;
    }

    public void setCodCategorie(Long codCategorie) {
        this.codCategorie = codCategorie;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CategorieStoc)) return false;

        CategorieStoc that = (CategorieStoc) o;

        if (idCategorieStoc != that.idCategorieStoc) return false;
        if (codCategorie != null ? !codCategorie.equals(that.codCategorie) : that.codCategorie != null) return false;
        if (numeCategorie != null ? !numeCategorie.equals(that.numeCategorie) : that.numeCategorie != null) return false;
        if (parent != null ? !parent.equals(that.parent) : that.parent != null) return false;
        return !(children != null ? !children.equals(that.children) : that.children != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idCategorieStoc ^ (idCategorieStoc >>> 32));
        result = 31 * result + (codCategorie != null ? codCategorie.hashCode() : 0);
        result = 31 * result + (numeCategorie != null ? numeCategorie.hashCode() : 0);
        result = 31 * result + (parent != null ? parent.hashCode() : 0);
        result = 31 * result + (children != null ? children.hashCode() : 0);
        return result;
    }
}
