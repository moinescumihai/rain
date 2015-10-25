package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "lista_tari", schema = "", catalog = "raindrop")
public class Tara extends BaseEntity {
    private long idTara;
    private String nume;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_tara", nullable = false, insertable = true, updatable = true)
    public long getIdTara() {
        return idTara;
    }

    public void setIdTara(long idTara) {
        this.idTara = idTara;
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
        if (!(o instanceof Tara)) return false;

        Tara tara = (Tara) o;

        if (idTara != tara.idTara) return false;
        return !(nume != null ? !nume.equals(tara.nume) : tara.nume != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idTara ^ (idTara >>> 32));
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        return result;
    }
}
