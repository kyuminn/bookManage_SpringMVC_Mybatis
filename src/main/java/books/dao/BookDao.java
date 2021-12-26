package books.dao;

import java.util.List;

import books.vo.BookVo;
import books.vo.Paging;

public interface BookDao {
	public abstract void regist(BookVo vo);
	public List<BookVo> list(Paging page);
	public BookVo read(int id);
	public List<BookVo> selectByKeyword(String keyword);
	public BookVo selectByISBN(long isbn);
	public void delete(int id);
	public int selectRowCount();
}
