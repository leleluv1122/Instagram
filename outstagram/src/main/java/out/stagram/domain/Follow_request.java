package out.stagram.domain;

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
public class Follow_request {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	@ManyToOne
	@JoinColumn(name = "requestuser")
	User request;

	@ManyToOne
	@JoinColumn(name = "receiveuser")
	User receive;
}
