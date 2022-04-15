package com.model2.mvc.web.wishlist;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.domain.Wishlist;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.wishlist.WishlistService;


//==> 회원관리 Controller
//@Controller
public class WishListController {
	
	///Field
	@Autowired
	@Qualifier("wishlistServiceImpl")
	private WishlistService wishlistService;
	
	
	
	//setter Method 구현 않음
		
	public WishListController(){
		System.out.println(this.getClass());
	}
	
	
	

	
	@RequestMapping("/addWishlist.do")//테스트완료
	public String addWishlist( @ModelAttribute("wishlist") Wishlist wishlist) throws Exception {
		
		System.out.println("/addWishlist.do");
		//Business Logic
		wishlistService.addWishlist(wishlist);
		
		return "redirect:/getWishlist.do";
	}
	

	
	@RequestMapping("/getWishlist.do")//테스트완료
	public String listProduct( @ModelAttribute("search") Search search , Model model ,HttpSession session) throws Exception{
		
		System.out.println("/getWishlist.do");
		
		
		
		// Business logic 수행
		User user = (User) session.getAttribute("user");
		List<Wishlist> list = wishlistService.getWishlist(user.getUserId());
		
		
		// Model 과 View 연결
		model.addAttribute("wishList", list);
		
		return "forward:/wishList/wishList.jsp";
	}
	
	
	@RequestMapping("/deleteWishlist.do")//테스트완료
	public String deleteWishlist( @RequestParam("wishNo") int wishNo) throws Exception {
		
		System.out.println("/addWishlist.do");
		//Business Logic
		wishlistService.deleteWishlist(wishNo);
		
		return "redirect:/getWishlist.do";
	}
}