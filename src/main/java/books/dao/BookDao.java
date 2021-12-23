package books.dao;

import java.util.List;

import books.vo.BookVo;

public interface BookDao {
	public abstract void regist(BookVo vo);
	public List<BookVo> list();
	public BookVo read(int id);
	public List<BookVo> selectByKeyword(String keyword);
}
