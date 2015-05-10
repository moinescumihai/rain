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
@Table(name = "user_role", schema = "", catalog = "raindrop")
public class UserRole {
    private String username;
    private String role;

    @Basic
    @Column(name = "username", nullable = false, insertable = true, updatable = true, length = 150)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

        UserRole userRole = (UserRole) o;

        if (username != null ? !username.equals(userRole.username) : userRole.username != null) return false;
        if (role != null ? !role.equals(userRole.role) : userRole.role != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = username != null ? username.hashCode() : 0;
        result = 31 * result + (role != null ? role.hashCode() : 0);
        return result;
    }
}
