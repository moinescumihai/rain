package model.common;

public class JSONResponseWithId extends JSONResponse {
    private long id;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
