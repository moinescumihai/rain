package model.forms;

import java.sql.Date;

public class ProiectFormModel {
    private long idProiect;
    private String numeProiect;
    private String descriere;
    private long idClient;
    private long idCategorieProiect;
    private Date dataStart;
    private Date dataEndEstimativa;
    private long idStatusProiect;
    private int deleted;

    public long getIdProiect() {
        return idProiect;
    }

    public void setIdProiect(long idProiect) {
        this.idProiect = idProiect;
    }

    public String getNumeProiect() {
        return numeProiect;
    }

    public void setNumeProiect(String numeProiect) {
        this.numeProiect = numeProiect;
    }

    public String getDescriere() {
        return descriere;
    }

    public void setDescriere(String descriere) {
        this.descriere = descriere;
    }

    public long getIdClient() {
        return idClient;
    }

    public void setIdClient(long idClient) {
        this.idClient = idClient;
    }

    public long getIdCategorieProiect() {
        return idCategorieProiect;
    }

    public void setIdCategorieProiect(long idCategorieProiect) {
        this.idCategorieProiect = idCategorieProiect;
    }

    public Date getDataStart() {
        return dataStart;
    }

    public void setDataStart(Date dataStart) {
        this.dataStart = dataStart;
    }

    public Date getDataEndEstimativa() {
        return dataEndEstimativa;
    }

    public void setDataEndEstimativa(Date dataEndEstimativa) {
        this.dataEndEstimativa = dataEndEstimativa;
    }

    public long getIdStatusProiect() {
        return idStatusProiect;
    }

    public void setIdStatusProiect(long idStatusProiect) {
        this.idStatusProiect = idStatusProiect;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ProiectFormModel)) return false;

        ProiectFormModel that = (ProiectFormModel) o;

        if (idProiect != that.idProiect) return false;
        if (idClient != that.idClient) return false;
        if (idCategorieProiect != that.idCategorieProiect) return false;
        if (idStatusProiect != that.idStatusProiect) return false;
        if (deleted != that.deleted) return false;
        if (numeProiect != null ? !numeProiect.equals(that.numeProiect) : that.numeProiect != null) return false;
        if (descriere != null ? !descriere.equals(that.descriere) : that.descriere != null) return false;
        if (dataStart != null ? !dataStart.equals(that.dataStart) : that.dataStart != null) return false;
        return !(dataEndEstimativa != null ? !dataEndEstimativa.equals(that.dataEndEstimativa) : that.dataEndEstimativa != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idProiect ^ (idProiect >>> 32));
        result = 31 * result + (numeProiect != null ? numeProiect.hashCode() : 0);
        result = 31 * result + (descriere != null ? descriere.hashCode() : 0);
        result = 31 * result + (int) (idClient ^ (idClient >>> 32));
        result = 31 * result + (int) (idCategorieProiect ^ (idCategorieProiect >>> 32));
        result = 31 * result + (dataStart != null ? dataStart.hashCode() : 0);
        result = 31 * result + (dataEndEstimativa != null ? dataEndEstimativa.hashCode() : 0);
        result = 31 * result + (int) (idStatusProiect ^ (idStatusProiect >>> 32));
        result = 31 * result + deleted;
        return result;
    }
}
