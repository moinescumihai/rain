package model.domain;

import common.validator.EndDate;
import common.validator.StartDate;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.sql.Date;
import java.sql.Timestamp;

@Entity
public class Proiect {
    private long idProiect;
    private String numeProiect;
    private String descriere;
    private Client idClient;
    private CategorieProiect idCategorieProiect;
    @StartDate(id = 1)
    private Date dataStart;
    @EndDate(minimumDaysRange = 1, id = 1)
    private Date dataEndEstimativa;
    private StatusProiect idStatusProiect;
    private String creatDe;
    private Timestamp creatLa;
    private String modificatDe;
    private Timestamp modificatLa;
    private Integer deleted;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_proiect", nullable = false, insertable = true, updatable = true)
    public long getIdProiect() {
        return idProiect;
    }

    public void setIdProiect(long idProiect) {
        this.idProiect = idProiect;
    }

    @Size(min = 5)
    @NotEmpty
    @Basic
    @Column(name = "nume_proiect", nullable = false, insertable = true, updatable = true, length = 150)
    public String getNumeProiect() {
        return numeProiect;
    }

    public void setNumeProiect(String numeProiect) {
        this.numeProiect = numeProiect;
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
    @JoinColumn(name = "id_client")
    public Client getIdClient() {
        return idClient;
    }

    public void setIdClient(Client idClient) {
        this.idClient = idClient;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_categorie_proiect")
    public CategorieProiect getIdCategorieProiect() {
        return idCategorieProiect;
    }

    public void setIdCategorieProiect(CategorieProiect idCategorieProiect) {
        this.idCategorieProiect = idCategorieProiect;
    }

    @NotNull
    @Basic
    @Column(name = "data_start", nullable = true, insertable = true, updatable = true)
    public Date getDataStart() {
        return dataStart;
    }

    public void setDataStart(Date dataStart) {
        this.dataStart = dataStart;
    }

    @NotNull
    @Basic
    @Column(name = "data_end_estimativa", nullable = true, insertable = true, updatable = true)
    public Date getDataEndEstimativa() {
        return dataEndEstimativa;
    }

    public void setDataEndEstimativa(Date dataEndEstimativa) {
        this.dataEndEstimativa = dataEndEstimativa;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_status_proiect")
    public StatusProiect getIdStatusProiect() {
        return idStatusProiect;
    }

    public void setIdStatusProiect(StatusProiect idStatusProiect) {
        this.idStatusProiect = idStatusProiect;
    }

    @Basic
    @CreatedBy
    @Column(name = "creat_de", nullable = true, insertable = true, updatable = true, length = 150)
    public String getCreatDe() {
        return creatDe;
    }

    public void setCreatDe(String creatDe) {
        this.creatDe = creatDe;
    }

    @Basic
    @CreatedDate
    @Column(name = "creat_la", nullable = true, insertable = true, updatable = true)
    public Timestamp getCreatLa() {
        return creatLa;
    }

    public void setCreatLa(Timestamp creatLa) {
        this.creatLa = creatLa;
    }

    @Basic
    @LastModifiedBy
    @Column(name = "modificat_de", nullable = true, insertable = true, updatable = true, length = 150)
    public String getModificatDe() {
        return modificatDe;
    }

    public void setModificatDe(String modificatDe) {
        this.modificatDe = modificatDe;
    }

    @Basic
    @LastModifiedDate
    @Column(name = "modificat_la", nullable = true, insertable = true, updatable = true)
    public Timestamp getModificatLa() {
        return modificatLa;
    }

    public void setModificatLa(Timestamp modificatLa) {
        this.modificatLa = modificatLa;
    }

    @Basic
    @Column(name = "deleted", nullable = false, insertable = true, updatable = true, columnDefinition = "INT(1) default 0")
    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }
}
