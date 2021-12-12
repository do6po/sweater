package com.example.sweater.controllers;

import com.example.sweater.entities.Message;
import com.example.sweater.entities.User;
import com.example.sweater.repositories.MessageRepo;
import lombok.AllArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@AllArgsConstructor
public class MainController {
    private final MessageRepo messageRepo;

    @GetMapping("/main")
    public String main(Model model) {
        Iterable<Message> messages = messageRepo.findAll();

        model.addAttribute("messages", messages);
        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag,
            Model model
    ) {
        Message message = new Message(text, tag, user);
        messageRepo.save(message);

        Iterable<Message> messages = messageRepo.findAll();
        model.addAttribute("messages", messages);

        return "main";
    }
}
