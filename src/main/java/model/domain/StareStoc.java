package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "stare_stoc", schema = "", catalog = "raindrop")
public class StareStoc {
    private long idStare;
    private String numeStare;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_stare", nullable = false, insertable = true, updatable = true)
    public long getIdStare() {
        return idStare;
    }

    public void setIdStare(long idStare) {
        this.idStare = idStare;
    }

    @Basic
    @Column(name = "nume_stare", nullable = false, insertable = true, updatable = true, length = 255)
    public String getNumeStare() {
        return numeStare;
    }

    public void setNumeStare(String numeStare) {
        this.numeStare = numeStare;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        StareStoc stareStoc = (StareStoc) o;

        if (idStare != stareStoc.idStare) return false;
        if (numeStare != null ? !numeStare.equals(stareStoc.numeStare) : stareStoc.numeStare != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idStare ^ (idStare >>> 32));
        result = 31 * result + (numeStare != null ? numeStare.hashCode() : 0);
        return result;
    }
}
