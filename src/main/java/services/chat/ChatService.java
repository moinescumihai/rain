package services.chat;


import model.domain.ChatMessage;

public interface ChatService {

    ChatMessage create(ChatMessage chatMessage);

}
