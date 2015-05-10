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
@Table(name = "u_m_pontaj", schema = "", catalog = "raindrop")
public class UMPontaj {
    private String nume;
    private String valoare;

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
        if (valoare != null ? !valoare.equals(umPontaj.valoare) : umPontaj.valoare != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = nume != null ? nume.hashCode() : 0;
        result = 31 * result + (valoare != null ? valoare.hashCode() : 0);
        return result;
    }
}
