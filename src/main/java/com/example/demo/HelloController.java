package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;

@RestController
public class HelloController {

    @GetMapping("/")
    public String hello() throws Exception {
        String host = InetAddress.getLocalHost().getHostName();
        return "Hello from ECS Fargate! Host: " + host;
    }

    @GetMapping("/healthz")
    public String healthz() { 
        return "ok"; 
    }
}
