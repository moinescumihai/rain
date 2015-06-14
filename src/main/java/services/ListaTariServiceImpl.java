package services;

import model.domain.ListaTari;
import model.repository.ListaTariRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class ListaTariServiceImpl implements ListaTariService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ListaTariServiceImpl.class);

    @Autowired
    private ListaTariRepository listaTariRepository;

    @Override
    public List<ListaTari> getTari() {
        try {
            return (List<ListaTari>) listaTariRepository.findAll();
        } catch (DataAccessException e) {
            LOGGER.error("TARI.NO_TARI", e);
            return Collections.emptyList();
        }
    }
}
