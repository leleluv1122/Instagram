package out.stagram.domain;

import java.sql.Timestamp;

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
public class Follow {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	@ManyToOne
	@JoinColumn(name = "following")
	User following;
	
	@ManyToOne
	@JoinColumn(name = "follower")
	User follower;

	Timestamp follow_date;
}
