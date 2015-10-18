package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "categorie_stoc", schema = "", catalog = "raindrop")
public class CategorieStoc {
    private long idCategorieStoc;
    private Long codCategorie;
    private String numeCategorie;
    private Long idCategorieParinte;
    private Byte esteSubcategorie;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_categorie_stoc", nullable = false, insertable = true, updatable = true)
    public long getIdCategorieStoc() {
        return idCategorieStoc;
    }

    public void setIdCategorieStoc(long idCategorieStoc) {
        this.idCategorieStoc = idCategorieStoc;
    }

    @Basic
    @Column(name = "nume_categorie", nullable = false, insertable = true, updatable = true, length = 255)
    public String getNumeCategorie() {
        return numeCategorie;
    }

    public void setNumeCategorie(String numeCategorie) {
        this.numeCategorie = numeCategorie;
    }

    @Basic
    @Column(name = "id_categorie_parinte", nullable = true, insertable = true, updatable = true)
    public Long getIdCategorieParinte() {
        return idCategorieParinte;
    }

    public void setIdCategorieParinte(Long idCategorieParinte) {
        this.idCategorieParinte = idCategorieParinte;
    }

    @Basic
    @Column(name = "este_subcategorie", nullable = true, insertable = true, updatable = true)
    public Byte getEsteSubcategorie() {
        return esteSubcategorie;
    }

    public void setEsteSubcategorie(Byte esteSubcategorie) {
        this.esteSubcategorie = esteSubcategorie;
    }

    @Basic
    @Column(name = "cod_categorie", nullable = true, insertable = true, updatable = true)
    public Long getCodCategorie() {
        return codCategorie;
    }

    public void setCodCategorie(Long codCategorie) {
        this.codCategorie = codCategorie;
    }
}
