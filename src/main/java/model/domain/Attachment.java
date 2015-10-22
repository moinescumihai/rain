package model.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
@Table(name = "attachment", schema = "", catalog = "raindrop")
public class Attachment extends BaseEntity {
    private long idAttachment;
    private Long idProiect;
    private Long idStoc;
    private Long idUser;
    private Attachment parent;
    private Collection<Attachment> children;
    private int isDirectory;
    private int isArchive;
    private int isReadonly;
    private int isHidden;
    private String path;
    private String fileName;
    private String originalFileName;
    private Long size;
    private Timestamp accesatLa;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_attachment", nullable = false, insertable = true, updatable = true)
    public long getIdAttachment() {
        return idAttachment;
    }

    public void setIdAttachment(long idAttachment) {
        this.idAttachment = idAttachment;
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

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JsonBackReference
    public Attachment getParent() {
        return parent;
    }

    public void setParent(Attachment parent) {
        this.parent = parent;
    }

    @OneToMany(mappedBy = "parent", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonManagedReference
    public Collection<Attachment> getChildren() {
        return children;
    }

    public void setChildren(Collection<Attachment> children) {
        this.children = children;
    }

    @Basic
    @Column(name = "path", nullable = false, insertable = true, updatable = true, columnDefinition = "text", length = 65535)
    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Basic
    @Column(name = "file_name", nullable = false, insertable = true, updatable = true, length = 500)
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Basic
    @Column(name = "id_stoc", nullable = true, insertable = true, updatable = true)
    public Long getIdStoc() {
        return idStoc;
    }

    public void setIdStoc(Long idStoc) {
        this.idStoc = idStoc;
    }

    @Basic
    @Column(name = "original_file_name", nullable = false, insertable = true, updatable = true, length = 500)
    public String getOriginalFileName() {
        return originalFileName;
    }

    public void setOriginalFileName(String originalFileName) {
        this.originalFileName = originalFileName;
    }

    @Basic
    @Column(name = "size", nullable = false, insertable = true, updatable = true)
    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    @Basic
    @Column(name = "is_directory", nullable = false, insertable = true, updatable = true, columnDefinition = "INT(1) default '0'")
    public int getIsDirectory() {
        return isDirectory;
    }

    public void setIsDirectory(int isDirectory) {
        this.isDirectory = isDirectory;
    }

    @Basic
    @Column(name = "is_archive", nullable = false, insertable = true, updatable = true, columnDefinition = "INT(1) default '0'")
    public int getIsArchive() {
        return isArchive;
    }

    public void setIsArchive(int isArchive) {
        this.isArchive = isArchive;
    }

    @Basic
    @Column(name = "is_readonly", nullable = false, insertable = true, updatable = true, columnDefinition = "INT(1) default '0'")
    public int getIsReadonly() {
        return isReadonly;
    }

    public void setIsReadonly(int isReadonly) {
        this.isReadonly = isReadonly;
    }

    @Basic
    @Column(name = "is_hidden", nullable = false, insertable = true, updatable = true, columnDefinition = "INT(1) default '0'")
    public int getIsHidden() {
        return isHidden;
    }

    public void setIsHidden(int isHidden) {
        this.isHidden = isHidden;
    }

    @Basic
    @Column(name = "accesat_la", nullable = true, insertable = true, updatable = true)
    public Timestamp getAccesatLa() {
        return accesatLa;
    }

    public void setAccesatLa(Timestamp accesatLa) {
        this.accesatLa = accesatLa;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Attachment)) return false;

        Attachment that = (Attachment) o;

        if (idAttachment != that.idAttachment) return false;
        if (isDirectory != that.isDirectory) return false;
        if (isArchive != that.isArchive) return false;
        if (isReadonly != that.isReadonly) return false;
        if (isHidden != that.isHidden) return false;
        if (idProiect != null ? !idProiect.equals(that.idProiect) : that.idProiect != null) return false;
        if (idStoc != null ? !idStoc.equals(that.idStoc) : that.idStoc != null) return false;
        if (idUser != null ? !idUser.equals(that.idUser) : that.idUser != null) return false;
        if (parent != null ? !parent.equals(that.parent) : that.parent != null) return false;
        if (children != null ? !children.equals(that.children) : that.children != null) return false;
        if (path != null ? !path.equals(that.path) : that.path != null) return false;
        if (fileName != null ? !fileName.equals(that.fileName) : that.fileName != null) return false;
        if (originalFileName != null ? !originalFileName.equals(that.originalFileName) : that.originalFileName != null) return false;
        if (size != null ? !size.equals(that.size) : that.size != null) return false;
        return !(accesatLa != null ? !accesatLa.equals(that.accesatLa) : that.accesatLa != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idAttachment ^ (idAttachment >>> 32));
        result = 31 * result + (idProiect != null ? idProiect.hashCode() : 0);
        result = 31 * result + (idStoc != null ? idStoc.hashCode() : 0);
        result = 31 * result + (idUser != null ? idUser.hashCode() : 0);
        result = 31 * result + (parent != null ? parent.hashCode() : 0);
        result = 31 * result + (children != null ? children.hashCode() : 0);
        result = 31 * result + isDirectory;
        result = 31 * result + isArchive;
        result = 31 * result + isReadonly;
        result = 31 * result + isHidden;
        result = 31 * result + (path != null ? path.hashCode() : 0);
        result = 31 * result + (fileName != null ? fileName.hashCode() : 0);
        result = 31 * result + (originalFileName != null ? originalFileName.hashCode() : 0);
        result = 31 * result + (size != null ? size.hashCode() : 0);
        result = 31 * result + (accesatLa != null ? accesatLa.hashCode() : 0);
        return result;
    }
}