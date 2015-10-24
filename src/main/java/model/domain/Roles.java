package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "roles", schema = "", catalog = "raindrop")
public class Roles extends BaseEntity {
    private long idRole;
    private String role;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_role")
    public long getIdRole() {
        return idRole;
    }

    public void setIdRole(long idRole) {
        this.idRole = idRole;
    }

    @Basic
    @Column(name = "role", nullable = false, insertable = true, updatable = true, length = 150)
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Roles roles = (Roles) o;

        return !(role != null ? !role.equals(roles.role) : roles.role != null);

    }

    @Override
    public int hashCode() {
        return role != null ? role.hashCode() : 0;
    }
}
