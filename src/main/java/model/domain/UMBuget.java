package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "u_m_buget", schema = "", catalog = "raindrop")
public class UMBuget {
    private long idUMBuget;
    private String nume;

    @Id
    @Column(name = "id_u_m_buget")
    public long getIdUMBuget() {
        return idUMBuget;
    }

    public void setIdUMBuget(long idUMBuget) {
        this.idUMBuget = idUMBuget;
    }

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
