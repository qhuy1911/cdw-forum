package com.example.forum.entity;

import java.util.Stack;

public class Topic extends Entry{
    private Integer id;
    private Stack<Message> messages = new Stack<Message>();
    private Category category;

    public Topic() {
    }

    public Topic(Integer id, String title, String content,
                 User creator, Category category) {
        super(title, content, creator);
        this.id = id;
        this.category = category;
    }

    public Integer getId() {
        return id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Stack<Message> getMessages() {
        return messages;
    }

    public void addMessage(Message message) {
        messages.push(message);
    }

    public Message getNewMessage() {
        return messages.peek();
    }
}
