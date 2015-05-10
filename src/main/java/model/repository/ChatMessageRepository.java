package model.repository;


import model.domain.ChatMessage;
import org.springframework.data.repository.CrudRepository;

public interface ChatMessageRepository extends CrudRepository<ChatMessage, Long>{
}
