package books.vo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import books.service.BookService;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Repository
public class Paging {
	
	@Autowired
	private BookService bookService;
	
	private int pageSize=3; // 한 페이지에 들어가는 글 수 (startRowNum부터 finalRowNum개수)
	private int pageBlock=3; // 페이지 블록 수 1,2,3// 4,5,6 
	private int startRowNum=0; // 한 페이지의 시작 번호
	private int lastRowNum=0;  // 한 페이지의 끝 번호
	private int startPageNum=0; //page 1 , page 4
	private int lastPageNum=0; // page 3, page 6
	private int totalPageCount=0; // 전체 페이지 수
	private int backPage=0; // 이전 페이지로
	private int forwardPage=0; // 다음 페이지로
	private int totalRowCount=0; // 전체 글 수 
	
	public void pagedArticleList(int currentPage) { // 특정 페이지의 시작번호, 끝번호 설정하는 메서드
		startRowNum = (currentPage-1)*pageSize+1;
		lastRowNum= startRowNum + pageSize -1;
	}
	
	public void setPageVar(int currentPage , int rowCount) {
		totalRowCount= rowCount;
		int imsi = totalRowCount % pageSize ==0 ? 0 :1;
		totalPageCount = totalRowCount/pageSize + imsi;
		
		startPageNum = ((currentPage-1) / pageBlock) * pageBlock +1;  // 1,4
		lastPageNum = startPageNum + pageBlock -1 ; // 3, 6
		
		if (lastPageNum >=totalPageCount) {
			lastPageNum = totalPageCount ;
		}
		
		backPage = startPageNum - 1; // 이전으로 (이전 페이지 블록의 마지막 페이지로)
		forwardPage = startPageNum +pageBlock; // 다음으로 (다음 페이지 블록의 첫번째 페이지로)
		
	}
	
}
