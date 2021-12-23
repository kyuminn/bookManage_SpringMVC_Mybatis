package books.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import books.vo.BookVo;

@Repository
public class BookDaoImpl implements BookDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public BookDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate=sqlSessionTemplate;
	}
	@Override
	public void regist(BookVo vo) {
		sqlSessionTemplate.insert("bookDao.regist",vo);
		
	}
	@Override
	public List<BookVo> list() {
		return sqlSessionTemplate.selectList("bookDao.list");
	}
	@Override
	public BookVo read(int id) {
		return sqlSessionTemplate.selectOne("bookDao.read",id);
	}
	@Override
	public List<BookVo> selectByKeyword(String keyword) {
		return sqlSessionTemplate.selectList("bookDao.selectByKeyword", keyword);
	}
	@Override
	public BookVo selectByISBN(long isbn) {
		return sqlSessionTemplate.selectOne("bookDao.selectByISBN", isbn);
	}

}
