package services.chat;

import model.domain.ChatMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import services.repository.ChatMessageRepository;

@Service
public class ChatServiceImpl implements ChatService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ChatServiceImpl.class);

    @Autowired
    ChatMessageRepository chatMessageRepository;

    @Override

    public ChatMessage save(ChatMessage chatMessage) {
        return chatMessageRepository.save(chatMessage);
    }
}
