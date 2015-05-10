package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * @author Ciprian on 5/10/2015.
 *         <p>
 *         rain
 */
@Entity
public class Risc {
    private long idRisc;
    private long idProiect;
    private String nume;
    private String descriere;

    @Id
    @Column(name = "id_risc", nullable = false, insertable = true, updatable = true)
    public long getIdRisc() {
        return idRisc;
    }

    public void setIdRisc(long idRisc) {
        this.idRisc = idRisc;
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
    @Column(name = "nume", nullable = false, insertable = true, updatable = true, length = 150)
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    @Basic
    @Column(name = "descriere", nullable = true, insertable = true, updatable = true, length = 2147483647)
    public String getDescriere() {
        return descriere;
    }

    public void setDescriere(String descriere) {
        this.descriere = descriere;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Risc risc = (Risc) o;

        if (idRisc != risc.idRisc) return false;
        if (idProiect != risc.idProiect) return false;
        if (nume != null ? !nume.equals(risc.nume) : risc.nume != null) return false;
        if (descriere != null ? !descriere.equals(risc.descriere) : risc.descriere != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idRisc ^ (idRisc >>> 32));
        result = 31 * result + (int) (idProiect ^ (idProiect >>> 32));
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + (descriere != null ? descriere.hashCode() : 0);
        return result;
    }
}
