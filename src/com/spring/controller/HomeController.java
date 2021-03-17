package com.spring.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dto.EventDTO;
import com.spring.dto.SearchDTO;
import com.spring.dto.payment.CouponInfoDTO;
import com.spring.dto.payment.PaymentDTO;
import com.spring.dto.payment.PointDTO;
import com.spring.dto.user.LoginUserDTO;
import com.spring.dto.user.UserLikeDTO;
import com.spring.gds.dto.GdsInfoDTO;
import com.spring.service.CartService;
import com.spring.service.CouponService;
import com.spring.service.EventService;
import com.spring.service.GdsService;
import com.spring.service.OrderService;
import com.spring.service.PaymentService;
import com.spring.service.UserLikeService;

@Controller
public class HomeController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private GdsService gdsService;

	@Autowired
	private UserLikeService userLikeService;

	@Autowired
	private PaymentService paymentService;

	@Autowired
	private CouponService couponService;

	@Autowired
	private CartService cartService;
	
	@Autowired
	private EventService eventService;

	@Resource(name = "loginUserBean")
	private LoginUserDTO loginUserBean;

	// �씠嫄� �삷寃⑥빞�븿
	@RequestMapping(value = "/", method = { RequestMethod.POST, RequestMethod.GET })
	public String home(HttpSession session, Model model) {
		session.setAttribute("loginUser", loginUserBean);

	
		return "home";
	}

	@RequestMapping(value = "/shoplist", method = { RequestMethod.POST, RequestMethod.GET })
	public String shopList(Model model) {

		List<GdsInfoDTO> gdsInfoList = gdsService.getAllGdsList();
		System.out.println("size: " + gdsInfoList.size());

		if (loginUserBean.isCheck() == true) {
			List<Integer> userLikeList = userLikeService.getUserLikeGdsList(loginUserBean.getUserNum());

			for (GdsInfoDTO dto : gdsInfoList) {
				long num1 = dto.getGdsNum();
				for (Integer integer : userLikeList) {
					long num2 = (long) integer;
					if (num1 == num2) {
						dto.setLike(true);
					}
				}
			}

			model.addAttribute("GdsInfoList", gdsInfoList);
			return "shopList";
		}

		model.addAttribute("GdsInfoList", gdsInfoList);
		return "shopList";
	}
	
	
	
	@RequestMapping(value = "/list.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String searchResult(SearchDTO searchDTO, Model model) {

		String keyword = searchDTO.getKeyword();
		List<GdsInfoDTO> searchResult = gdsService.searchResult(keyword);
		int totalRow = searchResult.size();
	

		if (loginUserBean.isCheck() == true) {
			List<Integer> userLikeList = userLikeService.getUserLikeGdsList(loginUserBean.getUserNum());

			for (GdsInfoDTO dto : searchResult) {
				long num1 = dto.getGdsNum();
				for (Integer integer : userLikeList) {
					long num2 = (long) integer;
					if (num1 == num2) {
						dto.setLike(true);
					}
				}
			}
			
			model.addAttribute("totalRow", totalRow);
			model.addAttribute("SearchResult", searchResult);
			model.addAttribute("searchWord", keyword);
			return "shopList";
		}
		model.addAttribute("totalRow", totalRow);
		model.addAttribute("searchWord", keyword);
		model.addAttribute("SearchResult", searchResult);
		return "shopList";
	}
	
	
	
	

	@RequestMapping(value = "/myPage", method = { RequestMethod.POST, RequestMethod.GET })
	public String myPage(Model model) {

		int userNum = loginUserBean.getUserNum();

		List<PaymentDTO> myPage = paymentService.myPage(userNum);
		model.addAttribute("mp", myPage);

		PointDTO totalPoint = paymentService.totalPoint(userNum);
		model.addAttribute("totalPoint", totalPoint);

		List<CouponInfoDTO> cpList = couponService.cpList(userNum);
//		model.addAttribute("cpList", cpList);

		int cpCount = cpList.size();
		model.addAttribute("cpCount", cpCount);

		int userLikeListCount = userLikeService.getUserLikeCount(userNum);
		model.addAttribute("userLikeListCount", userLikeListCount);

		int cartCount = cartService.getCartCount(userNum);
		model.addAttribute("cartCount", cartCount);
		
		ArrayList<EventDTO> eventList = eventService.getEventAll(userNum);
		
		Iterator<EventDTO> iter = eventList.iterator();
		while(iter.hasNext()) {
			EventDTO dto = iter.next();
			dto.dateToString();
			dto.setFullDate();
		}
		
		model.addAttribute("eventList", eventList);

		return "myPage";
	}

	@GetMapping("/userlike")
	public String userLike(Model model) {


		List<UserLikeDTO> userLikeList = userLikeService.getUserLikeList(loginUserBean.getUserNum());
		model.addAttribute("UserLikeList", userLikeList);

	
		return "userlike";
	}
	
	@GetMapping(value = "/userlike.do")
	public String userLikeDelete(@RequestParam(value = "gdsNum") int gdsNum, Model model) {
		
		UserLikeDTO userLikeDTO = new UserLikeDTO(gdsNum, loginUserBean.getUserNum());
		userLikeService.deleteUserLike(userLikeDTO);
		
		return "redirect:/userlike";
	}

}
