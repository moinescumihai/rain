package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "gant_task", schema = "", catalog = "raindrop")
public class GantTask {
    private long idActivitate;
    private String id;
    private String name;
    private String description;
    private String code;
    private int level;
    private String status;
    private String start;
    private int duration;
    private String end;
    private String startIsMilestone;
    private String endIsMilestone;
    private String depends;
    private int progress;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id_activitate", nullable = false, insertable = true, updatable = true)
    public long getIdActivitate() {
        return idActivitate;
    }

    public void setIdActivitate(long idActivitate) {
        this.idActivitate = idActivitate;
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
    @Column(name = "name", nullable = false, insertable = true, updatable = true, length = 45)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "description", nullable = true, insertable = true, updatable = true, length = 65535)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "code", nullable = false, insertable = true, updatable = true, length = 45)
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "level", nullable = false, insertable = true, updatable = true)
    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    @Basic
    @Column(name = "status", nullable = false, insertable = true, updatable = true, length = 16)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "start", nullable = false, insertable = true, updatable = true, length = 50)
    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    @Basic
    @Column(name = "duration", nullable = false, insertable = true, updatable = true)
    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    @Basic
    @Column(name = "end", nullable = false, insertable = true, updatable = true, length = 50)
    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    @Basic
    @Column(name = "startIsMilestone", nullable = false, insertable = true, updatable = true, length = 45)
    public String getStartIsMilestone() {
        return startIsMilestone;
    }

    public void setStartIsMilestone(String startIsMilestone) {
        this.startIsMilestone = startIsMilestone;
    }

    @Basic
    @Column(name = "endIsMilestone", nullable = false, insertable = true, updatable = true, length = 45)
    public String getEndIsMilestone() {
        return endIsMilestone;
    }

    public void setEndIsMilestone(String endIsMilestone) {
        this.endIsMilestone = endIsMilestone;
    }

    @Basic
    @Column(name = "depends", nullable = false, insertable = true, updatable = true, length = 255)
    public String getDepends() {
        return depends;
    }

    public void setDepends(String depends) {
        this.depends = depends;
    }

    @Basic
    @Column(name = "progress", nullable = false, insertable = true, updatable = true)
    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        GantTask gantTask = (GantTask) o;

        if (idActivitate != gantTask.idActivitate) return false;
        if (level != gantTask.level) return false;
        if (duration != gantTask.duration) return false;
        if (progress != gantTask.progress) return false;
        if (id != null ? !id.equals(gantTask.id) : gantTask.id != null) return false;
        if (name != null ? !name.equals(gantTask.name) : gantTask.name != null) return false;
        if (description != null ? !description.equals(gantTask.description) : gantTask.description != null) return false;
        if (code != null ? !code.equals(gantTask.code) : gantTask.code != null) return false;
        if (status != null ? !status.equals(gantTask.status) : gantTask.status != null) return false;
        if (start != null ? !start.equals(gantTask.start) : gantTask.start != null) return false;
        if (end != null ? !end.equals(gantTask.end) : gantTask.end != null) return false;
        if (startIsMilestone != null ? !startIsMilestone.equals(gantTask.startIsMilestone) : gantTask.startIsMilestone != null) return false;
        if (endIsMilestone != null ? !endIsMilestone.equals(gantTask.endIsMilestone) : gantTask.endIsMilestone != null) return false;
        if (depends != null ? !depends.equals(gantTask.depends) : gantTask.depends != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idActivitate ^ (idActivitate >>> 32));
        result = 31 * result + (id != null ? id.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (code != null ? code.hashCode() : 0);
        result = 31 * result + level;
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (start != null ? start.hashCode() : 0);
        result = 31 * result + duration;
        result = 31 * result + (end != null ? end.hashCode() : 0);
        result = 31 * result + (startIsMilestone != null ? startIsMilestone.hashCode() : 0);
        result = 31 * result + (endIsMilestone != null ? endIsMilestone.hashCode() : 0);
        result = 31 * result + (depends != null ? depends.hashCode() : 0);
        result = 31 * result + progress;
        return result;
    }
}
