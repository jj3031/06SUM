package com.model2.mvc.web.kakao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.service.kakao.KakaoPay;
import com.model2.mvc.service.kakao.impl.KakaoPayImpl;
 
 

@Controller
@RequestMapping("/kakaoPay/*")
public class KakaoPayController {
    
	
	@Autowired
	@Qualifier("kakaoPayImpl")
    private KakaoPay kakaoPay;
    
    
	@RequestMapping( value="kakaoPay")
    public String kakaoPay() {
        System.out.println("kakaoPay post............................................");
        
        return "redirect:" + kakaoPay.kakaoPayReady();
 
    }
    
    @RequestMapping("kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
    	System.out.println("kakaoPaySuccess get............................................");
    	System.out.println("kakaoPaySuccess pg_token : " + pg_token);
        
    }
    
}