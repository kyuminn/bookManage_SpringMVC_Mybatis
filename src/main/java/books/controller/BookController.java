package books.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
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

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	
	@RequestMapping(value="/books/add" ,method=RequestMethod.GET)
	public String regist(@ModelAttribute("vo")BookVo vo) {
		return "/books/regForm";
	}
	
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

		return "redirect:/";
	}
	
	@RequestMapping(value="/books/list")
	public String list(Model model) {
		List<BookVo> list = bookService.list();
		model.addAttribute("list",list);
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
}
