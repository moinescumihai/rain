package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "gant_proiect", schema = "", catalog = "raindrop")
public class GantProiect {
    private long idGantProiect;
    private long idProiect;
    private String tasks;
    private String resources;
    private String roles;
    private String canWrite;
    private String canWriteOnParent;
    private int selectedRow;
    private String deletedTaskIds;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id_gant_proiect", nullable = false, insertable = true, updatable = true)
    public long getIdGantProiect() {
        return idGantProiect;
    }

    public void setIdGantProiect(long idGantProiect) {
        this.idGantProiect = idGantProiect;
    }

    @Basic
    @Column(name = "id_proiect", nullable = false, insertable = true, updatable = true)
    public long getIdProiect() {
        return idProiect;
    }

    public void setIdProiect(long idProiect) {
        this.idProiect = idProiect;
    }

    @Basic
    @Column(name = "tasks", nullable = false, insertable = true, updatable = true, length = 255)
    public String getTasks() {
        return tasks;
    }

    public void setTasks(String tasks) {
        this.tasks = tasks;
    }

    @Basic
    @Column(name = "resources", nullable = false, insertable = true, updatable = true, length = 255)
    public String getResources() {
        return resources;
    }

    public void setResources(String resources) {
        this.resources = resources;
    }

    @Basic
    @Column(name = "roles", nullable = false, insertable = true, updatable = true, length = 255)
    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    @Basic
    @Column(name = "canWrite", nullable = false, insertable = true, updatable = true, length = 5)
    public String getCanWrite() {
        return canWrite;
    }

    public void setCanWrite(String canWrite) {
        this.canWrite = canWrite;
    }

    @Basic
    @Column(name = "canWriteOnParent", nullable = false, insertable = true, updatable = true, length = 5)
    public String getCanWriteOnParent() {
        return canWriteOnParent;
    }

    public void setCanWriteOnParent(String canWriteOnParent) {
        this.canWriteOnParent = canWriteOnParent;
    }

    @Basic
    @Column(name = "selectedRow", nullable = false, insertable = true, updatable = true)
    public int getSelectedRow() {
        return selectedRow;
    }

    public void setSelectedRow(int selectedRow) {
        this.selectedRow = selectedRow;
    }

    @Basic
    @Column(name = "deletedTaskIds", nullable = false, insertable = true, updatable = true, length = 255)
    public String getDeletedTaskIds() {
        return deletedTaskIds;
    }

    public void setDeletedTaskIds(String deletedTaskIds) {
        this.deletedTaskIds = deletedTaskIds;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        GantProiect that = (GantProiect) o;

        if (idGantProiect != that.idGantProiect) return false;
        if (idProiect != that.idProiect) return false;
        if (selectedRow != that.selectedRow) return false;
        if (tasks != null ? !tasks.equals(that.tasks) : that.tasks != null) return false;
        if (resources != null ? !resources.equals(that.resources) : that.resources != null) return false;
        if (roles != null ? !roles.equals(that.roles) : that.roles != null) return false;
        if (canWrite != null ? !canWrite.equals(that.canWrite) : that.canWrite != null) return false;
        if (canWriteOnParent != null ? !canWriteOnParent.equals(that.canWriteOnParent) : that.canWriteOnParent != null) return false;
        if (deletedTaskIds != null ? !deletedTaskIds.equals(that.deletedTaskIds) : that.deletedTaskIds != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idGantProiect ^ (idGantProiect >>> 32));
        result = 31 * result + (int) (idProiect ^ (idProiect >>> 32));
        result = 31 * result + (tasks != null ? tasks.hashCode() : 0);
        result = 31 * result + (resources != null ? resources.hashCode() : 0);
        result = 31 * result + (roles != null ? roles.hashCode() : 0);
        result = 31 * result + (canWrite != null ? canWrite.hashCode() : 0);
        result = 31 * result + (canWriteOnParent != null ? canWriteOnParent.hashCode() : 0);
        result = 31 * result + selectedRow;
        result = 31 * result + (deletedTaskIds != null ? deletedTaskIds.hashCode() : 0);
        return result;
    }
}
