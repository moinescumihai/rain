package model.domain;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "tranzactie_stoc", schema = "", catalog = "raindrop")
public class TranzactieStoc extends BaseEntity {
    private long idTranzactieStoc;
    private Colet idColet;
    private Stoc idStoc;
    private Loc idLoc;
    private ResurseUmane idResurseUmane;
    private StareStoc idStare;
    private StareStoc idStareAnterioara;
    private String detalii;
    private Timestamp dataTranzactie;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_tranzactie_stoc", nullable = false, insertable = true, updatable = true)
    public long getIdTranzactieStoc() {
        return idTranzactieStoc;
    }

    public void setIdTranzactieStoc(long idTranzactieStoc) {
        this.idTranzactieStoc = idTranzactieStoc;
    }

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "id_colet")
    public Colet getIdColet() {
        return idColet;
    }

    public void setIdColet(Colet idColet) {
        this.idColet = idColet;
    }

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "id_stoc")
    public Stoc getIdStoc() {
        return idStoc;
    }

    public void setIdStoc(Stoc idStoc) {
        this.idStoc = idStoc;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_loc")
    public Loc getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(Loc idLoc) {
        this.idLoc = idLoc;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_resurse_umnane")
    public ResurseUmane getIdResurseUmane() {
        return idResurseUmane;
    }

    public void setIdResurseUmane(ResurseUmane idResurseUmane) {
        this.idResurseUmane = idResurseUmane;
    }

    @Basic
    @Column(name = "data_tranzactie", nullable = false, insertable = true, updatable = true)
    public Timestamp getDataTranzactie() {
        return dataTranzactie;
    }

    public void setDataTranzactie(Timestamp dataTranzactie) {
        this.dataTranzactie = dataTranzactie;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_stare")
    public StareStoc getIdStare() {
        return idStare;
    }

    public void setIdStare(StareStoc idStare) {
        this.idStare = idStare;
    }


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_stare_anterioara")
    public StareStoc getIdStareAnterioara() {
        return idStareAnterioara;
    }

    public void setIdStareAnterioara(StareStoc idStareAnterioara) {
        this.idStareAnterioara = idStareAnterioara;
    }

    @Basic
    @Column(name = "detalii", nullable = false, insertable = true, updatable = true)
    public String getDetalii() {
        return detalii;
    }

    public void setDetalii(String detalii) {
        this.detalii = detalii;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TranzactieStoc)) return false;

        TranzactieStoc that = (TranzactieStoc) o;

        if (idTranzactieStoc != that.idTranzactieStoc) return false;
        if (idColet != null ? !idColet.equals(that.idColet) : that.idColet != null) return false;
        if (idStoc != null ? !idStoc.equals(that.idStoc) : that.idStoc != null) return false;
        if (idLoc != null ? !idLoc.equals(that.idLoc) : that.idLoc != null) return false;
        if (idResurseUmane != null ? !idResurseUmane.equals(that.idResurseUmane) : that.idResurseUmane != null) return false;
        if (idStare != null ? !idStare.equals(that.idStare) : that.idStare != null) return false;
        if (idStareAnterioara != null ? !idStareAnterioara.equals(that.idStareAnterioara) : that.idStareAnterioara != null) return false;
        if (detalii != null ? !detalii.equals(that.detalii) : that.detalii != null) return false;
        return !(dataTranzactie != null ? !dataTranzactie.equals(that.dataTranzactie) : that.dataTranzactie != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idTranzactieStoc ^ (idTranzactieStoc >>> 32));
        result = 31 * result + (idColet != null ? idColet.hashCode() : 0);
        result = 31 * result + (idStoc != null ? idStoc.hashCode() : 0);
        result = 31 * result + (idLoc != null ? idLoc.hashCode() : 0);
        result = 31 * result + (idResurseUmane != null ? idResurseUmane.hashCode() : 0);
        result = 31 * result + (idStare != null ? idStare.hashCode() : 0);
        result = 31 * result + (idStareAnterioara != null ? idStareAnterioara.hashCode() : 0);
        result = 31 * result + (detalii != null ? detalii.hashCode() : 0);
        result = 31 * result + (dataTranzactie != null ? dataTranzactie.hashCode() : 0);
        return result;
    }
}
