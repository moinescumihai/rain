package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "u_m_pontaj", schema = "", catalog = "raindrop")
public class UMPontaj extends BaseEntity {
    private long idUMPontaj;
    private String nume;
    private String valoare;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_u_m_pontaj")
    public long getIdUMPontaj() {
        return idUMPontaj;
    }

    public void setIdUMPontaj(long idUMPontaj) {
        this.idUMPontaj = idUMPontaj;
    }

    @Basic
    @Column(name = "nume", nullable = false, insertable = true, updatable = true, length = 150)
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    @Basic
    @Column(name = "valoare", nullable = false, insertable = true, updatable = true, length = 45)
    public String getValoare() {
        return valoare;
    }

    public void setValoare(String valoare) {
        this.valoare = valoare;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UMPontaj umPontaj = (UMPontaj) o;

        if (nume != null ? !nume.equals(umPontaj.nume) : umPontaj.nume != null) return false;
        return !(valoare != null ? !valoare.equals(umPontaj.valoare) : umPontaj.valoare != null);

    }

    @Override
    public int hashCode() {
        int result = nume != null ? nume.hashCode() : 0;
        result = 31 * result + (valoare != null ? valoare.hashCode() : 0);
        return result;
    }
}
