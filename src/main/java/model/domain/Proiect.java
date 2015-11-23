package model.domain;

import common.validator.EndDate;
import common.validator.StartDate;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "proiect", schema = "", catalog = "raindrop")
public class Proiect extends BaseEntity {
    private long idProiect;
    private String numeProiect;
    private String codroiect;
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

    @Basic
    @Column(name = "data_start", nullable = true, insertable = true, updatable = true)
    public Date getDataStart() {
        return dataStart;
    }

    public void setDataStart(Date dataStart) {
        this.dataStart = dataStart;
    }

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

    @Basic
    @Column(name = "cod_proiect", nullable = false, insertable = true, updatable = true)
    public String getCodroiect() {
        return codroiect;
    }

    public void setCodroiect(String codroiect) {
        this.codroiect = codroiect;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Proiect)) return false;

        Proiect proiect = (Proiect) o;

        if (idProiect != proiect.idProiect) return false;
        if (deleted != proiect.deleted) return false;
        if (numeProiect != null ? !numeProiect.equals(proiect.numeProiect) : proiect.numeProiect != null) return false;
        if (codroiect != null ? !codroiect.equals(proiect.codroiect) : proiect.codroiect != null) return false;
        if (descriere != null ? !descriere.equals(proiect.descriere) : proiect.descriere != null) return false;
        if (idClient != null ? !idClient.equals(proiect.idClient) : proiect.idClient != null) return false;
        if (idCategorieProiect != null ? !idCategorieProiect.equals(proiect.idCategorieProiect) : proiect.idCategorieProiect != null) return false;
        if (dataStart != null ? !dataStart.equals(proiect.dataStart) : proiect.dataStart != null) return false;
        if (dataEndEstimativa != null ? !dataEndEstimativa.equals(proiect.dataEndEstimativa) : proiect.dataEndEstimativa != null) return false;
        return !(idStatusProiect != null ? !idStatusProiect.equals(proiect.idStatusProiect) : proiect.idStatusProiect != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idProiect ^ (idProiect >>> 32));
        result = 31 * result + (numeProiect != null ? numeProiect.hashCode() : 0);
        result = 31 * result + (codroiect != null ? codroiect.hashCode() : 0);
        result = 31 * result + (descriere != null ? descriere.hashCode() : 0);
        result = 31 * result + (idClient != null ? idClient.hashCode() : 0);
        result = 31 * result + (idCategorieProiect != null ? idCategorieProiect.hashCode() : 0);
        result = 31 * result + (dataStart != null ? dataStart.hashCode() : 0);
        result = 31 * result + (dataEndEstimativa != null ? dataEndEstimativa.hashCode() : 0);
        result = 31 * result + (idStatusProiect != null ? idStatusProiect.hashCode() : 0);
        result = 31 * result + deleted;
        return result;
    }
}
