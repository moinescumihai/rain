package services;

import model.domain.Tara;

import java.util.List;

public interface ListaTariService {
    List<Tara> getTari();

    Tara findOne(long idTara);
}
