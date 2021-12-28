package books.dao;

import java.util.List;

import books.vo.BookVo;
import books.vo.Paging;

// 확장성을 위한 인터페이스 구현
// 나중에 BookDao의 수정이 이루어져야 할 때 인터페이스는 수정하지 않고, 구현하는 부분만 수정하면 됨
public interface BookDao {
	public abstract void regist(BookVo vo);
	public List<BookVo> list(Paging page);
	public BookVo read(int id);
	public List<BookVo> selectByKeyword(String keyword);
	public BookVo selectByISBN(long isbn);
	public void delete(int id);
	public int selectRowCount();
}
