package model.domain;

import common.validator.EndDate;
import common.validator.StartDate;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.sql.Date;

@Entity
@Table(name = "proiect", schema = "", catalog = "raindrop")
public class Proiect extends BaseEntity {
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
    private int deleted;

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
    @Column(name = "deleted", nullable = false, insertable = true, updatable = true, columnDefinition = "INT(1) default '0'")
    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }
}
