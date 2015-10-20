package model.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
public class Attachment {
    private long idAttachment;
    private Long idProiect;
    private Long idStoc;
    private Long idUser;
    private Attachment parent;
    private Collection<Attachment> children;
    private Integer isDirectory;
    private Integer isArchive;
    private Integer isReadonly;
    private String path;
    private String fileName;
    private String originalFileName;
    private Long size;
    private String creatDe;
    private Timestamp creatLa;
    private String modificatDe;
    private Timestamp modificatLa;
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
    @Column(name = "path", nullable = false, insertable = true, updatable = true, length = 65535)
    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Basic
    @Column(name = "creat_de", nullable = false, insertable = true, updatable = true, length = 250)
    public String getCreatDe() {
        return creatDe;
    }

    public void setCreatDe(String creatDe) {
        this.creatDe = creatDe;
    }

    @Basic
    @Column(name = "creat_la", nullable = false, insertable = true, updatable = true)
    public Timestamp getCreatLa() {
        return creatLa;
    }

    public void setCreatLa(Timestamp creatLa) {
        this.creatLa = creatLa;
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
    @Column(name = "modificat_de", nullable = true, insertable = true, updatable = true, length = 250)
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

    @Basic
    @Column(name = "is_directory", nullable = false, insertable = true, updatable = true, columnDefinition = "INT(1) default 0")
    public Integer getIsDirectory() {
        return isDirectory;
    }

    public void setIsDirectory(Integer isDirectory) {
        this.isDirectory = isDirectory;
    }

    @Basic
    @Column(name = "is_archive", nullable = false, insertable = true, updatable = true, columnDefinition = "INT(1) default 0")
    public Integer getIsArchive() {
        return isArchive;
    }

    public void setIsArchive(Integer isArchive) {
        this.isArchive = isArchive;
    }

    @Basic
    @Column(name = "is_readonly", nullable = false, insertable = true, updatable = true, columnDefinition = "INT(1) default 0")
    public Integer getIsReadonly() {
        return isReadonly;
    }

    public void setIsReadonly(Integer isReadonly) {
        this.isReadonly = isReadonly;
    }

    @Basic
    @Column(name = "accesat_la", nullable = true, insertable = true, updatable = true)
    public Timestamp getAccesatLa() {
        return accesatLa;
    }

    public void setAccesatLa(Timestamp accesatLa) {
        this.accesatLa = accesatLa;
    }
}