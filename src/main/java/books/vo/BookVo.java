package books.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class BookVo {
	private int id;
	private String bookImageName;
	private long isbn;
	private String bookName;
	private String writer;
	private String publisher;
	private int price;
	private String content;
}
