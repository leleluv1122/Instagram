package out.stagram.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
@org.hibernate.annotations.DynamicUpdate
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	String userId;
	String password;
	String name;
	String introduce;
	String profile_photo;
	String phone;
	String website;
	String userType;
	int enable;
}
