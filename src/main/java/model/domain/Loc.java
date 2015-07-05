package model.domain;

import javax.persistence.*;

/**
 * @author Ciprian on 7/4/2015.
 *         <p>
 *         rain
 */
@Entity
public class Loc {
    private long idLoc;
    private String numeLoc;
    private String latitude;
    private String longitude;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_loc", nullable = false, insertable = true, updatable = true)
    public long getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(long idLoc) {
        this.idLoc = idLoc;
    }

    @Basic
    @Column(name = "nume_loc", nullable = false, insertable = true, updatable = true, length = 255)
    public String getNumeLoc() {
        return numeLoc;
    }

    public void setNumeLoc(String numeLoc) {
        this.numeLoc = numeLoc;
    }

    @Basic
    @Column(name = "latitude", nullable = false, insertable = true, updatable = true, length = 255)
    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    @Basic
    @Column(name = "longitude", nullable = false, insertable = true, updatable = true, length = 255)
    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Loc loc = (Loc) o;

        if (idLoc != loc.idLoc) return false;
        if (numeLoc != null ? !numeLoc.equals(loc.numeLoc) : loc.numeLoc != null) return false;
        if (latitude != null ? !latitude.equals(loc.latitude) : loc.latitude != null) return false;
        if (longitude != null ? !longitude.equals(loc.longitude) : loc.longitude != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idLoc ^ (idLoc >>> 32));
        result = 31 * result + (numeLoc != null ? numeLoc.hashCode() : 0);
        result = 31 * result + (latitude != null ? latitude.hashCode() : 0);
        result = 31 * result + (longitude != null ? longitude.hashCode() : 0);
        return result;
    }
}
