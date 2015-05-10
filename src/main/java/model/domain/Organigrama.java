package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Organigrama {
    private long idOrganigrama;
    private long idParinte;
    private long idFiu;

    @Id
    @Column(name = "id_organigrama")
    public long getIdOrganigrama() {
        return idOrganigrama;
    }

    public void setIdOrganigrama(long id_organigrama) {
        this.idOrganigrama = id_organigrama;
    }

    @Basic
    @Column(name = "id_parinte", nullable = false, insertable = true, updatable = true)
    public long getIdParinte() {
        return idParinte;
    }

    public void setIdParinte(long idParinte) {
        this.idParinte = idParinte;
    }

    @Basic
    @Column(name = "id_fiu", nullable = false, insertable = true, updatable = true)
    public long getIdFiu() {
        return idFiu;
    }

    public void setIdFiu(long idFiu) {
        this.idFiu = idFiu;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Organigrama that = (Organigrama) o;

        if (idParinte != that.idParinte) return false;
        if (idFiu != that.idFiu) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idParinte ^ (idParinte >>> 32));
        result = 31 * result + (int) (idFiu ^ (idFiu >>> 32));
        return result;
    }
}
