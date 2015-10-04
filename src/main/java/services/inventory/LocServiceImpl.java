package services.inventory;

import model.domain.Loc;
import model.repository.LocRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocServiceImpl implements LocService {
    private static final Logger LOGGER = LoggerFactory.getLogger(LocServiceImpl.class);

    @Autowired
    private LocRepository locRepository;

    @Override
    public Loc findById(long idLoc) {
        return locRepository.findOne(idLoc);
    }
}
