package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "client", schema = "", catalog = "raindrop")
public class Client extends BaseEntity {
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
    private Tara idTara;
    private Industrie idIndustrie;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_client", nullable = false, insertable = true, updatable = true)
    public long getIdClient() {
        return idClient;
    }

    public void setIdClient(long idClient) {
        this.idClient = idClient;
    }

    @Basic
    @Column(name = "nume_client", nullable = false, insertable = true, updatable = true, length = 150)
    public String getNumeClient() {
        return numeClient;
    }

    public void setNumeClient(String numeClient) {
        this.numeClient = numeClient;
    }

    @Basic
    @Column(name = "website", nullable = true, insertable = true, updatable = true, length = 150)
    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    @Basic
    @Column(name = "email", nullable = true, insertable = true, updatable = true, length = 150)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "telefon", nullable = true, insertable = true, updatable = true, length = 20)
    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    @Basic
    @Column(name = "fax", nullable = true, insertable = true, updatable = true, length = 20)
    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    @Basic
    @Column(name = "adresa", nullable = true, insertable = true, updatable = true, length = 150)
    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    @Basic
    @Column(name = "oras", nullable = true, insertable = true, updatable = true, length = 150)
    public String getOras() {
        return oras;
    }

    public void setOras(String oras) {
        this.oras = oras;
    }

    @Basic
    @Column(name = "judet", nullable = true, insertable = true, updatable = true, length = 150)
    public String getJudet() {
        return judet;
    }

    public void setJudet(String judet) {
        this.judet = judet;
    }

    @Basic
    @Column(name = "cod_postal", nullable = true, insertable = true, updatable = true, length = 45)
    public String getCodPostal() {
        return codPostal;
    }

    public void setCodPostal(String codPostal) {
        this.codPostal = codPostal;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_tara")
    public Tara getIdTara() {
        return idTara;
    }

    public void setIdTara(Tara idTara) {
        this.idTara = idTara;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_industrie")
    public Industrie getIdIndustrie() {
        return idIndustrie;
    }

    public void setIdIndustrie(Industrie idIndustrie) {
        this.idIndustrie = idIndustrie;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Client)) return false;

        Client client = (Client) o;

        if (idClient != client.idClient) return false;
        if (numeClient != null ? !numeClient.equals(client.numeClient) : client.numeClient != null) return false;
        if (website != null ? !website.equals(client.website) : client.website != null) return false;
        if (email != null ? !email.equals(client.email) : client.email != null) return false;
        if (telefon != null ? !telefon.equals(client.telefon) : client.telefon != null) return false;
        if (fax != null ? !fax.equals(client.fax) : client.fax != null) return false;
        if (adresa != null ? !adresa.equals(client.adresa) : client.adresa != null) return false;
        if (oras != null ? !oras.equals(client.oras) : client.oras != null) return false;
        if (judet != null ? !judet.equals(client.judet) : client.judet != null) return false;
        if (codPostal != null ? !codPostal.equals(client.codPostal) : client.codPostal != null) return false;
        if (idTara != null ? !idTara.equals(client.idTara) : client.idTara != null) return false;
        return !(idIndustrie != null ? !idIndustrie.equals(client.idIndustrie) : client.idIndustrie != null);

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
        result = 31 * result + (idTara != null ? idTara.hashCode() : 0);
        result = 31 * result + (idIndustrie != null ? idIndustrie.hashCode() : 0);
        return result;
    }
}
