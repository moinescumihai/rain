package model.domain;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "status_proiect", schema = "", catalog = "raindrop")
public class StatusProiect {
    private long idStatusProiect;
    private String numeStatus;
    private List<StatusProiect> statusProiectList;

    @Id

    @Column(name = "id_status_proiect", nullable = false, insertable = true, updatable = true)
    public long getIdStatusProiect() {
        return idStatusProiect;
    }

    public void setIdStatusProiect(long idStatusProiect) {
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
        return !(numeStatus != null ? !numeStatus.equals(that.numeStatus) : that.numeStatus != null);

    }

    @Override
    public int hashCode() {
        int result = (int) idStatusProiect;
        result = 31 * result + (numeStatus != null ? numeStatus.hashCode() : 0);
        return result;
    }
}
