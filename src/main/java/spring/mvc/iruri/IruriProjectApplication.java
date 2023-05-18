package spring.mvc.iruri;

import java.util.Date;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@SpringBootApplication
@EnableScheduling
@ComponentScan("spring.mvc.*")
@MapperScan("spring.mvc.*")
public class IruriProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(IruriProjectApplication.class, args);
	}

}
