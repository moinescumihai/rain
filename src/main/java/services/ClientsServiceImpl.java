package services;

import model.domain.Client;
import model.repository.ClientRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class ClientsServiceImpl implements ClientsService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ClientsServiceImpl.class);

    @Autowired
    private ClientRepository clientRepository;


    @Override
    public List<Client> findAll() {
        try {
            return (List<Client>) clientRepository.findAll();
        } catch (DataAccessException e) {
            LOGGER.error("CLIENTS.NO_CLIENTS", e);
            return Collections.emptyList();
        }
    }

    @Override
    public Client save(Client entity) {
        return clientRepository.save(entity);
    }
}
