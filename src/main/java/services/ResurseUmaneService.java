package services;

import model.domain.ResurseUmane;
import org.springframework.stereotype.Service;


public interface ResurseUmaneService {
    ResurseUmane findOne(long id);
}
