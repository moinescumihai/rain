package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "risc", schema = "", catalog = "raindrop")
public class Risc extends BaseEntity {
    private long idRisc;
    private Proiect idProiect;
    private String nume;
    private String descriere;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_risc", nullable = false, insertable = true, updatable = true)
    public long getIdRisc() {
        return idRisc;
    }

    public void setIdRisc(long idRisc) {
        this.idRisc = idRisc;
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
        if (!(o instanceof Risc)) return false;

        Risc risc = (Risc) o;

        if (idRisc != risc.idRisc) return false;
        if (idProiect != null ? !idProiect.equals(risc.idProiect) : risc.idProiect != null) return false;
        if (nume != null ? !nume.equals(risc.nume) : risc.nume != null) return false;
        return !(descriere != null ? !descriere.equals(risc.descriere) : risc.descriere != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idRisc ^ (idRisc >>> 32));
        result = 31 * result + (idProiect != null ? idProiect.hashCode() : 0);
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + (descriere != null ? descriere.hashCode() : 0);
        return result;
    }
}
