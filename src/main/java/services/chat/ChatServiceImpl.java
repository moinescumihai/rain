package services.chat;

import model.domain.ChatMessage;
import model.repository.ChatMessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class ChatServiceImpl implements ChatService {

    @Autowired
    ChatMessageRepository chatMessageRepository;

    @Transactional
    @Override
    public ChatMessage create(ChatMessage chatMessage) {
        return chatMessageRepository.save(chatMessage);
    }
}
