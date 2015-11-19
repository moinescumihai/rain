package controllers;

import model.chat.Result;
import model.domain.ChatMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import services.chat.ChatService;

import javax.json.Json;
import javax.json.JsonObject;
import java.io.StringReader;
import java.sql.Timestamp;

@Controller
public class ChatController {

    @Autowired
    private ChatService chatService;

    @MessageMapping("/chat")
    @SendTo("/topic/greetings")
    public Result result(String messageJson) throws Exception {
        ChatMessage message = new ChatMessage();
        JsonObject obj = Json.createReader(new StringReader(messageJson)).readObject();
        obj = Json.createReader(new StringReader(obj.getString("message"))).readObject();
        message.setMessage(obj.getString("message"));
        message.setSender(obj.getString("sender"));
        message.setReceiver(obj.getString("receiver"));
        message.setUnitate(obj.getString("unitate"));
        message.setReceived(new Timestamp(System.currentTimeMillis()));

        chatService.save(message);

        return new Result(message.toString());
    }
}