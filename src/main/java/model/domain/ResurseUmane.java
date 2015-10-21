package model.domain;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "resurse_umane", schema = "", catalog = "raindrop")
public class ResurseUmane extends BaseEntity {
    private long idResurseUmane;
    private String nume;
    private String prenume;
    private String prenume2;
    private String email;
    private Client idClient;
    private String pozitie;
    private String pozitieAnterioara;
    private String cnp;
    private String serieCi;
    private String nrCi;
    private String workTel;
    private String mobilTel;
    private String homeTel;
    private String fax;
    private String adresa;
    private String oras;
    private String judet;
    private String codPostal;
    private Tara idTara;
    private Date dataAngajare;
    private TipContract tipContract;
    private User idUser;
    private Date dataNastere;
    private Integer esteDepartament;
    private Integer esteContact;
    private String zileConcediu;
    @Transient
    private String fullName;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_resurse_umane", nullable = false, insertable = true, updatable = true)
    public long getIdResurseUmane() {
        return idResurseUmane;
    }

    public void setIdResurseUmane(long idResurseUmane) {
        this.idResurseUmane = idResurseUmane;
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
    @Column(name = "prenume", nullable = false, insertable = true, updatable = true, length = 150)
    public String getPrenume() {
        return prenume;
    }

    public void setPrenume(String prenume) {
        this.prenume = prenume;
    }

    @Basic
    @Column(name = "prenume2", nullable = false, insertable = true, updatable = true, length = 150)
    public String getPrenume2() {
        return prenume2;
    }

    public void setPrenume2(String prenume2) {
        this.prenume2 = prenume2;
    }

    @Basic
    @Column(name = "email", nullable = true, insertable = true, updatable = true, length = 150)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_client")
    public Client getIdClient() {
        return idClient;
    }

    public void setIdClient(Client idClient) {
        this.idClient = idClient;
    }

    @Basic
    @Column(name = "pozitie", nullable = false, insertable = true, updatable = true, length = 150)
    public String getPozitie() {
        return pozitie;
    }

    public void setPozitie(String pozitie) {
        this.pozitie = pozitie;
    }

    @Basic
    @Column(name = "pozitie_anterioara", nullable = true, insertable = true, updatable = true, length = 150)
    public String getPozitieAnterioara() {
        return pozitieAnterioara;
    }

    public void setPozitieAnterioara(String pozitieAnterioara) {
        this.pozitieAnterioara = pozitieAnterioara;
    }

    @Basic
    @Column(name = "cnp", nullable = false, insertable = true, updatable = true, length = 20)
    public String getCnp() {
        return cnp;
    }

    public void setCnp(String cnp) {
        this.cnp = cnp;
    }

    @Basic
    @Column(name = "serie_ci", nullable = true, insertable = true, updatable = true, length = 45)
    public String getSerieCi() {
        return serieCi;
    }

    public void setSerieCi(String serieCi) {
        this.serieCi = serieCi;
    }

    @Basic
    @Column(name = "nr_ci", nullable = true, insertable = true, updatable = true, length = 45)
    public String getNrCi() {
        return nrCi;
    }

    public void setNrCi(String nrCi) {
        this.nrCi = nrCi;
    }

    @Basic
    @Column(name = "work_tel", nullable = true, insertable = true, updatable = true, length = 45)
    public String getWorkTel() {
        return workTel;
    }

    public void setWorkTel(String workTel) {
        this.workTel = workTel;
    }

    @Basic
    @Column(name = "mobil_tel", nullable = true, insertable = true, updatable = true, length = 45)
    public String getMobilTel() {
        return mobilTel;
    }

    public void setMobilTel(String mobilTel) {
        this.mobilTel = mobilTel;
    }

    @Basic
    @Column(name = "home_tel", nullable = true, insertable = true, updatable = true, length = 45)
    public String getHomeTel() {
        return homeTel;
    }

    public void setHomeTel(String homeTel) {
        this.homeTel = homeTel;
    }

    @Basic
    @Column(name = "fax", nullable = true, insertable = true, updatable = true, length = 45)
    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    @Basic
    @Column(name = "adresa", nullable = true, insertable = true, updatable = true, length = 250)
    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    @Basic
    @Column(name = "oras", nullable = true, insertable = true, updatable = true, length = 45)
    public String getOras() {
        return oras;
    }

    public void setOras(String oras) {
        this.oras = oras;
    }

    @Basic
    @Column(name = "judet", nullable = true, insertable = true, updatable = true, length = 45)
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

    @Basic
    @Column(name = "data_angajare", nullable = false, insertable = true, updatable = true)
    public Date getDataAngajare() {
        return dataAngajare;
    }

    public void setDataAngajare(Date dataAngajare) {
        this.dataAngajare = dataAngajare;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "tip_contract")
    public TipContract getTipContract() {
        return tipContract;
    }

    public void setTipContract(TipContract tipContract) {
        this.tipContract = tipContract;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_user")
    public User getIdUser() {
        return idUser;
    }

    public void setIdUser(User idUser) {
        this.idUser = idUser;
    }

    @Basic
    @Column(name = "data_nastere", nullable = false, insertable = true, updatable = true)
    public Date getDataNastere() {
        return dataNastere;
    }

    public void setDataNastere(Date dataNastere) {
        this.dataNastere = dataNastere;
    }

    @Basic
    @Column(name = "este_departament", nullable = true, insertable = true, updatable = true)
    public Integer getEsteDepartament() {
        return esteDepartament;
    }

    public void setEsteDepartament(Integer esteDepartament) {
        this.esteDepartament = esteDepartament;
    }

    @Basic
    @Column(name = "este_contact", nullable = true, insertable = true, updatable = true)
    public Integer getEsteContact() {
        return esteContact;
    }

    public void setEsteContact(Integer esteContact) {
        this.esteContact = esteContact;
    }

    @Basic
    @Column(name = "zile_concediu", nullable = true, insertable = true, updatable = true, length = 45)
    public String getZileConcediu() {
        return zileConcediu;
    }

    public void setZileConcediu(String zileConcediu) {
        this.zileConcediu = zileConcediu;
    }

    @PostLoad
    public void setFullName() {
        this.fullName = this.prenume + " " + this.nume;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ResurseUmane)) return false;

        ResurseUmane that = (ResurseUmane) o;

        if (idResurseUmane != that.idResurseUmane) return false;
        if (nume != null ? !nume.equals(that.nume) : that.nume != null) return false;
        if (prenume != null ? !prenume.equals(that.prenume) : that.prenume != null) return false;
        if (prenume2 != null ? !prenume2.equals(that.prenume2) : that.prenume2 != null) return false;
        if (fullName != null ? !fullName.equals(that.fullName) : that.fullName != null) return false;
        if (email != null ? !email.equals(that.email) : that.email != null) return false;
        if (idClient != null ? !idClient.equals(that.idClient) : that.idClient != null) return false;
        if (pozitie != null ? !pozitie.equals(that.pozitie) : that.pozitie != null) return false;
        if (pozitieAnterioara != null ? !pozitieAnterioara.equals(that.pozitieAnterioara) : that.pozitieAnterioara != null) return false;
        if (cnp != null ? !cnp.equals(that.cnp) : that.cnp != null) return false;
        if (serieCi != null ? !serieCi.equals(that.serieCi) : that.serieCi != null) return false;
        if (nrCi != null ? !nrCi.equals(that.nrCi) : that.nrCi != null) return false;
        if (workTel != null ? !workTel.equals(that.workTel) : that.workTel != null) return false;
        if (mobilTel != null ? !mobilTel.equals(that.mobilTel) : that.mobilTel != null) return false;
        if (homeTel != null ? !homeTel.equals(that.homeTel) : that.homeTel != null) return false;
        if (fax != null ? !fax.equals(that.fax) : that.fax != null) return false;
        if (adresa != null ? !adresa.equals(that.adresa) : that.adresa != null) return false;
        if (oras != null ? !oras.equals(that.oras) : that.oras != null) return false;
        if (judet != null ? !judet.equals(that.judet) : that.judet != null) return false;
        if (codPostal != null ? !codPostal.equals(that.codPostal) : that.codPostal != null) return false;
        if (idTara != null ? !idTara.equals(that.idTara) : that.idTara != null) return false;
        if (dataAngajare != null ? !dataAngajare.equals(that.dataAngajare) : that.dataAngajare != null) return false;
        if (tipContract != null ? !tipContract.equals(that.tipContract) : that.tipContract != null) return false;
        if (idUser != null ? !idUser.equals(that.idUser) : that.idUser != null) return false;
        if (dataNastere != null ? !dataNastere.equals(that.dataNastere) : that.dataNastere != null) return false;
        if (esteDepartament != null ? !esteDepartament.equals(that.esteDepartament) : that.esteDepartament != null) return false;
        if (esteContact != null ? !esteContact.equals(that.esteContact) : that.esteContact != null) return false;
        return !(zileConcediu != null ? !zileConcediu.equals(that.zileConcediu) : that.zileConcediu != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idResurseUmane ^ (idResurseUmane >>> 32));
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + (prenume != null ? prenume.hashCode() : 0);
        result = 31 * result + (prenume2 != null ? prenume2.hashCode() : 0);
        result = 31 * result + (fullName != null ? fullName.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (idClient != null ? idClient.hashCode() : 0);
        result = 31 * result + (pozitie != null ? pozitie.hashCode() : 0);
        result = 31 * result + (pozitieAnterioara != null ? pozitieAnterioara.hashCode() : 0);
        result = 31 * result + (cnp != null ? cnp.hashCode() : 0);
        result = 31 * result + (serieCi != null ? serieCi.hashCode() : 0);
        result = 31 * result + (nrCi != null ? nrCi.hashCode() : 0);
        result = 31 * result + (workTel != null ? workTel.hashCode() : 0);
        result = 31 * result + (mobilTel != null ? mobilTel.hashCode() : 0);
        result = 31 * result + (homeTel != null ? homeTel.hashCode() : 0);
        result = 31 * result + (fax != null ? fax.hashCode() : 0);
        result = 31 * result + (adresa != null ? adresa.hashCode() : 0);
        result = 31 * result + (oras != null ? oras.hashCode() : 0);
        result = 31 * result + (judet != null ? judet.hashCode() : 0);
        result = 31 * result + (codPostal != null ? codPostal.hashCode() : 0);
        result = 31 * result + (idTara != null ? idTara.hashCode() : 0);
        result = 31 * result + (dataAngajare != null ? dataAngajare.hashCode() : 0);
        result = 31 * result + (tipContract != null ? tipContract.hashCode() : 0);
        result = 31 * result + (idUser != null ? idUser.hashCode() : 0);
        result = 31 * result + (dataNastere != null ? dataNastere.hashCode() : 0);
        result = 31 * result + (esteDepartament != null ? esteDepartament.hashCode() : 0);
        result = 31 * result + (esteContact != null ? esteContact.hashCode() : 0);
        result = 31 * result + (zileConcediu != null ? zileConcediu.hashCode() : 0);
        return result;
    }
}
