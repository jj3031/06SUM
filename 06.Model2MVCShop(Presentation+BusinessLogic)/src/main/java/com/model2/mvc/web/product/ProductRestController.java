package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	

	@RequestMapping( value="json/addProduct", method=RequestMethod.POST )
	public Product addUser(	@RequestBody Product product,
									HttpSession session ) throws Exception{
	
		System.out.println("/product/json/addProduct : POST");
		//Business Logic
		System.out.println("::"+product);
		productService.addProduct(product);
		Product dbProduct=product;
		
		
		return dbProduct;
	}
	
	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET )
	public Product getProduct( @PathVariable int prodNo ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping( value="json/listProduct", method=RequestMethod.POST )
	public JSONObject listProduct( @RequestBody Search search) throws Exception{
		
		System.out.println("/product/json/listProduct : POST");
		
		System.out.println("::"+search);
		search.setPageSize(pageSize);
		
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		JSONObject jsonobj =new JSONObject();
		jsonobj.put("resultPage", resultPage);
		jsonobj.put("prodList", map);
		jsonobj.put("search",search);
		
		System.out.println(jsonobj);
		
		//Business Logic
		return jsonobj;
	}
}