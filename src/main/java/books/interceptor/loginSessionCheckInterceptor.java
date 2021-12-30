package books.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import member.vo.MemberVo;

// xml 설정파일에 interceptor bean 등록하기
// HandlerInterceptor interface를 바로 구현하면 모든 메서드를 오버라이딩해야 하는데, 필요한 메서드(preHandle)만 구현하고 싶을 때는 Adapter pattern 적용
public class loginSessionCheckInterceptor extends HandlerInterceptorAdapter{
	
	// 로그인 한 상태에서만 books 에 접근할 수 있도록 만들기
	// preHandle: controller 동작 전에, intercept 하는 method
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false); // 세션이 없다면 생성하지 않음
		if (session!=null) {
			MemberVo loginSession = (MemberVo)session.getAttribute("loginSession");
			if (loginSession!=null) {
				return true; // true 반환되면 bookController 동작
			}
		}
		// loginSession 값이 없으면 (로그인되어있지 않으면) 로그인 페이지로 리다이렉트
		response.sendRedirect(request.getContextPath()+"/member/login");
		return false;
	}


}
