package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "industrie", schema = "", catalog = "raindrop")
public class Industrie extends BaseEntity {
    private long idIndustrie;
    private String nume;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_industrie", nullable = false, insertable = true, updatable = true)
    public long getIdIndustrie() {
        return idIndustrie;
    }

    public void setIdIndustrie(long idIndustrie) {
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
        if (!(o instanceof Industrie)) return false;

        Industrie industrie = (Industrie) o;

        if (idIndustrie != industrie.idIndustrie) return false;
        return !(nume != null ? !nume.equals(industrie.nume) : industrie.nume != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idIndustrie ^ (idIndustrie >>> 32));
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        return result;
    }
}
