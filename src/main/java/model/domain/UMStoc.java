package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "u_m_stoc", schema = "", catalog = "raindrop")
public class UMStoc {
    private long idUMStoc;
    private String nume;
    private String sistem;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id_u_m_stoc")
    public long getIdUMStoc() {
        return idUMStoc;
    }

    public void setIdUMStoc(long idUMStoc) {
        this.idUMStoc = idUMStoc;
    }

    @Basic
    @Column(name = "nume", nullable = false, insertable = true, updatable = true, length = 45)
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    @Basic
    @Column(name = "sistem", nullable = false, insertable = true, updatable = true, length = 8)
    public String getSistem() {
        return sistem;
    }

    public void setSistem(String sistem) {
        this.sistem = sistem;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UMStoc umStoc = (UMStoc) o;

        if (nume != null ? !nume.equals(umStoc.nume) : umStoc.nume != null) return false;
        if (sistem != null ? !sistem.equals(umStoc.sistem) : umStoc.sistem != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = nume != null ? nume.hashCode() : 0;
        result = 31 * result + (sistem != null ? sistem.hashCode() : 0);
        return result;
    }
}
