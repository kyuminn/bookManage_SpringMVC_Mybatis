package books.service;

import java.io.File;
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

	@Override
	public List<BookVo> selectByKeyword(String keyword) {
		return bookDao.selectByKeyword(keyword);
	}

	@Override
	public BookVo selectByISBN(long isbn) {
		return bookDao.selectByISBN(isbn);
	}

	@Override
	public void delete(int id) {
		BookVo vo = bookDao.read(id);
		String bookImageName = vo.getBookImageName();
		File file = new File("C:/bookImage/"+bookImageName);
		if(file.exists()) {
			file.delete();
			System.out.println(bookImageName+"삭제 완료");
		}else {
			System.out.println("파일이 존재하지 않습니다");
		}
		bookDao.delete(id);
	}

}
