package services;

import model.domain.Client;
import model.repository.ClientRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.LockModeType;
import java.util.Collections;
import java.util.List;

@Service
public class ClientsServiceImpl implements ClientsService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ClientsServiceImpl.class);

    @Autowired
    private ClientRepository clientRepository;


    @Override
    @Transactional
    public List<Client> findAll() {
        try {
            return (List<Client>) clientRepository.findAll();
        } catch (DataAccessException e) {
            LOGGER.error("CLIENTS.NO_CLIENTS", e);
            return Collections.emptyList();
        }
    }

    @Override
    @Transactional
    @Lock(LockModeType.READ)
    public Client save(Client entity) {
        return clientRepository.save(entity);
    }
}
