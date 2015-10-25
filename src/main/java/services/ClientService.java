package services;

import model.domain.Client;
import model.forms.ClientFormModel;

import java.util.List;

public interface ClientService {

    List<Client> findAll();

    Client saveClient(ClientFormModel entity);

    Client findOne(long idClient);
}
