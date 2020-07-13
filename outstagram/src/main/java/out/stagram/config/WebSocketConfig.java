package out.stagram.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker // 웹소켓 서버 활성화
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer { // 웹소켓 구현 메서드 제공

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
    	// 클라이언트가 웹 소켓 서버에 연결하는데 사용할 웹 소켓 앤드 포인트
        registry.addEndpoint("/ws").withSockJS();
    }


    // 힌 client -> 다른 client 메시지 라우팅하는데 사용
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.setApplicationDestinationPrefixes("/app");
        registry.enableSimpleBroker("/topic");
    }
}