package com.model2.mvc.web.kakao;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.kakao.impl.KakaoImpl;
import com.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/kakao/*")
public class KakaoLoginContoller {
	
	
	@Autowired
	@Qualifier("kakaoImpl")
    private KakaoImpl kakao;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public KakaoLoginContoller() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/")
    public String index() {
        
        return "index";
    }
	
	//@RequestMapping("/loginView.do")
	//public String loginView() throws Exception{
	@RequestMapping( value="login")
	public String login(@RequestParam("code") String code, HttpSession session) throws Exception{
		
		String access_Token = kakao.getAccessToken(code);
	    HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("email") != null) {
	        session.setAttribute("userId", userInfo.get("email"));
	        session.setAttribute("access_Token", access_Token);
	    }
	    String userId= (String) userInfo.get("email");
		System.out.println("/user/login : POST");
		//Business Logic
		if(userService.checkDuplication(userId)){
			
			return "redirect:/user/addUserViewByKakao.jsp";
		}else {
			
			User dbUser=userService.getUser(userId);
			if(dbUser.getAddPath().equals("kakao")) {
				session.setAttribute("user", dbUser);
			}
			
			
		return "redirect:/index.jsp";
		}
	}
	
	@RequestMapping( value="logout")
	public String logout(HttpSession session) throws Exception{
		
		
		kakao.kakaoServiceLogout((String)session.getAttribute("access_Token"));
	    kakao.kakaoLogout();
	    
	    session.removeAttribute("access_Token");
	    session.removeAttribute("userId");
	    session.invalidate();
	    
		return "redirect:/user/logout";
	}	
	

	
}
