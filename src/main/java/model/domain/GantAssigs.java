package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "gant_assigs", schema = "", catalog = "raindrop")
public class GantAssigs {
    private int idAssigs;
    private String resourceId;
    private String id;
    private String roleId;
    private String effort;

    @Id
    @Column(name = "id_assigs", nullable = false, insertable = true, updatable = true)
    public int getIdAssigs() {
        return idAssigs;
    }

    public void setIdAssigs(int idAssigs) {
        this.idAssigs = idAssigs;
    }

    @Basic
    @Column(name = "resourceId", nullable = false, insertable = true, updatable = true, length = 150)
    public String getResourceId() {
        return resourceId;
    }

    public void setResourceId(String resourceId) {
        this.resourceId = resourceId;
    }

    @Basic
    @Column(name = "id", nullable = false, insertable = true, updatable = true, length = 150)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Basic
    @Column(name = "role_id", nullable = false, insertable = true, updatable = true, length = 150)
    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    @Basic
    @Column(name = "effort", nullable = false, insertable = true, updatable = true, length = 150)
    public String getEffort() {
        return effort;
    }

    public void setEffort(String effort) {
        this.effort = effort;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        GantAssigs that = (GantAssigs) o;

        if (idAssigs != that.idAssigs) return false;
        if (resourceId != null ? !resourceId.equals(that.resourceId) : that.resourceId != null) return false;
        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (roleId != null ? !roleId.equals(that.roleId) : that.roleId != null) return false;
        if (effort != null ? !effort.equals(that.effort) : that.effort != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idAssigs;
        result = 31 * result + (resourceId != null ? resourceId.hashCode() : 0);
        result = 31 * result + (id != null ? id.hashCode() : 0);
        result = 31 * result + (roleId != null ? roleId.hashCode() : 0);
        result = 31 * result + (effort != null ? effort.hashCode() : 0);
        return result;
    }
}
