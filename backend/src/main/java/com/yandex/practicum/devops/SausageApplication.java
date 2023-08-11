package com.yandex.practicum.devops;

import com.yandex.practicum.devops.model.Product;
import com.yandex.practicum.devops.service.ProductService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class SausageApplication {

    public static void main(String[] args) {
        SpringApplication.run(SausageApplication.class, args);
    }

    @Bean
    CommandLineRunner runner(ProductService productService) {
        return args -> {
            productService.save(new Product(1L, "Сливочная", 320.00, "https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/6.jpg"));
            productService.save(new Product(2L, "Особая", 179.00, "https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/5.jpg"));
            productService.save(new Product(3L, "Молочная", 225.00, "https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/4.jpg"));
            productService.save(new Product(4L, "Нюренбергская", 315.00, "https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/3.jpg"));
            productService.save(new Product(5L, "Мюнхенская", 330.00, "https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/2.jpg"));
            productService.save(new Product(6L, "Еврейская", 189.00, "http://sausage-store.lightstandart.com:9000/sausage-store/1.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=30QS7G1IC4874VXMEMVL%2F20230811%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230811T053604Z&X-Amz-Expires=604800&X-Amz-Security-Token=eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NLZXkiOiIzMFFTN0cxSUM0ODc0VlhNRU1WTCIsImV4cCI6MTY5MTc3NDA0MiwicGFyZW50IjoiRGVuRnJvbURhcmsifQ.YceMh49EkkL1oNoVGpf_X3Cb5ccPMXfPEvT4YuGQmz0zwlrNbn-B8AVbwGzTNdB5fIH2FsDoYNBzcQRUxwu9Dg&X-Amz-SignedHeaders=host&versionId=null&X-Amz-Signature=8670fcf0275215f8818279c00d7b487107f048ea5962fe7bc7838e62ef4fc75c"));
        };
    }
}
