package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "lista_tari", schema = "", catalog = "raindrop")
public class ListaTari {
    private int idTara;
    private String nume;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id_tara", nullable = false, insertable = true, updatable = true)
    public int getIdTara() {
        return idTara;
    }

    public void setIdTara(int idTara) {
        this.idTara = idTara;
    }

    @Basic
    @Column(name = "nume", nullable = false, insertable = true, updatable = true, length = 150)
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ListaTari listaTari = (ListaTari) o;

        if (idTara != listaTari.idTara) return false;
        if (nume != null ? !nume.equals(listaTari.nume) : listaTari.nume != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idTara;
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        return result;
    }
}
