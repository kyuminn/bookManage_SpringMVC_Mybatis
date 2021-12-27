package member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVo {
	private int id;
	private String email;
	private String name;
	private String password;
	private String confirmPassword;
	private boolean rememberEmail;
}
