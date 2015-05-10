package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author Ciprian on 5/10/2015.
 *         <p>
 *         rain
 */
@Entity
@Table(name = "map_fav_project_user", schema = "", catalog = "raindrop")
public class MapFavProjectUser {
    private int idUser;
    private long idProiect;

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
