package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Obiectiv {
    private long idObiectiv;
    private String nume;
    private String descriere;
    private long idProiect;
    private long idMilestone;

    @Id

    @Column(name = "id_obiectiv")
    public long getIdObiectiv() {
        return idObiectiv;
    }

    public void setIdObiectiv(long idObiectiv) {
        this.idObiectiv = idObiectiv;
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

    @Basic
    @Column(name = "id_proiect", nullable = false, insertable = true, updatable = true)
    public long getIdProiect() {
        return idProiect;
    }

    public void setIdProiect(long idProiect) {
        this.idProiect = idProiect;
    }

    @Basic
    @Column(name = "id_milestone", nullable = false, insertable = true, updatable = true)
    public long getIdMilestone() {
        return idMilestone;
    }

    public void setIdMilestone(long idMilestone) {
        this.idMilestone = idMilestone;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Obiectiv obiectiv = (Obiectiv) o;

        if (idProiect != obiectiv.idProiect) return false;
        if (idMilestone != obiectiv.idMilestone) return false;
        if (nume != null ? !nume.equals(obiectiv.nume) : obiectiv.nume != null) return false;
        return !(descriere != null ? !descriere.equals(obiectiv.descriere) : obiectiv.descriere != null);

    }

    @Override
    public int hashCode() {
        int result = nume != null ? nume.hashCode() : 0;
        result = 31 * result + (descriere != null ? descriere.hashCode() : 0);
        result = 31 * result + (int) (idProiect ^ (idProiect >>> 32));
        result = 31 * result + (int) (idMilestone ^ (idMilestone >>> 32));
        return result;
    }
}
