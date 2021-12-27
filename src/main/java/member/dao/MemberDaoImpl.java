package member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate=sqlSessionTemplate;
	}
	
	@Override
	public void regist(MemberVo vo) {
		sqlSessionTemplate.insert("memberDao.regist", vo);
	}

	@Override
	public MemberVo login(MemberVo vo) {
		return sqlSessionTemplate.selectOne("memberDao.authenticate", vo);
	}

	@Override
	public MemberVo selectByEmail(String email) {
		return sqlSessionTemplate.selectOne("memberDao.selectByEmail", email);
	}

}
