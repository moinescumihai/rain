package services.chat;

import model.chat.ChatMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.io.Serializable;

@ServerEndpoint(value = "/chat/{room}", encoders = ChatMessageEncoder.class, decoders = ChatMessageDecoder.class)
public class ChatEndpoint implements Serializable {
    private static final Logger LOGGER = LoggerFactory.getLogger(ChatEndpoint.class);

    @OnOpen
    public void open(final Session session, @PathParam("room") final String room) {
        LOGGER.info("session openend and bound to room: " + room);
        session.getUserProperties().put("room", room);
    }

    @OnMessage
    public void onMessage(final Session session, final ChatMessage chatMessage) {
        String room = (String) session.getUserProperties().get("room");
        try {
            for (Session s : session.getOpenSessions()) {
                if (s.isOpen() && room.equals(s.getUserProperties().get("room"))) {
                    s.getBasicRemote().sendObject(chatMessage);
                }
            }
        } catch (IOException | EncodeException e) {
            LOGGER.error("onMessage failed", e);
        }
    }

    @OnError
    public void onError(Throwable exception, Session session) {
        LOGGER.info("Error ", exception);
    }


}