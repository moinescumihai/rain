package model.domain;

import javax.persistence.*;

/**
 * @author Ciprian on 5/10/2015.
 *         <p>
 *         rain
 */
@Entity
@Table(name = "status_proiect", schema = "", catalog = "raindrop")
public class StatusProiect {
    private byte idStatusProiect;
    private String numeStatus;

    @Id
    @Column(name = "id_status_proiect", nullable = false, insertable = true, updatable = true)
    public byte getIdStatusProiect() {
        return idStatusProiect;
    }

    public void setIdStatusProiect(byte idStatusProiect) {
        this.idStatusProiect = idStatusProiect;
    }

    @Basic
    @Column(name = "nume_status", nullable = false, insertable = true, updatable = true, length = 50)
    public String getNumeStatus() {
        return numeStatus;
    }

    public void setNumeStatus(String numeStatus) {
        this.numeStatus = numeStatus;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        StatusProiect that = (StatusProiect) o;

        if (idStatusProiect != that.idStatusProiect) return false;
        if (numeStatus != null ? !numeStatus.equals(that.numeStatus) : that.numeStatus != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) idStatusProiect;
        result = 31 * result + (numeStatus != null ? numeStatus.hashCode() : 0);
        return result;
    }
}
