package member.dao;

import member.vo.MemberVo;

public interface MemberDao {
	public abstract void regist(MemberVo vo);
	public abstract MemberVo login(MemberVo vo);
	public abstract MemberVo selectByEmail(String email);
}
