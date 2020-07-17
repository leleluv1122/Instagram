package out.stagram.domain;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import java.util.Comparator;

import lombok.Data;

@Data
@Entity
@org.hibernate.annotations.DynamicUpdate
public class Post implements Comparator<Post> {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	@ManyToOne
	@JoinColumn(name = "userid")
	User user;

	String description;
	String tag;

	Timestamp create_date;
	Timestamp update_date;
	
	@Override
	public int compare(Post p1, Post p2) {
		long l1 = p1.getCreate_date().getTime();
		long l2 = p2.getCreate_date().getTime();
		
		if(l1 > l2)
			return -1;
		else
			return 1;
			
	}
}
