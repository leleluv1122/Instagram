package out.stagram.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class UserRegistrationModel {
	@NotEmpty(message = "ID를 입력하세요")
	@Size(min = 3, max = 12)
	String userid;

	@NotEmpty(message = "비밀번호를 입력하세요")
	@Size(min = 8, max = 20, message = "8 자리 이상 20 자리 이하이어야 합니다.")
	String passwd1;
	@NotEmpty(message = "이름을 입력하세요")
	@Size(min = 2, max = 10)
	String name;
	String phone;
}
