package books.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import member.vo.MemberVo;

public class loginSessionCheckInterceptor extends HandlerInterceptorAdapter{
	
	// 로그인 한 상태에서만 books 에 접근할 수 있도록 만들기
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);
		if (session!=null) {
			MemberVo loginSession = (MemberVo)session.getAttribute("loginSession");
			if (loginSession!=null) {
				return true; // true 반환되면 bookController 동작
			}
		}
		// loginSession 값이 없으면 로그인 페이지로 리다이렉트
		response.sendRedirect(request.getContextPath()+"/member/login");
		return false;
	}


}
