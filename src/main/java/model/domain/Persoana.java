package model.domain;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "persoane", schema = "", catalog = "raindrop")
public class Persoana extends BaseEntity implements Comparable<Persoana> {
    private long idPersoana;
    private Attachment userPhoto;
    private String nume;
    private String prenume;
    private Client idClient;
    private String pozitie;
    private String pozitieAnterioara;
    private String cnp;
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
    private User idUser;
    private Date dataNastere;
    private String zileConcediu;
    private Proiect favorit;
    @Transient
    private String fullName;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_persoana", nullable = false, insertable = true, updatable = true)
    public long getIdPersoana() {
        return idPersoana;
    }

    public void setIdPersoana(long idPersoana) {
        this.idPersoana = idPersoana;
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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_client")
    public Client getIdClient() {
        return idClient;
    }

    public void setIdClient(Client idClient) {
        this.idClient = idClient;
    }

    @Basic
    @Column(name = "pozitie", nullable = true, insertable = true, updatable = true, length = 150)
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
    @Column(name = "cnp", nullable = true, insertable = true, updatable = true, length = 20)
    public String getCnp() {
        return cnp;
    }

    public void setCnp(String cnp) {
        this.cnp = cnp;
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
    @Column(name = "data_angajare", nullable = true, insertable = true, updatable = true)
    public Date getDataAngajare() {
        return dataAngajare;
    }

    public void setDataAngajare(Date dataAngajare) {
        this.dataAngajare = dataAngajare;
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
    @Column(name = "data_nastere", nullable = true, insertable = true, updatable = true)
    public Date getDataNastere() {
        return dataNastere;
    }

    public void setDataNastere(Date dataNastere) {
        this.dataNastere = dataNastere;
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
        this.fullName = this.nume + " " + this.prenume;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_photo")
    public Attachment getUserPhoto() {
        return userPhoto;
    }

    public void setUserPhoto(Attachment userPhoto) {
        this.userPhoto = userPhoto;
    }

    @Override
    public int compareTo(Persoana o) {
        return this.getFullName().compareTo(o.getFullName());
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_proiect")
    public Proiect getFavorit() {
        return favorit;
    }

    public void setFavorit(Proiect favorit) {
        this.favorit = favorit;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Persoana persoana = (Persoana) o;

        if (idPersoana != persoana.idPersoana) return false;
        if (userPhoto != null ? !userPhoto.equals(persoana.userPhoto) : persoana.userPhoto != null) return false;
        if (nume != null ? !nume.equals(persoana.nume) : persoana.nume != null) return false;
        if (prenume != null ? !prenume.equals(persoana.prenume) : persoana.prenume != null) return false;
        if (idClient != null ? !idClient.equals(persoana.idClient) : persoana.idClient != null) return false;
        if (pozitie != null ? !pozitie.equals(persoana.pozitie) : persoana.pozitie != null) return false;
        if (pozitieAnterioara != null ? !pozitieAnterioara.equals(persoana.pozitieAnterioara) : persoana.pozitieAnterioara != null) return false;
        if (cnp != null ? !cnp.equals(persoana.cnp) : persoana.cnp != null) return false;
        if (workTel != null ? !workTel.equals(persoana.workTel) : persoana.workTel != null) return false;
        if (mobilTel != null ? !mobilTel.equals(persoana.mobilTel) : persoana.mobilTel != null) return false;
        if (homeTel != null ? !homeTel.equals(persoana.homeTel) : persoana.homeTel != null) return false;
        if (fax != null ? !fax.equals(persoana.fax) : persoana.fax != null) return false;
        if (adresa != null ? !adresa.equals(persoana.adresa) : persoana.adresa != null) return false;
        if (oras != null ? !oras.equals(persoana.oras) : persoana.oras != null) return false;
        if (judet != null ? !judet.equals(persoana.judet) : persoana.judet != null) return false;
        if (codPostal != null ? !codPostal.equals(persoana.codPostal) : persoana.codPostal != null) return false;
        if (idTara != null ? !idTara.equals(persoana.idTara) : persoana.idTara != null) return false;
        if (dataAngajare != null ? !dataAngajare.equals(persoana.dataAngajare) : persoana.dataAngajare != null) return false;
        if (idUser != null ? !idUser.equals(persoana.idUser) : persoana.idUser != null) return false;
        if (dataNastere != null ? !dataNastere.equals(persoana.dataNastere) : persoana.dataNastere != null) return false;
        if (zileConcediu != null ? !zileConcediu.equals(persoana.zileConcediu) : persoana.zileConcediu != null) return false;
        if (favorit != null ? !favorit.equals(persoana.favorit) : persoana.favorit != null) return false;
        return !(fullName != null ? !fullName.equals(persoana.fullName) : persoana.fullName != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idPersoana ^ (idPersoana >>> 32));
        result = 31 * result + (userPhoto != null ? userPhoto.hashCode() : 0);
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + (prenume != null ? prenume.hashCode() : 0);
        result = 31 * result + (idClient != null ? idClient.hashCode() : 0);
        result = 31 * result + (pozitie != null ? pozitie.hashCode() : 0);
        result = 31 * result + (pozitieAnterioara != null ? pozitieAnterioara.hashCode() : 0);
        result = 31 * result + (cnp != null ? cnp.hashCode() : 0);
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
        result = 31 * result + (idUser != null ? idUser.hashCode() : 0);
        result = 31 * result + (dataNastere != null ? dataNastere.hashCode() : 0);
        result = 31 * result + (zileConcediu != null ? zileConcediu.hashCode() : 0);
        result = 31 * result + (favorit != null ? favorit.hashCode() : 0);
        result = 31 * result + (fullName != null ? fullName.hashCode() : 0);
        return result;
    }
}
