package model.common;

import org.springframework.data.jpa.domain.AbstractAuditable;

import javax.persistence.Entity;

@Entity
public class AuditableUser extends AbstractAuditable<AuditableUser, Long> {

    private static final long serialVersionUID = 1L;

    private String username;

    /**
     * Set's the user's name.
     *
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * Returns the user's name.
     *
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    public AuditableUser getUser() {
        return this;
    }
}