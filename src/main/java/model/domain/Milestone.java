package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "milestone", schema = "", catalog = "raindrop")
public class Milestone {
    private long idMilestone;
    private long idProiect;
    private String numeMilestone;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_milestone", nullable = false, insertable = true, updatable = true)
    public long getIdMilestone() {
        return idMilestone;
    }

    public void setIdMilestone(long idMilestone) {
        this.idMilestone = idMilestone;
    }

    @Basic
    @Column(name = "id_proiect", nullable = false, insertable = true, updatable = true)
    public long getIdProiect() {
        return idProiect;
    }

    public void setIdProiect(long idProiect) {
        this.idProiect = idProiect;
    }

    @Basic
    @Column(name = "nume_milestone", nullable = false, insertable = true, updatable = true, length = 250)
    public String getNumeMilestone() {
        return numeMilestone;
    }

    public void setNumeMilestone(String numeMilestone) {
        this.numeMilestone = numeMilestone;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Milestone that = (Milestone) o;

        if (idMilestone != that.idMilestone) return false;
        if (idProiect != that.idProiect) return false;
        return !(numeMilestone != null ? !numeMilestone.equals(that.numeMilestone) : that.numeMilestone != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idMilestone ^ (idMilestone >>> 32));
        result = 31 * result + (int) (idProiect ^ (idProiect >>> 32));
        result = 31 * result + (numeMilestone != null ? numeMilestone.hashCode() : 0);
        return result;
    }
}
