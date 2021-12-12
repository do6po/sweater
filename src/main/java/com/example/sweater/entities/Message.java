package com.example.sweater.entities;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
public class Message {
    private static final String TABLE = "messages";

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String text;
    private String tag;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(table = Message.TABLE, name = "user_id")
    private User author;

    public Message(String text, String tag) {
        setText(text);
        setTag(tag);
    }

    public Message(String text, String tag, User user) {
        this(text, tag);
        setAuthor(user);
    }

    public String getAuthorName() {
        User author = getAuthor();
        return author != null
                ? author.getUsername()
                : "none";
    }
}
