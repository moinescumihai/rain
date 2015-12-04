package controllers;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import model.chat.ChatMessage;
import model.chat.Result;
import org.springframework.messaging.handler.annotation.MessageExceptionHandler;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;

import java.security.Principal;
import java.sql.Timestamp;

@Controller
public class ChatController {

    @MessageMapping("/chat")
    @SendTo("/topic/message")
    public Result result(String messageJson, Principal principal) throws Exception {
        ChatMessage message;
        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        message = mapper.readValue(messageJson, ChatMessage.class);
        message.setReceived(new Timestamp(System.currentTimeMillis()));

        return new Result(messageJson);
    }

    @MessageExceptionHandler
    @SendToUser("/queue/errors")
    public String handleException(Throwable exception) {
        return exception.getMessage();
    }
}