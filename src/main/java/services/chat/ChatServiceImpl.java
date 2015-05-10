package services.chat;

import model.domain.ChatMessage;
import model.repository.ChatMessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ChatServiceImpl implements ChatService {

    @Autowired
    ChatMessageRepository chatMessageRepository;

    @Transactional
    @Override
    public ChatMessage create(ChatMessage chatMessage) {
        return chatMessageRepository.save(chatMessage);
    }
}
