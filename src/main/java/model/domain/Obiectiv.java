package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "obiectiv", schema = "", catalog = "raindrop")
public class Obiectiv extends BaseEntity {
    private long idObiectiv;
    private String nume;
    private String descriere;
    private Proiect idProiect;
    private Milestone idMilestone;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_proiect")
    public Proiect getIdProiect() {
        return idProiect;
    }

    public void setIdProiect(Proiect idProiect) {
        this.idProiect = idProiect;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_milestone")
    public Milestone getIdMilestone() {
        return idMilestone;
    }

    public void setIdMilestone(Milestone idMilestone) {
        this.idMilestone = idMilestone;
    }

}
