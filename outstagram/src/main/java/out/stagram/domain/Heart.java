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
public class Heart implements Comparator<Heart> {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	@ManyToOne
	@JoinColumn(name = "userid")
	User user;
	
	@ManyToOne
	@JoinColumn(name = "postid")
	Post post;
	
	Timestamp clicktime;

	@Override
	public int compare(Heart h1, Heart h2) {
		long l1 = h1.getClicktime().getTime();
		long l2 = h2.getClicktime().getTime();
		
		if(l1 > l2)
			return -1;
		else
			return 1;
	}
}
