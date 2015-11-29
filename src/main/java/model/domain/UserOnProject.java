package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "users_on_projects", schema = "", catalog = "raindrop")
public class UserOnProject extends BaseEntity {
    private long idUserOnProject;
    private Proiect proiect;
    private Persoana persoana;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_user_on_project", nullable = false, insertable = true, updatable = true)
    public long getIdUserOnProject() {
        return idUserOnProject;
    }

    public void setIdUserOnProject(long idUserOnProject) {
        this.idUserOnProject = idUserOnProject;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_proiect")
    public Proiect getProiect() {
        return proiect;
    }

    public void setProiect(Proiect proiect) {
        this.proiect = proiect;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_persoana")
    public Persoana getPersoana() {
        return persoana;
    }

    public void setPersoana(Persoana persoana) {
        this.persoana = persoana;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserOnProject that = (UserOnProject) o;

        if (idUserOnProject != that.idUserOnProject) return false;
        if (proiect != null ? !proiect.equals(that.proiect) : that.proiect != null) return false;
        return !(persoana != null ? !persoana.equals(that.persoana) : that.persoana != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idUserOnProject ^ (idUserOnProject >>> 32));
        result = 31 * result + (proiect != null ? proiect.hashCode() : 0);
        result = 31 * result + (persoana != null ? persoana.hashCode() : 0);
        return result;
    }
}
