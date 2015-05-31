package model.domain;

import javax.persistence.*;


@Entity
@Table(name = "categorie_buget", schema = "", catalog = "raindrop")
public class CategorieBuget {
    private long idCategorieBuget;
    private String nume;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id_categorie_buget")
    public long getIdCategorieBuget() {
        return idCategorieBuget;
    }

    public void setIdCategorieBuget(long idCategorieBuget) {
        this.idCategorieBuget = idCategorieBuget;
    }

    @Basic
    @Column(name = "nume", nullable = false, insertable = true, updatable = true, length = 150)
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CategorieBuget that = (CategorieBuget) o;

        if (nume != null ? !nume.equals(that.nume) : that.nume != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return nume != null ? nume.hashCode() : 0;
    }
}
