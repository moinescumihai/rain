package services.chat;


import model.chat.ChatMessage;

import javax.json.Json;
import javax.json.JsonObject;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;
import java.io.StringReader;
import java.sql.Timestamp;

public class ChatMessageDecoder implements Decoder.Text<ChatMessage> {

    @Override
    public void init(final EndpointConfig config) {
    }

    @Override
    public void destroy() {
    }

    @Override
    public ChatMessage decode(final String textMessage) throws DecodeException {
        ChatMessage chatMessage = new ChatMessage();
        JsonObject jsonMessage = Json.createReader(new StringReader(textMessage)).readObject();

        chatMessage.setMessage(jsonMessage.getString("message"));
        chatMessage.setSender(jsonMessage.getString("sender"));
        chatMessage.setReceiver(jsonMessage.getString("receiver"));
        chatMessage.setReceived(new Timestamp(System.currentTimeMillis()));

        return chatMessage;
    }

    @Override
    public boolean willDecode(final String s) {
        return true;
    }
}