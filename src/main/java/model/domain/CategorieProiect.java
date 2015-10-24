package model.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "categorie_proiect", schema = "", catalog = "raindrop")
public class CategorieProiect extends BaseEntity {
    private long idCategorieProiect;
    private String nume;
    private CategorieProiect parent;
    private Collection<CategorieProiect> children;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_categorie_proiect")
    public long getIdCategorieProiect() {
        return idCategorieProiect;
    }

    public void setIdCategorieProiect(long idCategorieProiect) {
        this.idCategorieProiect = idCategorieProiect;
    }

    @Basic
    @Column(name = "nume", nullable = false, insertable = true, updatable = true, length = 150)
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JsonBackReference
    public CategorieProiect getParent() {
        return parent;
    }

    public void setParent(CategorieProiect parent) {
        this.parent = parent;
    }

    @OneToMany(mappedBy = "parent", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonManagedReference
    public Collection<CategorieProiect> getChildren() {
        return children;
    }

    public void setChildren(Collection<CategorieProiect> children) {
        this.children = children;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CategorieProiect)) return false;

        CategorieProiect that = (CategorieProiect) o;

        if (idCategorieProiect != that.idCategorieProiect) return false;
        if (nume != null ? !nume.equals(that.nume) : that.nume != null) return false;
        if (parent != null ? !parent.equals(that.parent) : that.parent != null) return false;
        return !(children != null ? !children.equals(that.children) : that.children != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idCategorieProiect ^ (idCategorieProiect >>> 32));
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + (parent != null ? parent.hashCode() : 0);
        result = 31 * result + (children != null ? children.hashCode() : 0);
        return result;
    }
}
