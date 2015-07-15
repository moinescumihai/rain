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
    private Long idClient;
    private Long idCategorieProiect;
    @StartDate(id = 1)
    private Date dataStart;
    @EndDate(minimumDaysRange = 1, id = 1)
    private Date dataEndEstimativa;
    private Long idStatusProiect;
    private String creatDe;
    private Timestamp creatLa;
    private String modificatDe;
    private Timestamp modificatLa;
    private byte deleted;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
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

    @Basic
    @Column(name = "id_client", nullable = false, insertable = true, updatable = true, length = 20)
    public Long getIdClient() {
        return idClient;
    }

    public void setIdClient(Long idClient) {
        this.idClient = idClient;
    }

    @Basic
    @Column(name = "id_categorie_proiect", nullable = false, insertable = true, updatable = true, length = 20)
    public Long getIdCategorieProiect() {
        return idCategorieProiect;
    }

    public void setIdCategorieProiect(Long idCategorieProiect) {
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

    @Basic
    @Column(name = "id_status_proiect", nullable = false, insertable = true, updatable = true, length = 20)
    public Long getIdStatusProiect() {
        return idStatusProiect;
    }

    public void setIdStatusProiect(Long idStatusProiect) {
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
    @Column(name = "deleted", nullable = false, insertable = true, updatable = true)
    public byte getDeleted() {
        return deleted;
    }

    public void setDeleted(byte deleted) {
        this.deleted = deleted;
    }

    @Override
    public boolean equals(Object o) {

        if (this == o) return true;
        if (!(o instanceof Proiect)) return false;

        Proiect proiect = (Proiect) o;

        if (idProiect != proiect.idProiect) return false;
        if (deleted != proiect.deleted) return false;
        if (numeProiect != null ? !numeProiect.equals(proiect.numeProiect) : proiect.numeProiect != null) return false;
        if (descriere != null ? !descriere.equals(proiect.descriere) : proiect.descriere != null) return false;
        if (idClient != null ? !idClient.equals(proiect.idClient) : proiect.idClient != null) return false;
        if (idCategorieProiect != null ? !idCategorieProiect.equals(proiect.idCategorieProiect) : proiect.idCategorieProiect != null) return false;
        if (dataStart != null ? !dataStart.equals(proiect.dataStart) : proiect.dataStart != null) return false;
        if (dataEndEstimativa != null ? !dataEndEstimativa.equals(proiect.dataEndEstimativa) : proiect.dataEndEstimativa != null) return false;
        if (idStatusProiect != null ? !idStatusProiect.equals(proiect.idStatusProiect) : proiect.idStatusProiect != null) return false;
        if (creatDe != null ? !creatDe.equals(proiect.creatDe) : proiect.creatDe != null) return false;
        if (creatLa != null ? !creatLa.equals(proiect.creatLa) : proiect.creatLa != null) return false;
        if (modificatDe != null ? !modificatDe.equals(proiect.modificatDe) : proiect.modificatDe != null) return false;
        return !(modificatLa != null ? !modificatLa.equals(proiect.modificatLa) : proiect.modificatLa != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idProiect ^ (idProiect >>> 32));
        result = 31 * result + (numeProiect != null ? numeProiect.hashCode() : 0);
        result = 31 * result + (descriere != null ? descriere.hashCode() : 0);
        result = 31 * result + (idClient != null ? idClient.hashCode() : 0);
        result = 31 * result + (idCategorieProiect != null ? idCategorieProiect.hashCode() : 0);
        result = 31 * result + (dataStart != null ? dataStart.hashCode() : 0);
        result = 31 * result + (dataEndEstimativa != null ? dataEndEstimativa.hashCode() : 0);
        result = 31 * result + (idStatusProiect != null ? idStatusProiect.hashCode() : 0);
        result = 31 * result + (creatDe != null ? creatDe.hashCode() : 0);
        result = 31 * result + (creatLa != null ? creatLa.hashCode() : 0);
        result = 31 * result + (modificatDe != null ? modificatDe.hashCode() : 0);
        result = 31 * result + (modificatLa != null ? modificatLa.hashCode() : 0);
        result = 31 * result + (int) deleted;
        return result;
    }
}
