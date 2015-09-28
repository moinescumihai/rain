package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "grup_stoc", schema = "", catalog = "raindrop")
public class GrupStoc {
    private long idGrupStoc;
    private String numeGrup;

    @Id

    @Column(name = "id_grup_stoc", nullable = false, insertable = true, updatable = true)
    public long getIdGrupStoc() {
        return idGrupStoc;
    }

    public void setIdGrupStoc(long idGrupStoc) {
        this.idGrupStoc = idGrupStoc;
    }

    @Basic
    @Column(name = "nume_grup", nullable = false, insertable = true, updatable = true, length = 255)
    public String getNumeGrup() {
        return numeGrup;
    }

    public void setNumeGrup(String numeGrup) {
        this.numeGrup = numeGrup;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        GrupStoc grupStoc = (GrupStoc) o;

        if (idGrupStoc != grupStoc.idGrupStoc) return false;
        return !(numeGrup != null ? !numeGrup.equals(grupStoc.numeGrup) : grupStoc.numeGrup != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idGrupStoc ^ (idGrupStoc >>> 32));
        result = 31 * result + (numeGrup != null ? numeGrup.hashCode() : 0);
        return result;
    }
}
