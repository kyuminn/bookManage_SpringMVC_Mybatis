package books.service;

import java.util.List;

import books.vo.BookVo;
import books.vo.Paging;

public interface BookService {
	public abstract void regist(BookVo vo);
	public abstract List<BookVo> list(Paging page);
	public abstract BookVo read(int id);
	public abstract List<BookVo> selectByKeyword(String keyword);
	public abstract BookVo selectByISBN(long isbn);
	public abstract void delete(int id);
	public abstract int selectRowCount();
}
