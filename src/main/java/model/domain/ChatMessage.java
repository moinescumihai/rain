package model.domain;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "chat_message", schema = "", catalog = "raindrop")
public class ChatMessage {
    private long idChatMessage;
    private String message;
    private String sender;
    private Timestamp received;
    private String unitate;
    private String receiver;
    private Integer seen;
    private Proiect idProiect;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_chat_message", nullable = false, insertable = true, updatable = true)
    public long getIdChatMessage() {
        return idChatMessage;
    }

    public void setIdChatMessage(long idChatMessage) {
        this.idChatMessage = idChatMessage;
    }

    @Basic
    @Column(name = "message", nullable = false, insertable = true, updatable = true)
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Basic
    @Column(name = "sender", nullable = false, insertable = true, updatable = true, length = 255)
    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    @Basic
    @Column(name = "received", nullable = false, insertable = true, updatable = true)
    public Timestamp getReceived() {
        return received;
    }

    public void setReceived(Timestamp received) {
        this.received = received;
    }

    @Basic
    @Column(name = "unitate", nullable = false, insertable = true, updatable = true, length = 255)
    public String getUnitate() {
        return unitate;
    }

    public void setUnitate(String unitate) {
        this.unitate = unitate;
    }

    @Basic
    @Column(name = "receiver", nullable = false, insertable = true, updatable = true, length = 255)
    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    @Basic
    @Column(name = "seen", nullable = false, insertable = true, updatable = true)
    public Integer getSeen() {
        return seen;
    }

    public void setSeen(Integer seen) {
        this.seen = seen;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_proiect")
    public Proiect getIdProiect() {
        return idProiect;
    }

    public void setIdProiect(Proiect idProiect) {
        this.idProiect = idProiect;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ChatMessage)) return false;

        ChatMessage that = (ChatMessage) o;

        if (idChatMessage != that.idChatMessage) return false;
        if (message != null ? !message.equals(that.message) : that.message != null) return false;
        if (sender != null ? !sender.equals(that.sender) : that.sender != null) return false;
        if (received != null ? !received.equals(that.received) : that.received != null) return false;
        if (unitate != null ? !unitate.equals(that.unitate) : that.unitate != null) return false;
        if (receiver != null ? !receiver.equals(that.receiver) : that.receiver != null) return false;
        if (seen != null ? !seen.equals(that.seen) : that.seen != null) return false;
        return !(idProiect != null ? !idProiect.equals(that.idProiect) : that.idProiect != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (idChatMessage ^ (idChatMessage >>> 32));
        result = 31 * result + (message != null ? message.hashCode() : 0);
        result = 31 * result + (sender != null ? sender.hashCode() : 0);
        result = 31 * result + (received != null ? received.hashCode() : 0);
        result = 31 * result + (unitate != null ? unitate.hashCode() : 0);
        result = 31 * result + (receiver != null ? receiver.hashCode() : 0);
        result = 31 * result + (seen != null ? seen.hashCode() : 0);
        result = 31 * result + (idProiect != null ? idProiect.hashCode() : 0);
        return result;
    }
}
