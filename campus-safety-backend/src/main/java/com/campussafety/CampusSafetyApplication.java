package com.campussafety;

import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@ConfigurationPropertiesScan
public class CampusSafetyApplication {
    public static void main(String[] args) {
        SpringApplication.run(CampusSafetyApplication.class, args);
    }
}
