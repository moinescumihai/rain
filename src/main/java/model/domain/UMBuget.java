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
@Table(name = "u_m_buget", schema = "", catalog = "raindrop")
public class UMBuget {
    private String nume;

    @Basic
    @Column(name = "nume", nullable = true, insertable = true, updatable = true, length = 150)
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

        UMBuget umBuget = (UMBuget) o;

        if (nume != null ? !nume.equals(umBuget.nume) : umBuget.nume != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return nume != null ? nume.hashCode() : 0;
    }
}
