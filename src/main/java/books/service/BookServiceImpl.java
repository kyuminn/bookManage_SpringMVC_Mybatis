package books.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import books.dao.BookDao;
import books.vo.BookVo;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDao bookDao;
	
	@Override
	public void regist(BookVo vo) {
		bookDao.regist(vo);
	}

	@Override
	public List<BookVo> list() {
		return bookDao.list();
	}

	@Override
	public BookVo read(int id) {
		return bookDao.read(id);
	}

}
