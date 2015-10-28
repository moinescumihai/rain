package services;

import model.domain.Client;
import model.forms.ClientFormModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import services.repository.ClientRepository;
import services.repository.IndustrieRepository;

import java.util.Collections;
import java.util.List;

@Service
public class ClientServiceImpl implements ClientService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ClientServiceImpl.class);

    @Autowired
    private ClientRepository clientRepository;
    @Autowired
    private ListaTariService tariService;
    @Autowired
    private IndustrieRepository industrieRepository;


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
    public Client saveClient(ClientFormModel entity) {
        Client client = new Client();
        client.setNumeClient(entity.getNumeClient());
        client.setAdresa(entity.getAdresa());
        client.setCodPostal(entity.getCodPostal());
        client.setOras(entity.getOras());
        client.setJudet(entity.getJudet());
        client.setIdTara(tariService.findOne(entity.getIdTara()));
        client.setEmail(entity.getEmail());
        client.setTelefon(entity.getTelefon());
        client.setFax(entity.getFax());
        client.setWebsite(entity.getWebsite());
        client.setIdIndustrie(industrieRepository.findOne(entity.getIdIndustrie()));

        return clientRepository.save(client);
    }

    @Override
    public Client findOne(long idClient) {
        return clientRepository.findOne(idClient);
    }
}
