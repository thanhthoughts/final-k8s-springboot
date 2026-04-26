package com.example.finalapp;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    private final JdbcTemplate jdbcTemplate;

    public HelloController(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @GetMapping("/")
    public String home() {
        String databaseName = jdbcTemplate.queryForObject("SELECT DATABASE()", String.class);
        return "Hello World from Spring Boot. Connected to MySQL database: " + databaseName;
    }

    @GetMapping("/health")
    public String health() {
        return "Webapp is running successfully.";
    }
}
