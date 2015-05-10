package model.common;

import java.sql.Timestamp;
import java.util.Arrays;

public class FileBean {
    private long idFile;
    private String filename;
    private String location;
    private Long idProiect;
    private Long idUser;
    private int versiune;
    private Long idVersiunePrecedenta;
    private String creatDe;
    private Timestamp creatLa;
    private byte[] file;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof FileBean)) return false;

        FileBean fileBean = (FileBean) o;

        if (idFile != fileBean.idFile) return false;
        if (versiune != fileBean.versiune) return false;
        if (!filename.equals(fileBean.filename)) return false;
        if (!location.equals(fileBean.location)) return false;
        if (idProiect != null ? !idProiect.equals(fileBean.idProiect) : fileBean.idProiect != null) return false;
        if (idUser != null ? !idUser.equals(fileBean.idUser) : fileBean.idUser != null) return false;
        if (idVersiunePrecedenta != null ? !idVersiunePrecedenta.equals(fileBean.idVersiunePrecedenta) : fileBean.idVersiunePrecedenta != null) return false;
        if (!creatDe.equals(fileBean.creatDe)) return false;
        if (!creatLa.equals(fileBean.creatLa)) return false;
        return Arrays.equals(file, fileBean.file);

    }

    @Override
    public int hashCode() {
        int result = (int) (idFile ^ (idFile >>> 32));
        result = 31 * result + filename.hashCode();
        result = 31 * result + location.hashCode();
        result = 31 * result + (idProiect != null ? idProiect.hashCode() : 0);
        result = 31 * result + (idUser != null ? idUser.hashCode() : 0);
        result = 31 * result + versiune;
        result = 31 * result + (idVersiunePrecedenta != null ? idVersiunePrecedenta.hashCode() : 0);
        result = 31 * result + creatDe.hashCode();
        result = 31 * result + creatLa.hashCode();
        result = 31 * result + (file != null ? Arrays.hashCode(file) : 0);
        return result;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("FileBean{");
        sb.append("idFile=").append(idFile);
        sb.append(", filename='").append(filename).append('\'');
        sb.append(", location='").append(location).append('\'');
        sb.append(", idProiect=").append(idProiect);
        sb.append(", idUser=").append(idUser);
        sb.append(", versiune=").append(versiune);
        sb.append(", idVersiunePrecedenta=").append(idVersiunePrecedenta);
        sb.append(", creatDe='").append(creatDe).append('\'');
        sb.append(", creatLa=").append(creatLa);
        sb.append(", file=");
        if (file == null) sb.append("null");
        else {
            sb.append('[');
            for (int i = 0; i < file.length; ++i)
                sb.append(i == 0 ? "" : ", ").append(file[i]);
            sb.append(']');
        }
        sb.append('}');
        return sb.toString();
    }

    public long getIdFile() {
        return idFile;
    }

    public void setIdFile(long idFile) {
        this.idFile = idFile;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Long getIdProiect() {
        return idProiect;
    }

    public void setIdProiect(Long idProiect) {
        this.idProiect = idProiect;
    }

    public Long getIdUser() {
        return idUser;
    }

    public void setIdUser(Long idUser) {
        this.idUser = idUser;
    }

    public int getVersiune() {
        return versiune;
    }

    public void setVersiune(int versiune) {
        this.versiune = versiune;
    }

    public Long getIdVersiunePrecedenta() {
        return idVersiunePrecedenta;
    }

    public void setIdVersiunePrecedenta(Long idVersiunePrecedenta) {
        this.idVersiunePrecedenta = idVersiunePrecedenta;
    }

    public String getCreatDe() {
        return creatDe;
    }

    public void setCreatDe(String creatDe) {
        this.creatDe = creatDe;
    }

    public Timestamp getCreatLa() {
        return creatLa;
    }

    public void setCreatLa(Timestamp creatLa) {
        this.creatLa = creatLa;
    }

    public byte[] getFile() {
        return file;
    }

    public void setFile(byte[] file) {
        this.file = file;
    }
}
