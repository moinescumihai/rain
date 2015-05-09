//package controllers;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.messaging.handler.annotation.MessageMapping;
//import org.springframework.messaging.handler.annotation.SendTo;
//import org.springframework.stereotype.Controller;
//import repository.dao.MessageDAO;
//
//import javax.json.Json;
//import javax.json.JsonObject;
//import java.io.StringReader;
//import java.sql.Timestamp;
//
//@Controller
//public class ChatController {
//
//
//    @Autowired
//    private MessageDAO messageDAO;
//
//    @MessageMapping("/chat")
//    @SendTo("/topic/greetings")
//    public Result result(String messageJson) throws Exception {
//        Message message = new Message();
//        JsonObject obj = Json.createReader(new StringReader(messageJson)).readObject();
//        obj = Json.createReader(new StringReader(obj.getString("message"))).readObject();
//        message.setMessage(obj.getString("message"));
//        message.setSender(obj.getString("sender"));
//        message.setReceiver(obj.getString("receiver"));
//        message.setUnitate(obj.getString("unitate"));
//        message.setReceived(new Timestamp(System.currentTimeMillis()));
//
//        try {
//            messageDAO.create(message);
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            return new Result(message.toString());
//        }
//    }
//
//}