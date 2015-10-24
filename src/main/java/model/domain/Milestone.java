package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "milestone", schema = "", catalog = "raindrop")
public class Milestone {
    private long idMilestone;
    private Proiect idProiect;
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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_proiect")
    public Proiect getIdProiect() {
        return idProiect;
    }

    public void setIdProiect(Proiect idProiect) {
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
        if (!(o instanceof Milestone)) return false;

        Milestone milestone = (Milestone) o;

        if (idMilestone != milestone.idMilestone) return false;
        if (idProiect != null ? !idProiect.equals(milestone.idProiect) : milestone.idProiect != null) return false;
        return !(numeMilestone != null ? !numeMilestone.equals(milestone.numeMilestone) : milestone.numeMilestone != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idMilestone ^ (idMilestone >>> 32));
        result = 31 * result + (idProiect != null ? idProiect.hashCode() : 0);
        result = 31 * result + (numeMilestone != null ? numeMilestone.hashCode() : 0);
        return result;
    }
}
