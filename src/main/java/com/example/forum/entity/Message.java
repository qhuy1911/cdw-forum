package com.example.forum.entity;

public class Message extends Entry {

    public Message() {

    }
    public Message(String title, String content, User creator) {
        super(title, content, creator);
    }

}
