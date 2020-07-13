package out.stagram.domain;

import java.sql.Timestamp;
import java.util.Comparator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity
@org.hibernate.annotations.DynamicUpdate
public class Chat implements Comparator<Chat> {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	@ManyToOne
	@JoinColumn(name = "senduser")
	User send;
	
	@ManyToOne
	@JoinColumn(name = "receiveuser")
	User receive;
	
	Timestamp writetime;
	String content;
	
	@Override
	public int compare(Chat c1, Chat c2) {
		long l1 = c1.getWritetime().getTime();
		long l2 = c2.getWritetime().getTime();
		
		if(l1 > l2)
			return 1;
		else
			return -1;
	}
}
