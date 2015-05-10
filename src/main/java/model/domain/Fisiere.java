package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;

@Entity
public class Fisiere {
    private long idFile;
    private String filename;
    private String location;
    private Long idProiect;
    private Long idUser;
    private int versiune;
    private Long idVersiunePrecedenta;
    private String creatDe;
    private Timestamp creatLa;

    @Id
    @Column(name = "id_file", nullable = false, insertable = true, updatable = true)
    public long getIdFile() {
        return idFile;
    }

    public void setIdFile(long idFile) {
        this.idFile = idFile;
    }

    @Basic
    @Column(name = "filename", nullable = false, insertable = true, updatable = true, length = 250)
    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    @Basic
    @Column(name = "location", nullable = false, insertable = true, updatable = true, length = 250)
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Basic
    @Column(name = "id_proiect", nullable = true, insertable = true, updatable = true)
    public Long getIdProiect() {
        return idProiect;
    }

    public void setIdProiect(Long idProiect) {
        this.idProiect = idProiect;
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
    @Column(name = "versiune", nullable = false, insertable = true, updatable = true)
    public int getVersiune() {
        return versiune;
    }

    public void setVersiune(int versiune) {
        this.versiune = versiune;
    }

    @Basic
    @Column(name = "id_versiune_precedenta", nullable = true, insertable = true, updatable = true)
    public Long getIdVersiunePrecedenta() {
        return idVersiunePrecedenta;
    }

    public void setIdVersiunePrecedenta(Long idVersiunePrecedenta) {
        this.idVersiunePrecedenta = idVersiunePrecedenta;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Fisiere fisiere = (Fisiere) o;

        if (idFile != fisiere.idFile) return false;
        if (versiune != fisiere.versiune) return false;
        if (filename != null ? !filename.equals(fisiere.filename) : fisiere.filename != null) return false;
        if (location != null ? !location.equals(fisiere.location) : fisiere.location != null) return false;
        if (idProiect != null ? !idProiect.equals(fisiere.idProiect) : fisiere.idProiect != null) return false;
        if (idUser != null ? !idUser.equals(fisiere.idUser) : fisiere.idUser != null) return false;
        if (idVersiunePrecedenta != null ? !idVersiunePrecedenta.equals(fisiere.idVersiunePrecedenta) : fisiere.idVersiunePrecedenta != null) return false;
        if (creatDe != null ? !creatDe.equals(fisiere.creatDe) : fisiere.creatDe != null) return false;
        if (creatLa != null ? !creatLa.equals(fisiere.creatLa) : fisiere.creatLa != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idFile ^ (idFile >>> 32));
        result = 31 * result + (filename != null ? filename.hashCode() : 0);
        result = 31 * result + (location != null ? location.hashCode() : 0);
        result = 31 * result + (idProiect != null ? idProiect.hashCode() : 0);
        result = 31 * result + (idUser != null ? idUser.hashCode() : 0);
        result = 31 * result + versiune;
        result = 31 * result + (idVersiunePrecedenta != null ? idVersiunePrecedenta.hashCode() : 0);
        result = 31 * result + (creatDe != null ? creatDe.hashCode() : 0);
        result = 31 * result + (creatLa != null ? creatLa.hashCode() : 0);
        return result;
    }
}
