package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "map_fav_project_user", schema = "", catalog = "raindrop")
public class MapFavProjectUser {
    private long idMapFavProjectUser;
    private int idUser;
    private long idProiect;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id_map_fav_project_user")
    public long getIdMapFavProjectUser() {
        return idMapFavProjectUser;
    }

    public void setIdMapFavProjectUser(long idMapFavProjectUser) {
        this.idMapFavProjectUser = idMapFavProjectUser;
    }

    @Basic
    @Column(name = "id_user", nullable = false, insertable = true, updatable = true)
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    @Basic
    @Column(name = "id_proiect", nullable = false, insertable = true, updatable = true)
    public long getIdProiect() {
        return idProiect;
    }

    public void setIdProiect(long idProiect) {
        this.idProiect = idProiect;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MapFavProjectUser that = (MapFavProjectUser) o;

        if (idUser != that.idUser) return false;
        if (idProiect != that.idProiect) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idUser;
        result = 31 * result + (int) (idProiect ^ (idProiect >>> 32));
        return result;
    }
}
