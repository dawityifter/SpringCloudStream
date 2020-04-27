package com.dawityifter.SpringCloudStream;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.io.IOException;
import java.net.Socket;
import java.net.SocketException;
import java.util.function.Consumer;
import java.util.function.Function;

@SpringBootApplication
public class SpringCloudStreamApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringCloudStreamApplication.class, args);
	}

	@Bean
	public Consumer<String> sink()  {

		return value -> {
			try {

				System.out.println("Received: " + value);
				doSomeStuff();
			} catch (Exception e) {
				//e.printStackTrace();
				System.out.println("Errored");
				throw new RuntimeException("Error");
			}

		};
	}

	private void doSomeStuff() throws Exception {

		try {
			String serverName = "localhost";

			int port = 8081;

// set the socket SO timeout to 10 seconds
			Socket socket = new Socket(serverName, port);
			socket.setSoTimeout(1000);
		} catch (IOException ioe){
			throw new Exception(ioe);
		}
	}
}
