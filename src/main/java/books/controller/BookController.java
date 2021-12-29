package books.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import books.exception.DuplicateIsbnException;
import books.exception.UnAttachedFileException;
import books.service.BookService;
import books.validator.RegFormValidator;
import books.vo.BookVo;
import books.vo.Paging;

@Controller
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	//@RequestMapping(value="/books/add" ,method=RequestMethod.GET)
	// 또는 동일한 표현식으로
	@GetMapping("/books/add")
	public String regist(@ModelAttribute("vo")BookVo vo) {
		return "/books/regForm";
	}
	
	/*
	 * spring에서는 @ModelAttribute 어노테이션이 붙은 객체를 자동으로 생성한다.
	 * 해당 클래스에는 getter, setter가 정의되어 있어야 하고, 전달된 파라미터와 이름이 일치하는 setter method가 자동으로 실행되어 값이 설정된다
	 * 그 이후 @ModelAttrubute 어노테이션이 붙은 객체를 model 에 추가해준다
	 * BookVo vo = new BookVo();
	 * vo.setParam("value"); 
	 * model.addAttribute("vo",vo); 
	 * 이 부분을 스프링에서 대신 해준다고 생각하면 됨
	 * ()안에 설정하는 부분은 model에 추가할 때 사용하는 객체의 이름이다
	 * @ModelAttribute("value",vo); 라고 쓰면 jsp 파일에서 ${value.paramName}으로 접근하면 된다 
	 * */
	
	/*
	 * 서버에서 form으로부터 넘어온 parameter 값의 유효성 검사를 할 때 사용되는 Errors나 BindingResult는 반드시 커맨드 객체 다음으로 적어줘야 한다
	 * */
	@RequestMapping(value="/books/add", method=RequestMethod.POST)
	public String regist(@ModelAttribute("vo")BookVo vo,Errors errors,@RequestParam("uploadFile")MultipartFile uploadFile) {
		//File file = new File("C:/bookImage/"+uploadFile.getOriginalFilename());
		String filePath="C:/bookImage";
		File dir = new File(filePath);
		
		// 디렉터리 없으면 생성
		if(dir.isDirectory()) {
			if(!dir.exists()) {
				dir.mkdir();
				System.out.println("C:/bookImage 생성 완료");
			}
			System.out.println("C:/bookImage 확인 완료");
		}
		
		vo.setBookImageName(uploadFile.getOriginalFilename());
		
		// 값 유효성 검사
		new RegFormValidator().validate(vo, errors);
		if(errors.hasErrors()) {
			return "books/regForm";
		}
		
		
		try {
			bookService.regist(vo);
		}catch(DuplicateIsbnException e) {
			errors.rejectValue("isbn", "duplicate");
			return "/books/regForm";
		}catch(UnAttachedFileException e) {
			errors.rejectValue("bookImageName", "unattached");
			return "/books/regForm";
		}
		
		
		File file = new File(filePath+"/"+uploadFile.getOriginalFilename());
		try {
			uploadFile.transferTo(file);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return "redirect:/books/list";
	}
	
	@RequestMapping(value="/books/list")
	public String list(Model model,HttpServletRequest request) {
		int pageNum;
		if(request.getParameter("pageNum")==null) {
			pageNum=1;
		}else {
			pageNum= Integer.parseInt(request.getParameter("pageNum"));
		}
		Paging page = new Paging();
		page.pagedArticleList(pageNum);
		
		int totalRowCount= bookService.selectRowCount();
		page.setPageVar(pageNum,totalRowCount);
		List<BookVo> list= bookService.list(page);
		

		model.addAttribute("page",page);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);
		
		if (page.getStartPageNum() > page.getPageBlock()) {
			model.addAttribute("firstBlock", true); // 이전 버튼 활성화
		}
		if (page.getLastPageNum() < page.getTotalPageCount()) {
			model.addAttribute("lastBlock", true); // 다음 버튼 활성화
		}
		return "/books/list";
	}
	
	@RequestMapping(value="/books/detail/{id}")
	public String detail(@PathVariable("id")int id,Model model) {
		BookVo vo = bookService.read(id);
		model.addAttribute("vo",vo);
		return "/books/detail";
	}
	
	@RequestMapping(value="/books/search")
	public String search(String keyword,Model model) {
		List<BookVo> list = bookService.selectByKeyword(keyword);
		model.addAttribute("list",list);
		return "/books/list";
	}
	
	@RequestMapping(value="/books/delete/{id}")
	public String delete(@PathVariable("id")int id) {
		bookService.delete(id);
		return "redirect:/books/list";
	}
}
