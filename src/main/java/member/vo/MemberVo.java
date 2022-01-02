package member.vo;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVo {
	private int id;
	@NotEmpty(message="필수 항목입니다")
	private String email;
	private String name;
	@NotEmpty(message="필수 항목입니다!")
	private String password;
	private String confirmPassword;
	private boolean rememberEmail;
}
