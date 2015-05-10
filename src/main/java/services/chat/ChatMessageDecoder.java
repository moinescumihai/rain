package services.chat;


import model.domain.ChatMessage;

import javax.inject.Inject;
import javax.json.Json;
import javax.json.JsonObject;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;
import java.io.StringReader;
import java.sql.Timestamp;

public class ChatMessageDecoder implements Decoder.Text<ChatMessage> {
    @Inject
    private ChatService chatService;

    @Override
    public void init(final EndpointConfig config) {
    }

    @Override
    public void destroy() {
    }

    @Override
    public ChatMessage decode(final String textMessage) throws DecodeException {
        ChatMessage chatMessage = new ChatMessage();
        JsonObject obj = Json.createReader(new StringReader(textMessage))
                .readObject();
        chatMessage.setMessage(obj.getString("message"));
        chatMessage.setSender(obj.getString("sender"));
        chatMessage.setReceiver(obj.getString("receiver"));
        chatMessage.setUnitate(obj.getString("unitate"));
        chatMessage.setReceived(new Timestamp(System.currentTimeMillis()));

        chatService.create(chatMessage);
        return chatMessage;
    }

    @Override
    public boolean willDecode(final String s) {
        return true;
    }
}