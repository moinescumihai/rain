package model.domain;

import javax.persistence.*;

@Entity
public class Colet {
    private long idColet;
    private String numeColet;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_colet", nullable = false, insertable = true, updatable = true)
    public long getIdColet() {
        return idColet;
    }

    public void setIdColet(long idColet) {
        this.idColet = idColet;
    }

    @Basic
    @Column(name = "nume_colet", nullable = false, insertable = true, updatable = true, length = 250)
    public String getNumeColet() {
        return numeColet;
    }

    public void setNumeColet(String numeColet) {
        this.numeColet = numeColet;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Colet colet = (Colet) o;

        if (idColet != colet.idColet) return false;
        return !(numeColet != null ? !numeColet.equals(colet.numeColet) : colet.numeColet != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idColet ^ (idColet >>> 32));
        result = 31 * result + (numeColet != null ? numeColet.hashCode() : 0);
        return result;
    }
}
