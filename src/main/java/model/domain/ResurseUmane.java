package model.domain;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;

@Entity
@Table(name = "resurse_umane", schema = "", catalog = "raindrop")
public class ResurseUmane {
    private long idResurseUmane;
    private String nume;
    private String prenume;
    private String prenume2;
    private String email;
    private int idClient;
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
    private String idTara;
    private Date dataAngajare;
    private String tipContract;
    private Long idUser;
    private Date dataNastere;
    private Byte esteDepartament;
    private Byte esteContact;
    private String zileConcediu;
    private String creatDe;
    private Timestamp creatLa;
    private String modificatDe;
    private Timestamp modificatLa;

    @Id
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

    @Basic
    @Column(name = "id_client", nullable = false, insertable = true, updatable = true)
    public int getIdClient() {
        return idClient;
    }

    public void setIdClient(int idClient) {
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

    @Basic
    @Column(name = "id_tara", nullable = true, insertable = true, updatable = true, length = 45)
    public String getIdTara() {
        return idTara;
    }

    public void setIdTara(String idTara) {
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

    @Basic
    @Column(name = "tip_contract", nullable = true, insertable = true, updatable = true, length = 150)
    public String getTipContract() {
        return tipContract;
    }

    public void setTipContract(String tipContract) {
        this.tipContract = tipContract;
    }

    @Basic
    @Column(name = "id_user", nullable = true, insertable = true, updatable = true)
    public Long getIdUser() {
        return idUser;
    }

    public void setIdUser(Long idUser) {
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
    public Byte getEsteDepartament() {
        return esteDepartament;
    }

    public void setEsteDepartament(Byte esteDepartament) {
        this.esteDepartament = esteDepartament;
    }

    @Basic
    @Column(name = "este_contact", nullable = true, insertable = true, updatable = true)
    public Byte getEsteContact() {
        return esteContact;
    }

    public void setEsteContact(Byte esteContact) {
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

    @Basic
    @CreatedBy
    @Column(name = "creat_de", nullable = false, insertable = true, updatable = true, length = 150)
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ResurseUmane that = (ResurseUmane) o;

        if (idResurseUmane != that.idResurseUmane) return false;
        if (idClient != that.idClient) return false;
        if (nume != null ? !nume.equals(that.nume) : that.nume != null) return false;
        if (prenume != null ? !prenume.equals(that.prenume) : that.prenume != null) return false;
        if (prenume2 != null ? !prenume2.equals(that.prenume2) : that.prenume2 != null) return false;
        if (email != null ? !email.equals(that.email) : that.email != null) return false;
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
        if (zileConcediu != null ? !zileConcediu.equals(that.zileConcediu) : that.zileConcediu != null) return false;
        if (creatDe != null ? !creatDe.equals(that.creatDe) : that.creatDe != null) return false;
        if (creatLa != null ? !creatLa.equals(that.creatLa) : that.creatLa != null) return false;
        if (modificatDe != null ? !modificatDe.equals(that.modificatDe) : that.modificatDe != null) return false;
        return !(modificatLa != null ? !modificatLa.equals(that.modificatLa) : that.modificatLa != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idResurseUmane ^ (idResurseUmane >>> 32));
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + (prenume != null ? prenume.hashCode() : 0);
        result = 31 * result + (prenume2 != null ? prenume2.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + idClient;
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
        result = 31 * result + (creatDe != null ? creatDe.hashCode() : 0);
        result = 31 * result + (creatLa != null ? creatLa.hashCode() : 0);
        result = 31 * result + (modificatDe != null ? modificatDe.hashCode() : 0);
        result = 31 * result + (modificatLa != null ? modificatLa.hashCode() : 0);
        return result;
    }
}
