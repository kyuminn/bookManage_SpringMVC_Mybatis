package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.exception.AlreadyExistingMemberException;
import member.exception.ConfirmPwdNotMatchingException;
import member.exception.IdPasswordNotMatchingException;
import member.service.MemberService;
import member.validator.RegistFormValidator;
import member.vo.MemberVo;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	public MemberController(MemberService memberService) {
		this.memberService=memberService;
	}
	
	@RequestMapping(value="/member/regist",method=RequestMethod.GET)
	public String regist(Model model) {
		model.addAttribute("formData",new MemberVo());
		return "/member/registForm";
	}
	
	@RequestMapping(value="/member/regist",method=RequestMethod.POST)
	public String regist(@ModelAttribute("formData")MemberVo vo,Errors errors) {
		new RegistFormValidator().validate(vo, errors);
		if(errors.hasErrors()) {
			return "/member/registForm";
		}
		try {
			memberService.regist(vo);
		}catch(ConfirmPwdNotMatchingException e) {
			errors.rejectValue("confirmPassword", "notMatching");
			return "/member/registForm";
		}catch(AlreadyExistingMemberException e) {
			errors.rejectValue("email", "duplicate");
			return "/member/registForm";
		}

		return "redirect:/";
	}
	
	@RequestMapping(value="/member/login",method=RequestMethod.GET)
	public String login(@ModelAttribute("loginFormData")MemberVo vo) {
		return "/member/login";
	}
	
	@RequestMapping(value="/member/login",method=RequestMethod.POST)
	public String login(@ModelAttribute("loginFormData")MemberVo vo,Errors errors,HttpSession session) {
		try {
			MemberVo loginSession=memberService.login(vo);
			session.setAttribute("loginSession", loginSession);
		}catch(IdPasswordNotMatchingException e) {
			errors.reject("emailPwdNotMatching");
			return "/member/login";
		}
		return "redirect:/";
	}
	@RequestMapping(value="/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
