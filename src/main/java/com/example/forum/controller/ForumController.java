package com.example.forum.controller;

import com.example.forum.entity.Category;
import com.example.forum.entity.Message;
import com.example.forum.entity.Topic;
import com.example.forum.entity.User;
import com.example.forum.service.ForumData;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;

@org.springframework.stereotype.Controller
@SessionAttributes("user")
public class ForumController {

    ForumData forumData = ForumData.getInstance();

    @GetMapping("/login")
    public String login(Model model) {
        User user = new User();
        model.addAttribute(user);
        return "login";
    }

    @PostMapping("/login")
    public RedirectView  login(Model model, @ModelAttribute User userRequest, RedirectAttributes redirectAttrs) {
        User user = forumData.checkUser(userRequest.getUsername(), userRequest.getPassword());
        if (user != null) {
            model.addAttribute(user);
            return new RedirectView("/");
        } else {
            redirectAttrs.addFlashAttribute("message", "Invalid username or password");
            return new RedirectView("/login");
        }
    }

    @GetMapping("/logout")
    public RedirectView logout(Model model, HttpServletRequest request) {
        request.getSession().invalidate();
        return new RedirectView("/login");
    }

    @GetMapping("/topics")
    public String getAllTopics(Model model) {
        model.addAttribute("data", forumData);
        return "listTopics";
    }

    @GetMapping("/topics/{id}")
    public String getTopicById(Model model, @PathVariable("id") int id) {
        //topic
        Topic topic = forumData.findTopic(id);
        model.addAttribute(topic);

        //newest message
        Message message = null;
        try {
            message = topic.getNewMessage();
        } catch (Exception e) {
            System.out.println("Message is null");
        }
        if (message != null) {
            model.addAttribute("newest", message);
        }
        return "showTopic";
    }

    @GetMapping("/addTopic")
    public String addTopic(Model model) {
        Topic topic = new Topic();
        model.addAttribute(topic);
        return "newTopic";
    }

    @PostMapping(value = "/addTopic", params = "submit")
    public String addTopic(Model model, @ModelAttribute Topic topic, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        Topic newTopic = new Topic(
                forumData.getTopics().size()+1,
                topic.getTitle(),
                topic.getContent(),
                user,
                new Category("Học hành")
        );

        forumData.addTopic(newTopic);
        model.addAttribute("data", forumData);
        return "listTopics";
    }

    @PostMapping(value = "/addTopic", params = "cancel")
    public String cancelAddTopic(Model model) {
        model.addAttribute("data", forumData);
        return "listTopics";
    }

    @GetMapping("/topics/{id}/reply")
    public String replyTopic(Model model, @PathVariable("id") int id) {
        // Topic
        Topic topic = forumData.findTopic(id);
        model.addAttribute(topic);

        // Message
        Message message = new Message();
        message.setTitle("Re: " + topic.getTitle());
        model.addAttribute(message);
        return "replyTopic";
    }

    @PostMapping(value = "/topics/{id}/reply", params = "submit")
    public String replyTopic(Model model, @PathVariable("id") int id, @ModelAttribute Message message, HttpServletRequest request) {
        // User
        User user = (User) request.getSession().getAttribute("user");

        //Topic
        Topic topic = forumData.findTopic(id);

        Message newMessage = new Message(
                message.getTitle(),
                message.getContent(),
                user
        );

        topic.addMessage(newMessage);
        model.addAttribute(topic);

        //newest message
        Message newest = null;
        try {
            newest = topic.getNewMessage();
        } catch (Exception e) {
            System.out.println("Message is null");
        }
        if (newest != null) {
            model.addAttribute("newest", newest);
        }
        return "showTopic";
    }

    @PostMapping(value = "/topics/{id}/reply", params = "cancel")
    public String cancelReplyTopic(Model model, @PathVariable("id") int id) {
        Topic topic = forumData.findTopic(id);
        model.addAttribute(topic);

        //newest message
        Message newest = null;
        try {
            newest = topic.getNewMessage();
        } catch (Exception e) {
            System.out.println("Message is null");
        }
        if (newest != null) {
            model.addAttribute("newest", newest);
        }
        return "showTopic";
    }
}
