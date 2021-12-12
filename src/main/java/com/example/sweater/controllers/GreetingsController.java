package com.example.sweater.controllers;

import com.example.sweater.entities.Message;
import com.example.sweater.repositories.MessageRepo;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@AllArgsConstructor
public class GreetingsController {
    private final MessageRepo messageRepo;

    @GetMapping("/")
    public String index(
            @RequestParam(name = "name", required = false, defaultValue = "World") String name,
            Model model
    ) {
        model.addAttribute("name", name);

        return "login";
    }

    @GetMapping("filter")
    public String filter(
            @RequestParam String query,
            Model model
    ) {
        Iterable<Message> messages;

        if (!(query.isBlank() && query.isEmpty())) {
            messages = messageRepo.findByTag(query);
        } else {
            messages = messageRepo.findAll();
        }

        model.addAttribute("messages", messages);

        return "main";
    }
}
