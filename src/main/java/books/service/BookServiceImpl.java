package books.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import books.dao.BookDao;
import books.exception.DuplicateIsbnException;
import books.exception.UnAttachedFileException;
import books.vo.BookVo;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDao bookDao;
	
	@Override
	public void regist(BookVo vo) {
		BookVo dbVo = bookDao.selectByISBN(vo.getIsbn());
		if(dbVo!=null) {
			throw new DuplicateIsbnException();
		}
		if(vo.getBookImageName()==null || vo.getBookImageName()=="") {
			throw new UnAttachedFileException();
		}
		bookDao.regist(dbVo);
	}

	@Override
	public List<BookVo> list() {
		return bookDao.list();
	}

	@Override
	public BookVo read(int id) {
		return bookDao.read(id);
	}

	@Override
	public List<BookVo> selectByKeyword(String keyword) {
		return bookDao.selectByKeyword(keyword);
	}

	@Override
	public BookVo selectByISBN(long isbn) {
		return bookDao.selectByISBN(isbn);
	}

}
