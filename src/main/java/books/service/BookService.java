package books.service;

import java.util.List;

import books.vo.BookVo;

public interface BookService {
	public abstract void regist(BookVo vo);
	public abstract List<BookVo> list();
	public abstract BookVo read(int id);
	
}
