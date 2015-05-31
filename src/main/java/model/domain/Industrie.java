package model.domain;

import javax.persistence.*;

@Entity
public class Industrie {
    private int idIndustrie;
    private String nume;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id_industrie", nullable = false, insertable = true, updatable = true)
    public int getIdIndustrie() {
        return idIndustrie;
    }

    public void setIdIndustrie(int idIndustrie) {
        this.idIndustrie = idIndustrie;
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

        Industrie industrie = (Industrie) o;

        if (idIndustrie != industrie.idIndustrie) return false;
        if (nume != null ? !nume.equals(industrie.nume) : industrie.nume != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idIndustrie;
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        return result;
    }
}
