package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "to_do", schema = "", catalog = "raindrop")
public class ToDo {
    private long idToDo;
    private String nume;
    private String valoare;
    private long idUser;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id_to_do", nullable = false, insertable = true, updatable = true)
    public long getIdToDo() {
        return idToDo;
    }

    public void setIdToDo(long idToDo) {
        this.idToDo = idToDo;
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
    @Column(name = "valoare", nullable = false, insertable = true, updatable = true, length = 65535)
    public String getValoare() {
        return valoare;
    }

    public void setValoare(String valoare) {
        this.valoare = valoare;
    }

    @Basic
    @Column(name = "id_user", nullable = false, insertable = true, updatable = true)
    public long getIdUser() {
        return idUser;
    }

    public void setIdUser(long idUser) {
        this.idUser = idUser;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ToDo toDo = (ToDo) o;

        if (idToDo != toDo.idToDo) return false;
        if (idUser != toDo.idUser) return false;
        if (nume != null ? !nume.equals(toDo.nume) : toDo.nume != null) return false;
        if (valoare != null ? !valoare.equals(toDo.valoare) : toDo.valoare != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idToDo ^ (idToDo >>> 32));
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + (valoare != null ? valoare.hashCode() : 0);
        result = 31 * result + (int) (idUser ^ (idUser >>> 32));
        return result;
    }
}
