package model.forms;import java.util.Arrays;public class InventarFormModel {    private long idLoc;    private long idPersoana;    private long tipIesire;    private long[] articole;    private String detalii;    public long getIdLoc() {        return idLoc;    }    public void setIdLoc(long idLoc) {        this.idLoc = idLoc;    }    public long getIdPersoana() {        return idPersoana;    }    public void setIdPersoana(long idPersoana) {        this.idPersoana = idPersoana;    }    public long getTipIesire() {        return tipIesire;    }    public void setTipIesire(long tipIesire) {        this.tipIesire = tipIesire;    }    public long[] getArticole() {        return articole;    }    public void setArticole(long[] articole) {        this.articole = articole;    }    public String getDetalii() {        return detalii;    }    public void setDetalii(String detalii) {        this.detalii = detalii;    }    @Override    public boolean equals(Object o) {        if (this == o) return true;        if (!(o instanceof InventarFormModel)) return false;        InventarFormModel that = (InventarFormModel) o;        if (idLoc != that.idLoc) return false;        if (idPersoana != that.idPersoana) return false;        if (tipIesire != that.tipIesire) return false;        if (!Arrays.equals(articole, that.articole)) return false;        return !(detalii != null ? !detalii.equals(that.detalii) : that.detalii != null);    }    @Override    public int hashCode() {        int result = (int) (idLoc ^ (idLoc >>> 32));        result = 31 * result + (int) (idPersoana ^ (idPersoana >>> 32));        result = 31 * result + (int) (tipIesire ^ (tipIesire >>> 32));        result = 31 * result + (articole != null ? Arrays.hashCode(articole) : 0);        result = 31 * result + (detalii != null ? detalii.hashCode() : 0);        return result;    }}