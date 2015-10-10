package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;
import java.util.Arrays;

@Entity
public class User {
    private long idUser;
    private String username;
    private String password;
    private Timestamp lastLogin;
    private Timestamp lastPassChange;
    private byte[] userphoto;
    private int enabled;
    private Long activeProject;

    @Id

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
    @Column(name = "userphoto", nullable = true, insertable = true, updatable = true)
    public byte[] getUserphoto() {
        return userphoto;
    }

    public void setUserphoto(byte[] userphoto) {
        this.userphoto = userphoto;
    }

    @Basic
    @Column(name = "enabled", nullable = false, insertable = true, updatable = true)
    public int getEnabled() {
        return enabled;
    }

    public void setEnabled(int enabled) {
        this.enabled = enabled;
    }

    @Basic
    @Column(name = "active_project", nullable = true, insertable = true, updatable = true)
    public Long getActiveProject() {
        return activeProject;
    }

    public void setActiveProject(Long activeProject) {
        this.activeProject = activeProject;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;

        User user = (User) o;

        if (idUser != user.idUser) return false;
        if (activeProject != user.activeProject) return false;
        if (enabled != user.enabled) return false;
        if (!username.equals(user.username)) return false;
        if (!password.equals(user.password)) return false;
        if (lastLogin != null ? !lastLogin.equals(user.lastLogin) : user.lastLogin != null) return false;
        if (lastPassChange != null ? !lastPassChange.equals(user.lastPassChange) : user.lastPassChange != null) return false;
        return Arrays.equals(userphoto, user.userphoto);

    }

    @Override
    public int hashCode() {
        int result = (int) (idUser ^ (idUser >>> 32));
        result = 31 * result + (int) (activeProject ^ (activeProject >>> 32));
        result = 31 * result + username.hashCode();
        result = 31 * result + password.hashCode();
        result = 31 * result + (lastLogin != null ? lastLogin.hashCode() : 0);
        result = 31 * result + (lastPassChange != null ? lastPassChange.hashCode() : 0);
        result = 31 * result + (userphoto != null ? Arrays.hashCode(userphoto) : 0);
        result = 31 * result + enabled;
        return result;
    }
}
