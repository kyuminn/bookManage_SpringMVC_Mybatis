package member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.dao.MemberDao;
import member.exception.AlreadyExistingMemberException;
import member.exception.ConfirmPwdNotMatchingException;
import member.exception.IdPasswordNotMatchingException;
import member.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao memberDao;
	
	public MemberServiceImpl(MemberDao memberDao) {
		this.memberDao= memberDao;
	}
	
	@Override
	public void regist(MemberVo vo) {
		if(!vo.getPassword().equals(vo.getConfirmPassword())) {
			throw new ConfirmPwdNotMatchingException();
		}
		if(memberDao.selectByEmail(vo.getEmail())!=null) {
			throw new AlreadyExistingMemberException();
		}
		memberDao.regist(vo);
	}

	@Override
	public MemberVo login(MemberVo vo) {
		MemberVo dbVo = memberDao.login(vo);
		if(dbVo==null) {
			throw new IdPasswordNotMatchingException();
		}
		return dbVo;
	}


}
