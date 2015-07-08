package services.chat;

import model.domain.ChatMessage;

import javax.json.Json;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

public class ChatMessageEncoder implements Encoder.Text<ChatMessage> {

    @Override
    public void init(final EndpointConfig config) {
    }

    @Override
    public void destroy() {
    }

    @Override
    public String encode(final ChatMessage chatMessage) throws EncodeException {
        String retVal = Json.createObjectBuilder()
                .add("message", chatMessage.getMessage())
                .add("sender", chatMessage.getSender())
                .add("receiver", chatMessage.getReceiver())
                .add("unitate", chatMessage.getUnitate())
                .add("received", chatMessage.getReceived().toString()).build()

                .toString();

        return retVal;
    }
}
