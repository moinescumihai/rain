package services.chat;


import model.domain.ChatMessage;

public interface ChatService {

    ChatMessage save(ChatMessage chatMessage);

}
