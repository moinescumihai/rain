package services;

import model.domain.Client;

import java.util.List;

public interface ClientsService {

    List<Client> findAll();

    Client save(Client entity);
}
