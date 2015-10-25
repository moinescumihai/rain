package model.forms;

public class ClientFormModel {
    private long idClient;
    private String numeClient;
    private String website;
    private String email;
    private String telefon;
    private String fax;
    private String adresa;
    private String oras;
    private String judet;
    private String codPostal;
    private long idTara;
    private long idIndustrie;

    public long getIdClient() {
        return idClient;
    }

    public void setIdClient(long idClient) {
        this.idClient = idClient;
    }

    public String getNumeClient() {
        return numeClient;
    }

    public void setNumeClient(String numeClient) {
        this.numeClient = numeClient;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    public String getOras() {
        return oras;
    }

    public void setOras(String oras) {
        this.oras = oras;
    }

    public String getJudet() {
        return judet;
    }

    public void setJudet(String judet) {
        this.judet = judet;
    }

    public String getCodPostal() {
        return codPostal;
    }

    public void setCodPostal(String codPostal) {
        this.codPostal = codPostal;
    }

    public long getIdTara() {
        return idTara;
    }

    public void setIdTara(long idTara) {
        this.idTara = idTara;
    }

    public long getIdIndustrie() {
        return idIndustrie;
    }

    public void setIdIndustrie(long idIndustrie) {
        this.idIndustrie = idIndustrie;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ClientFormModel)) return false;

        ClientFormModel that = (ClientFormModel) o;

        if (idClient != that.idClient) return false;
        if (idTara != that.idTara) return false;
        if (idIndustrie != that.idIndustrie) return false;
        if (numeClient != null ? !numeClient.equals(that.numeClient) : that.numeClient != null) return false;
        if (website != null ? !website.equals(that.website) : that.website != null) return false;
        if (email != null ? !email.equals(that.email) : that.email != null) return false;
        if (telefon != null ? !telefon.equals(that.telefon) : that.telefon != null) return false;
        if (fax != null ? !fax.equals(that.fax) : that.fax != null) return false;
        if (adresa != null ? !adresa.equals(that.adresa) : that.adresa != null) return false;
        if (oras != null ? !oras.equals(that.oras) : that.oras != null) return false;
        if (judet != null ? !judet.equals(that.judet) : that.judet != null) return false;
        return !(codPostal != null ? !codPostal.equals(that.codPostal) : that.codPostal != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idClient ^ (idClient >>> 32));
        result = 31 * result + (numeClient != null ? numeClient.hashCode() : 0);
        result = 31 * result + (website != null ? website.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (telefon != null ? telefon.hashCode() : 0);
        result = 31 * result + (fax != null ? fax.hashCode() : 0);
        result = 31 * result + (adresa != null ? adresa.hashCode() : 0);
        result = 31 * result + (oras != null ? oras.hashCode() : 0);
        result = 31 * result + (judet != null ? judet.hashCode() : 0);
        result = 31 * result + (codPostal != null ? codPostal.hashCode() : 0);
        result = 31 * result + (int) (idTara ^ (idTara >>> 32));
        result = 31 * result + (int) (idIndustrie ^ (idIndustrie >>> 32));
        return result;
    }
}
