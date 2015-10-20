package model.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "categorie_proiect", schema = "", catalog = "raindrop")
public class CategorieProiect {
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
}
