package model.domain;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "user", schema = "", catalog = "raindrop")
public class User extends BaseEntity {
    private long idUser;
    private String username;
    private String password;
    private Timestamp lastLogin;
    private Timestamp lastPassChange;
    private Integer enabled;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_user", nullable = false, updatable = true)
    public long getIdUser() {
        return idUser;
    }

    public void setIdUser(long idUser) {
        this.idUser = idUser;
    }

    @Basic
    @Column(name = "username", nullable = false, insertable = true, updatable = true, length = 45)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "password", nullable = false, insertable = true, updatable = true, length = 255)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "last_login", nullable = true, insertable = true, updatable = true)
    public Timestamp getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Timestamp lastLogin) {
        this.lastLogin = lastLogin;
    }

    @Basic
    @Column(name = "last_pass_change", nullable = true, insertable = true, updatable = true)
    public Timestamp getLastPassChange() {
        return lastPassChange;
    }

    public void setLastPassChange(Timestamp lastPassChange) {
        this.lastPassChange = lastPassChange;
    }

    @Basic
    @Column(name = "enabled", nullable = false, insertable = true, updatable = true)
    public Integer getEnabled() {
        return enabled;
    }

    public void setEnabled(Integer enabled) {
        this.enabled = enabled;
    }

}
