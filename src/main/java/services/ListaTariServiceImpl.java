package services;

import model.domain.Tara;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import services.repository.ListaTariRepository;

import java.util.Collections;
import java.util.List;

@Service
public class ListaTariServiceImpl implements ListaTariService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ListaTariServiceImpl.class);

    @Autowired
    private ListaTariRepository listaTariRepository;

    @Override
    public List<Tara> getTari() {
        try {
            return (List<Tara>) listaTariRepository.findAll();
        } catch (DataAccessException e) {
            LOGGER.error("TARI.NO_TARI", e);
            return Collections.emptyList();
        }
    }

    @Override
    public Tara findOne(long idTara) {
        return listaTariRepository.findOne(idTara);
    }
}
