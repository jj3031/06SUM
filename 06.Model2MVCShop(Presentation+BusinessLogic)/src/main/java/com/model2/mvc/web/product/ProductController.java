package com.model2.mvc.web.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserService;


//==> ȸ������ Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	
	
	//setter Method ���� ����
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@Value("#{commonProperties['filePath']}")
	String temDir;
	
	@RequestMapping("addProductView") //�׽�Ʈ�Ϸ�
	public String addProductView() throws Exception {

		System.out.println("/addProductView.do");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	@RequestMapping("addProduct")//�׽�Ʈ�Ϸ�
	public String addProduct(@ModelAttribute("product") Product product, @RequestParam("file") List<MultipartFile> files, HttpServletRequest request ) throws Exception {
		//@ModelAttribute("product") Product product, 
		System.out.println("/addProduct");
		
//		if(FileUpload.isMultipartContent(request)) {
//		
//		String temDir="C:\\Users\\bitcamp\\git\\repository\\06.Model2MVCShop(Presentation+BusinessLogic)\\src\\main\\webapp\\images\\uploadFiles\\";
//		//Business Logic
//		DiskFileUpload fileUpload = new DiskFileUpload();
//		fileUpload.setRepositoryPath(temDir);
//		fileUpload.setSizeMax(1024*1024*100);
//		fileUpload.setSizeThreshold(1024*100);
//		
//		if(request.getContentLength()<fileUpload.getSizeMax()) {
//			Product product = new Product();
//			
//			StringTokenizer token = null;
//			
//			List fileItemList = fileUpload.parseRequest(request);
//			int Size = fileItemList.size();
//			for(int i=0; i<Size;i++) {
//				FileItem fileItem = (FileItem) fileItemList.get(i);
//				if(fileItem.isFormField()) {
//					if(fileItem.getFieldName().equals("manuDate")) {
//						token = new StringTokenizer(fileItem.getString("euc-kr"),"-");
//						String manuDate = token.nextToken()+token.nextToken()+token.nextToken();
//						product.setManuDate(manuDate);
//					}
//					else if(fileItem.getFieldName().equals("prodName")) 
//						product.setProdName(fileItem.getString("euc-kr"));
//					else if(fileItem.getFieldName().equals("prodDetail")) 
//						product.setProdDetail(fileItem.getString("euc-kr"));
//					else if(fileItem.getFieldName().equals("price")) 
//						product.setPrice(Integer.parseInt(fileItem.getString("euc-kr")));
//					else if(fileItem.getFieldName().equals("quantity")) 
//						product.setQuantity(Integer.parseInt(fileItem.getString("euc-kr")));
//					}else {//���������̸�
//						if(fileItem.getSize()>0) {
//						int idx = fileItem.getName().lastIndexOf("\\");
//						//getName�� ��θ� ���δ� �������� ������ ������ \\ �ڰ� ���� �̸�
//						if(idx==-1) {
//							idx=fileItem.getName().lastIndexOf("/");
//						}
//						String fileName = fileItem.getName().substring(idx+1);
//						System.out.println(fileName);
//						product.setFileName(fileName);
//						try {
//							File uploadFile = new File(temDir, fileName);
//							fileItem.write(uploadFile);
//						}catch(IOException e){
//							System.out.println(e);
//						}
//					}else {
//						product.setFileName("../../images/empty.GIF");
//					}
//				}//else
//			}//for
//		productService.addProduct(product);
//		
//		request.setAttribute("product", product);
//		}else {
//			int overSize = (request.getContentLength()/1000000);
//			System.out.println("<script> alert('������ ũ��� 1MB ���� �Դϴ�. �ø��� ���� �뷮��"+overSize+"MB �Դϴ�');");
//			System.out.println("history.back();</script>");
//			}
//		}else {
//			System.out.println("���ڵ� Ÿ���� multipart/form-data�� �ƴմϴ�.");
//			}
//			System.out.println(file.getOriginalFilename());
//			System.out.println(file.getName());
			List<String> imgFileName = new ArrayList<String>();
			
			for(int i=0; i<files.size();i++) {
			String fileName = files.get(i).getOriginalFilename();
			File saveFile = new File(temDir, fileName);
			files.get(i).transferTo(saveFile);
			imgFileName.add(fileName);
			}
			
			
			product.setFileName(imgFileName.toString());
			productService.addProduct(product);
			request.setAttribute("product", product);
			
			return "forward:/product/readProduct.jsp";
			
		}
	
	@RequestMapping("getProduct")//�׽�Ʈ�Ϸ�
	public String getUser( @RequestParam("prodNo") int prodNo , Model model ) throws Exception {
		
		System.out.println("/getProduct.do");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		
		
		model.addAttribute("fileName",product.getFileName());
		List<String> imgFile = new ArrayList<String>();
		if(product.getFileName().charAt(0)=='[') {
			String list = product.getFileName().substring(1);
			list = list.substring(0,list.length()-1);
			list = list.trim();
			System.out.println(list);
			String[] splitList = list.split(",");
			for(int i=0; i<splitList.length;i++) {
				splitList[i]=splitList[i].trim();
				imgFile.add(splitList[i]);
			}
			model.addAttribute("fileName",imgFile);
		}
		
		
		// Model �� View ����
		model.addAttribute("product", product);
		
		
		
		
		
		
		
		return "forward:/product/readProduct.jsp";
	}
	
	@RequestMapping("updateProductView")//�׽�Ʈ�Ϸ�
	public String updateUserView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("/updateProductView.do");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model �� View ����
		model.addAttribute("product", product);

		return "forward:/product/updateProductView.jsp";
	}
	
	@RequestMapping("updateProduct")//�׽�Ʈ�Ϸ�
	public String updateUser(@ModelAttribute("product") Product product, @RequestParam("file") List<MultipartFile> files, HttpServletRequest request ) throws Exception{

//		System.out.println("/updateProduct.do"); @ModelAttribute("product") Product product , 
//		//Business Logic
//		product = productService.updateProduct(product);
//		
//		System.out.println("�̰� �� ��¾ȵǳ� redirect:/getProduct.do?prodNo="+product.getProdNo());
//		int prodNo=0;
//		
//		if(FileUpload.isMultipartContent(request)) {
//			
//		String temDir="C:\\Users\\bitcamp\\git\\repository\\06.Model2MVCShop(Presentation+BusinessLogic)\\src\\main\\webapp\\images\\uploadFiles\\";
//		//Business Logic
//		DiskFileUpload fileUpload = new DiskFileUpload();
//		fileUpload.setRepositoryPath(temDir);
//		fileUpload.setSizeMax(1024*1024*100);
//		fileUpload.setSizeThreshold(1024*100);
//		
//		if(request.getContentLength()<fileUpload.getSizeMax()) {
//			Product product = new Product();
//			
//			StringTokenizer token = null;
//			
//			List fileItemList = fileUpload.parseRequest(request);
//			int Size = fileItemList.size();
//			for(int i=0; i<Size;i++) {
//				FileItem fileItem = (FileItem) fileItemList.get(i);
//				if(fileItem.isFormField()) {
//					if(fileItem.getFieldName().equals("manuDate")) {
//						token = new StringTokenizer(fileItem.getString("euc-kr"),"/");
//						String manuDate = token.nextToken()+token.nextToken()+token.nextToken();
//						product.setManuDate(manuDate);
//					}
//					else if(fileItem.getFieldName().equals("prodName")) 
//						product.setProdName(fileItem.getString("euc-kr"));
//					else if(fileItem.getFieldName().equals("prodDetail")) 
//						product.setProdDetail(fileItem.getString("euc-kr"));
//					else if(fileItem.getFieldName().equals("price")) 
//						product.setPrice(Integer.parseInt(fileItem.getString("euc-kr")));
//					else if(fileItem.getFieldName().equals("prodNo")) {
//						prodNo=Integer.parseInt(fileItem.getString("euc-kr"));
//						product.setProdNo(prodNo);}
//					}else {//���������̸�
//						if(fileItem.getSize()>0) {
//						int idx = fileItem.getName().lastIndexOf("\\");
//						//getName�� ��θ� ���δ� �������� ������ ������ \\ �ڰ� ���� �̸�
//						if(idx==-1) {
//							idx=fileItem.getName().lastIndexOf("/");
//						}
//						String fileName = fileItem.getName().substring(idx+1);
//						System.out.println(fileName);
//						product.setFileName(fileName);
//						try {
//							File uploadFile = new File(temDir, fileName);
//							fileItem.write(uploadFile);
//						}catch(IOException e){
//							System.out.println(e);
//						}
//					}else {
//						product.setFileName("../../images/empty.GIF");
//					}
//				}//else
//			}//for
		List<String> imgFileName = new ArrayList<String>();
		
		for(int i=0; i<files.size();i++) {
		String fileName = files.get(i).getOriginalFilename();
		File saveFile = new File(temDir, fileName);
		files.get(i).transferTo(saveFile);
		imgFileName.add(fileName);
		}
		
		
		product.setFileName(imgFileName.toString());	
		productService.updateProduct(product);
		
		request.setAttribute("product", product);
//		}else {
//			int overSize = (request.getContentLength()/1000000);
//			System.out.println("<script> alert('������ ũ��� 1MB ���� �Դϴ�. �ø��� ���� �뷮��"+overSize+"MB �Դϴ�');");
//			System.out.println("history.back();</script>");
//			}
//		}else {
//			System.out.println("���ڵ� Ÿ���� multipart/form-data�� �ƴմϴ�.");
//			}
		return "redirect:/product/getProduct?prodNo="+product.getProdNo();
	}


	
	@RequestMapping("listProduct")//�׽�Ʈ�Ϸ�
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/listProduct.do");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		
		if(search.getOrderCondition()!=null) {
			search.setOrderCondition(request.getParameter("orderCondition"));
		}
		System.out.println("�������� :"+request.getParameter("orderCondition"));
		
		
		// Business logic ����
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("prodList", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
}