package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "grup_stoc", schema = "", catalog = "raindrop")
public class GrupStoc extends BaseEntity {
    private long idGrupStoc;
    private String numeGrup;
    private CategorieStoc idCategorieStoc;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_grup_stoc", nullable = false, insertable = true, updatable = true)
    public long getIdGrupStoc() {
        return idGrupStoc;
    }

    public void setIdGrupStoc(long idGrupStoc) {
        this.idGrupStoc = idGrupStoc;
    }

    @Basic
    @Column(name = "nume_grup", nullable = false, insertable = true, updatable = true, length = 255)
    public String getNumeGrup() {
        return numeGrup;
    }

    public void setNumeGrup(String numeGrup) {
        this.numeGrup = numeGrup;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_categorie_stoc")
    public CategorieStoc getIdCategorieStoc() {
        return idCategorieStoc;
    }

    public void setIdCategorieStoc(CategorieStoc idCategorieStoc) {
        this.idCategorieStoc = idCategorieStoc;
    }
}
