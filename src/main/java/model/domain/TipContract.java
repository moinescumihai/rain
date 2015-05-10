package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author Ciprian on 5/10/2015.
 *         <p>
 *         rain
 */
@Entity
@Table(name = "tip_contract", schema = "", catalog = "raindrop")
public class TipContract {
    private String numeTipContract;
    private String durataContract;
    private String descriereTipContract;

    @Basic
    @Column(name = "nume_tip_contract", nullable = false, insertable = true, updatable = true, length = 255)
    public String getNumeTipContract() {
        return numeTipContract;
    }

    public void setNumeTipContract(String numeTipContract) {
        this.numeTipContract = numeTipContract;
    }

    @Basic
    @Column(name = "durata_contract", nullable = false, insertable = true, updatable = true, length = 45)
    public String getDurataContract() {
        return durataContract;
    }

    public void setDurataContract(String durataContract) {
        this.durataContract = durataContract;
    }

    @Basic
    @Column(name = "descriere_tip_contract", nullable = true, insertable = true, updatable = true, length = 65535)
    public String getDescriereTipContract() {
        return descriereTipContract;
    }

    public void setDescriereTipContract(String descriereTipContract) {
        this.descriereTipContract = descriereTipContract;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TipContract that = (TipContract) o;

        if (numeTipContract != null ? !numeTipContract.equals(that.numeTipContract) : that.numeTipContract != null) return false;
        if (durataContract != null ? !durataContract.equals(that.durataContract) : that.durataContract != null) return false;
        if (descriereTipContract != null ? !descriereTipContract.equals(that.descriereTipContract) : that.descriereTipContract != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = numeTipContract != null ? numeTipContract.hashCode() : 0;
        result = 31 * result + (durataContract != null ? durataContract.hashCode() : 0);
        result = 31 * result + (descriereTipContract != null ? descriereTipContract.hashCode() : 0);
        return result;
    }
}
