package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Date;
import java.sql.Timestamp;

@Entity
public class Stoc {
    private long idStoc;
    private String numeStoc;
    private String codStoc;
    private int idUMStoc;
    private int idCategorieStoc;
    private String cantitateCurenta;
    private String cantitateComandata;
    private String cantitatePtAlerta;
    private String cantitateUltimaIntrare;
    private String cantitateUltimaIesire;
    private Date dataUltimaIntrare;
    private Date dataUltimaIesire;
    private String valoareBucata;
    private String valoareTotala;
    private String stareProdus;
    private Timestamp dataExpirare;
    private String creatDe;
    private Timestamp creatLa;
    private String modificatDe;
    private Timestamp modificatLa;

    @Id
    @Column(name = "id_stoc", nullable = false, insertable = true, updatable = true)
    public long getIdStoc() {
        return idStoc;
    }

    public void setIdStoc(long idStoc) {
        this.idStoc = idStoc;
    }

    @Basic
    @Column(name = "nume_stoc", nullable = false, insertable = true, updatable = true, length = 150)
    public String getNumeStoc() {
        return numeStoc;
    }

    public void setNumeStoc(String numeStoc) {
        this.numeStoc = numeStoc;
    }

    @Basic
    @Column(name = "cod_stoc", nullable = true, insertable = true, updatable = true, length = 255)
    public String getCodStoc() {
        return codStoc;
    }

    public void setCodStoc(String codStoc) {
        this.codStoc = codStoc;
    }

    @Basic
    @Column(name = "id_u_m_stoc", nullable = false, insertable = true, updatable = true)
    public int getIdUMStoc() {
        return idUMStoc;
    }

    public void setIdUMStoc(int idUMStoc) {
        this.idUMStoc = idUMStoc;
    }

    @Basic
    @Column(name = "id_categorie_stoc", nullable = false, insertable = true, updatable = true)
    public int getIdCategorieStoc() {
        return idCategorieStoc;
    }

    public void setIdCategorieStoc(int idCategorieStoc) {
        this.idCategorieStoc = idCategorieStoc;
    }

    @Basic
    @Column(name = "cantitate_curenta", nullable = false, insertable = true, updatable = true, length = 45)
    public String getCantitateCurenta() {
        return cantitateCurenta;
    }

    public void setCantitateCurenta(String cantitateCurenta) {
        this.cantitateCurenta = cantitateCurenta;
    }

    @Basic
    @Column(name = "cantitate_comandata", nullable = true, insertable = true, updatable = true, length = 45)
    public String getCantitateComandata() {
        return cantitateComandata;
    }

    public void setCantitateComandata(String cantitateComandata) {
        this.cantitateComandata = cantitateComandata;
    }

    @Basic
    @Column(name = "cantitate_pt_alerta", nullable = true, insertable = true, updatable = true, length = 45)
    public String getCantitatePtAlerta() {
        return cantitatePtAlerta;
    }

    public void setCantitatePtAlerta(String cantitatePtAlerta) {
        this.cantitatePtAlerta = cantitatePtAlerta;
    }

    @Basic
    @Column(name = "cantitate_ultima_intrare", nullable = true, insertable = true, updatable = true, length = 45)
    public String getCantitateUltimaIntrare() {
        return cantitateUltimaIntrare;
    }

    public void setCantitateUltimaIntrare(String cantitateUltimaIntrare) {
        this.cantitateUltimaIntrare = cantitateUltimaIntrare;
    }

    @Basic
    @Column(name = "cantitate_ultima_iesire", nullable = true, insertable = true, updatable = true, length = 45)
    public String getCantitateUltimaIesire() {
        return cantitateUltimaIesire;
    }

    public void setCantitateUltimaIesire(String cantitateUltimaIesire) {
        this.cantitateUltimaIesire = cantitateUltimaIesire;
    }

    @Basic
    @Column(name = "data_ultima_intrare", nullable = true, insertable = true, updatable = true)
    public Date getDataUltimaIntrare() {
        return dataUltimaIntrare;
    }

    public void setDataUltimaIntrare(Date dataUltimaIntrare) {
        this.dataUltimaIntrare = dataUltimaIntrare;
    }

    @Basic
    @Column(name = "data_ultima_iesire", nullable = true, insertable = true, updatable = true)
    public Date getDataUltimaIesire() {
        return dataUltimaIesire;
    }

    public void setDataUltimaIesire(Date dataUltimaIesire) {
        this.dataUltimaIesire = dataUltimaIesire;
    }

    @Basic
    @Column(name = "valoare_bucata", nullable = true, insertable = true, updatable = true, length = 45)
    public String getValoareBucata() {
        return valoareBucata;
    }

    public void setValoareBucata(String valoareBucata) {
        this.valoareBucata = valoareBucata;
    }

    @Basic
    @Column(name = "valoare_totala", nullable = true, insertable = true, updatable = true, length = 45)
    public String getValoareTotala() {
        return valoareTotala;
    }

    public void setValoareTotala(String valoareTotala) {
        this.valoareTotala = valoareTotala;
    }

    @Basic
    @Column(name = "stare_produs", nullable = true, insertable = true, updatable = true, length = 45)
    public String getStareProdus() {
        return stareProdus;
    }

    public void setStareProdus(String stareProdus) {
        this.stareProdus = stareProdus;
    }

    @Basic
    @Column(name = "data_expirare", nullable = true, insertable = true, updatable = true)
    public Timestamp getDataExpirare() {
        return dataExpirare;
    }

    public void setDataExpirare(Timestamp dataExpirare) {
        this.dataExpirare = dataExpirare;
    }

    @Basic
    @Column(name = "creat_de", nullable = false, insertable = true, updatable = true, length = 150)
    public String getCreatDe() {
        return creatDe;
    }

    public void setCreatDe(String creatDe) {
        this.creatDe = creatDe;
    }

    @Basic
    @Column(name = "creat_la", nullable = true, insertable = true, updatable = true)
    public Timestamp getCreatLa() {
        return creatLa;
    }

    public void setCreatLa(Timestamp creatLa) {
        this.creatLa = creatLa;
    }

    @Basic
    @Column(name = "modificat_de", nullable = true, insertable = true, updatable = true, length = 150)
    public String getModificatDe() {
        return modificatDe;
    }

    public void setModificatDe(String modificatDe) {
        this.modificatDe = modificatDe;
    }

    @Basic
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

        Stoc stoc = (Stoc) o;

        if (idStoc != stoc.idStoc) return false;
        if (idUMStoc != stoc.idUMStoc) return false;
        if (idCategorieStoc != stoc.idCategorieStoc) return false;
        if (numeStoc != null ? !numeStoc.equals(stoc.numeStoc) : stoc.numeStoc != null) return false;
        if (codStoc != null ? !codStoc.equals(stoc.codStoc) : stoc.codStoc != null) return false;
        if (cantitateCurenta != null ? !cantitateCurenta.equals(stoc.cantitateCurenta) : stoc.cantitateCurenta != null) return false;
        if (cantitateComandata != null ? !cantitateComandata.equals(stoc.cantitateComandata) : stoc.cantitateComandata != null) return false;
        if (cantitatePtAlerta != null ? !cantitatePtAlerta.equals(stoc.cantitatePtAlerta) : stoc.cantitatePtAlerta != null) return false;
        if (cantitateUltimaIntrare != null ? !cantitateUltimaIntrare.equals(stoc.cantitateUltimaIntrare) : stoc.cantitateUltimaIntrare != null) return false;
        if (cantitateUltimaIesire != null ? !cantitateUltimaIesire.equals(stoc.cantitateUltimaIesire) : stoc.cantitateUltimaIesire != null) return false;
        if (dataUltimaIntrare != null ? !dataUltimaIntrare.equals(stoc.dataUltimaIntrare) : stoc.dataUltimaIntrare != null) return false;
        if (dataUltimaIesire != null ? !dataUltimaIesire.equals(stoc.dataUltimaIesire) : stoc.dataUltimaIesire != null) return false;
        if (valoareBucata != null ? !valoareBucata.equals(stoc.valoareBucata) : stoc.valoareBucata != null) return false;
        if (valoareTotala != null ? !valoareTotala.equals(stoc.valoareTotala) : stoc.valoareTotala != null) return false;
        if (stareProdus != null ? !stareProdus.equals(stoc.stareProdus) : stoc.stareProdus != null) return false;
        if (dataExpirare != null ? !dataExpirare.equals(stoc.dataExpirare) : stoc.dataExpirare != null) return false;
        if (creatDe != null ? !creatDe.equals(stoc.creatDe) : stoc.creatDe != null) return false;
        if (creatLa != null ? !creatLa.equals(stoc.creatLa) : stoc.creatLa != null) return false;
        if (modificatDe != null ? !modificatDe.equals(stoc.modificatDe) : stoc.modificatDe != null) return false;
        if (modificatLa != null ? !modificatLa.equals(stoc.modificatLa) : stoc.modificatLa != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idStoc ^ (idStoc >>> 32));
        result = 31 * result + (numeStoc != null ? numeStoc.hashCode() : 0);
        result = 31 * result + (codStoc != null ? codStoc.hashCode() : 0);
        result = 31 * result + idUMStoc;
        result = 31 * result + idCategorieStoc;
        result = 31 * result + (cantitateCurenta != null ? cantitateCurenta.hashCode() : 0);
        result = 31 * result + (cantitateComandata != null ? cantitateComandata.hashCode() : 0);
        result = 31 * result + (cantitatePtAlerta != null ? cantitatePtAlerta.hashCode() : 0);
        result = 31 * result + (cantitateUltimaIntrare != null ? cantitateUltimaIntrare.hashCode() : 0);
        result = 31 * result + (cantitateUltimaIesire != null ? cantitateUltimaIesire.hashCode() : 0);
        result = 31 * result + (dataUltimaIntrare != null ? dataUltimaIntrare.hashCode() : 0);
        result = 31 * result + (dataUltimaIesire != null ? dataUltimaIesire.hashCode() : 0);
        result = 31 * result + (valoareBucata != null ? valoareBucata.hashCode() : 0);
        result = 31 * result + (valoareTotala != null ? valoareTotala.hashCode() : 0);
        result = 31 * result + (stareProdus != null ? stareProdus.hashCode() : 0);
        result = 31 * result + (dataExpirare != null ? dataExpirare.hashCode() : 0);
        result = 31 * result + (creatDe != null ? creatDe.hashCode() : 0);
        result = 31 * result + (creatLa != null ? creatLa.hashCode() : 0);
        result = 31 * result + (modificatDe != null ? modificatDe.hashCode() : 0);
        result = 31 * result + (modificatLa != null ? modificatLa.hashCode() : 0);
        return result;
    }
}
