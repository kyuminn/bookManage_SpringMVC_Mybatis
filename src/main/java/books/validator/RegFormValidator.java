package books.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import books.vo.BookVo;

public class RegFormValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return BookVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "isbn" , "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "bookName" , "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "writer", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "publisher", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "required");

		
		
	}

}
