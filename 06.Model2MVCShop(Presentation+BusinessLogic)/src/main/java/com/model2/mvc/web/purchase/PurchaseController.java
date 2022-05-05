package com.model2.mvc.web.purchase;

import java.util.ArrayList;
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
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.domain.Wishlist;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.wishlist.WishlistService;


//==> 회원관리 Controller
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("wishlistServiceImpl")
	private WishlistService wishlistService;
	
	//setter Method 구현 않음
		
	public PurchaseController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping("addPurchaseView")//테스트 완료
	public String addPurchaseView(@RequestParam("prod_no") int prodNo, @ModelAttribute("purchase") Purchase purchase, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("/addPurchaseView");
		purchase.setPurchaseProd(productService.getProduct(prodNo));
		User user = (User) session.getAttribute("user");
		purchase.setBuyer(user);
		
		request.setAttribute("purchase", purchase);
	
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	@RequestMapping("addPurchase")//테스트 완료
	public String addPurchase( @RequestParam("prodNo") int prodNo, @ModelAttribute("purchase") Purchase purchase,HttpSession session ) throws Exception {

		System.out.println("/addPurchase");
		//Business Logic
		purchase.setPurchaseProd(productService.getProduct(prodNo));
		User user = (User) session.getAttribute("user");
		purchase.setBuyer(user);
		purchaseService.addPurchase(purchase);
		
		return "forward:/purchase/readPurchase.jsp";
	}
	
	@RequestMapping("addPurchaseByWishlist")//테스트 완료
	public String addPurchaseByWishlist(@RequestParam("wishNo") int[] wishNo, @RequestParam("prodNo") int[] prodNo, @ModelAttribute("purchase") Purchase purchase,HttpSession session ) throws Exception {

		System.out.println("/addPurchaseByWishlist");
		//Business Logic
		for(int i=0; i<prodNo.length;i++) {
		purchase.setPurchaseProd(productService.getProduct(prodNo[i]));
		User user = (User) session.getAttribute("user");
		purchase.setBuyer(user);
		purchaseService.addPurchase(purchase);
		wishlistService.deleteWishlist(wishNo[i]);
		}
		return "forward:/purchase/readPurchase.jsp";
	}
	
	@RequestMapping("addPurchaseViewByWishlist")
	public String addPurchaseViewByWishlist(@RequestParam("wishNo") int[] wishNo, @ModelAttribute("purchase") Purchase purchase, HttpServletRequest request, HttpSession session) throws Exception {
		
		List<Wishlist> list = new ArrayList<Wishlist>();
		
		for(int i=0; i<wishNo.length;i++) {
		Wishlist wishList = new Wishlist();
		wishList = wishlistService.findWishlist(wishNo[i]);
		list.add(wishList);
		}
		
		User user = (User) session.getAttribute("user");
		purchase.setBuyer(user);
		
		request.setAttribute("purchase", purchase);	
		request.setAttribute("wishlist", list);
	
		return "forward:/purchase/addPurchaseViewByWishlist.jsp";
	}
	
	@RequestMapping("getPurchase")//테스트완료
	public String getUser( @RequestParam("tranNo") int tranNo , Model model ) throws Exception {
		
		System.out.println("/getPurchase");
		//Business Logic
		Purchase purchase = purchaseService.getPurchase(tranNo);
		purchase.setPurchaseProd(productService.getProduct(purchase.getPurchaseProd().getProdNo()));
				
		// Model 과 View 연결
		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/readPurchase.jsp";
	}
	
	@RequestMapping("updatePurchaseView")
	public String updateUserView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("/updateProductView");
		//Business Logic
		Purchase purchase = purchaseService.getPurchase(prodNo);
		// Model 과 View 연결
		model.addAttribute("purchase", purchase);
		
		return "forward:/product/updateProductView.jsp";
	}
	
	@RequestMapping("updatePurchase")
	public String updatePurchase( @ModelAttribute("purchase") Purchase purchase , Model model , HttpSession session) throws Exception{

		System.out.println("/updateProduct.do");
		//Business Logic
		purchase = purchaseService.updatePurchase(purchase);
		
		
		return "redirect:/product/getProduct?prodNo=";
	}

	@RequestMapping("updateTranCode")//테스트 완료
	public String updateTranCode( @RequestParam("tranNo") int tranNo, @RequestParam("tranCode") String tranCode, @ModelAttribute("purchase") Purchase purchase , Model model , HttpSession session) throws Exception{

		System.out.println("/updateTranCode.do");
		//Business Logic
		purchase.setTranCode(tranCode);
		purchase.setTranNo(tranNo);
		purchaseService.updateTranCode(purchase);
		
		
		return "redirect:/purchase/listPurchase";
	}
	
	@RequestMapping("listPurchase")//테스트 완료
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request, HttpSession session) throws Exception{
		
		System.out.println("/listPurchase");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		
		if(search.getOrderCondition()!=null) {
			search.setOrderCondition(request.getParameter("orderCondition"));
		}
		System.out.println("정렬조건 :"+request.getParameter("orderCondition"));
		
		User user = (User) session.getAttribute("user");
		
		// Business logic 수행
		Map<String , Object> map=purchaseService.getPurchaseList(search, user.getUserId());
		
		List<Purchase> list=(List<Purchase>) map.get("list");
		for(int i=0; i<list.size();i++) {
			list.get(i).setBuyer(userService.getUser(list.get(i).getBuyer().getUserId()));
			
		}
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("purchaseList", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/purchase/listPurchase.jsp";
	}
}