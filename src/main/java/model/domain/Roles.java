package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;

/**
 * @author Ciprian on 5/10/2015.
 *         <p>
 *         rain
 */
@Entity
public class Roles {
    private String role;

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

        if (role != null ? !role.equals(roles.role) : roles.role != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return role != null ? role.hashCode() : 0;
    }
}
