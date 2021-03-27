package com.spring.controller;

import java.time.Duration;
import java.time.LocalDateTime;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.user.IdSearchUserDTO;
import com.spring.dto.user.LoginAuthDTO;
import com.spring.dto.user.LoginDTO;
import com.spring.dto.user.LoginUserDTO;
import com.spring.dto.user.PwPermuteDTO;
import com.spring.dto.user.PwSearchDTO;
import com.spring.dto.user.UserDTO;
import com.spring.dto.user.UserEmailAuthDTO;
import com.spring.dto.user.UserInfoModifyDTO;
import com.spring.dto.user.UserModifyDTO;
import com.spring.service.MailAuthService;
import com.spring.service.UserService;
import com.spring.valiator.UserVaildator;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MailAuthService mailAuthService;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	@Resource(name = "loginUserBean")
	private LoginUserDTO loginUserBean;
	
	
	/* 회원가입 양식 */
	@RequestMapping(value = "/join", method = {RequestMethod.POST,
			RequestMethod.GET})
	public String join_form(@ModelAttribute("userDTO") UserDTO userDTO) {
		return "user/join";
	}
	/* 회원가입 */
	@PostMapping(value = "/join/join_proc")
	public String join_proc(@Valid @ModelAttribute("userDTO") UserDTO userDTO,
			BindingResult result) {
		if (result.hasErrors()) {
			return "user/join";
		}
		String pw1 = passwordEncoder.encode(userDTO.getPw1());
		userDTO.setPw1(pw1);
		
		//정보를 넣고 userNum을 받아오도록 함 
		UserDTO registUser = userService.insertUserInfo(userDTO);
		
		//메일 인증 발송 
		LocalDateTime now = LocalDateTime.now();
		String authKey = mailAuthService.sendAuthMail(registUser.getEmail(),now);
		UserEmailAuthDTO userEmailAuthDTO = new UserEmailAuthDTO(registUser.getUserNum(),registUser.getEmail(),authKey,now,0); //authoSatus = 0 인증전
	
		// db업데이트 하기 UserEmailAuthDTO이용하기 
		mailAuthService.insertAuthKey(userEmailAuthDTO);
		
		
		return "redirect:joinResult";
		
	
	}
	/* 가입완료 */
	@GetMapping(value = "join/joinResult")
	public String joinResult() {
		return "user/joinResult";
	}
	
	@GetMapping("user/emailConfirmError")
	public String test() {
		return "user/emailConfirmError";
	}
	
	/*메일 인증 완료*/
	@GetMapping("join/signUpConfirm")
	public String signUpConfirm(@RequestParam("email") String email, @RequestParam("authKey") String authKey) {
		
		
		//이 이메일이 유효한지 확인 --> authkey가 필요함 
		UserEmailAuthDTO userEmailAuthDTO = mailAuthService.getAuthKey(email,authKey);
		long time = Duration.between(LocalDateTime.now(), userEmailAuthDTO.getEndTime().toLocalDateTime()).toMinutes();
		System.out.println("time: " + time);
		if(time < 0) {
			
			return "user/emailConfirmError";
			
			
		}
		
		
		if(userEmailAuthDTO.getAuthStatus() == 0) {
			//미인증 상태일때
			int updateCount = mailAuthService.updateAuthStatus(userEmailAuthDTO);				
				if(updateCount == 1) {
					return "redirect:/login";
				}
			
		}else {
			//인증 상태일때 
			System.out.println("이미 인증된 회원입니다.");
		}
		
		return "redirect:login";
	}

	/* 로그인 */
	@RequestMapping(value = "/login", method = {RequestMethod.POST,
			RequestMethod.GET})
	public String login(@ModelAttribute("loginUserDTO") UserDTO loginUserDTO) {
		System.out.println("loginUserBean-> " + loginUserBean);
		return "user/login";
	}

	/* 로그인 */
	@RequestMapping(value = "/login/login_proc", method = {RequestMethod.POST,
			RequestMethod.GET})
	public String loginproc(
			@Valid @ModelAttribute("loginUserDTO") LoginDTO loginUserDTO,
			BindingResult result, HttpSession session) {

		if (result.hasErrors()) {
			
			if(userService.checkUserId(loginUserDTO.getId())) {
				return "/user/loginResult";
			}

			LoginAuthDTO loginAuthDTO = userService.getLoginUser(loginUserDTO);
			
			//인증이 완료되지 않은 사용자
			if(loginAuthDTO.getAuthStatus() == 0) {
				
				return "redirect:/join/joinResult";
			}
			
			
			String password = loginUserDTO.getPw1();
			if (passwordEncoder.matches(password, loginAuthDTO.getPw()) == true) {
				loginUserDTO.setLogLogin(true);
				userService.loginSelect(loginUserDTO);
				session.setAttribute("loginUser", loginUserBean);
				return "redirect:/";
			}
			loginUserDTO.setLogLogin(false);
			return "user/login";
		}
		return "user/login";
	}
	/* 로그아웃 */
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		userService.logout();
		session.setAttribute("loginUser", loginUserBean);

		return "redirect:/";
	}
	/* id 찾기 */
	@RequestMapping(value = "/user/idSearch", method = {RequestMethod.POST,
			RequestMethod.GET})
	public String idSearch(
			@ModelAttribute("idsearchUserDTO") IdSearchUserDTO idsearchUserDTO) {

		return "user/idSearch";
	}
	@RequestMapping(value = "/user/idSearch_proc", method = {RequestMethod.POST,
			RequestMethod.GET})
	public String idSearch_proc(
			@Valid @ModelAttribute("idsearchUserDTO") IdSearchUserDTO idsearchUserDTO,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			// 에러 발생
			if (userService.idSearch(idsearchUserDTO) == null) { // 못찾음 -> 에러
				idsearchUserDTO.setIdSearch(false);
				return "user/idSearch";
			}
			// 에러 없을때
			idsearchUserDTO.setIdSearch(true);

			String id = userService.idSearch(idsearchUserDTO);
			model.addAttribute("id", id);

			return "user/idResult";
		}
		return "user/idResult";
	}

	/* password 찾기 */
	@RequestMapping(value = "/user/pwSearch", method = {RequestMethod.GET,
			RequestMethod.POST})
	public String pwSearch(
			@ModelAttribute("pwsearchUserDTO") PwSearchDTO pwsearchUserDTO) {
		return "user/pwSearch";
	}
	@RequestMapping(value = "/user/pwSearch_proc", method = {RequestMethod.GET,
			RequestMethod.POST})
	public String pwSearch(
			@Valid @ModelAttribute("pwsearchUserDTO") PwSearchDTO pwsearchUserDTO,
			BindingResult result, Model model, RedirectAttributes rttr) {
		if (result.hasErrors()) {
			if (userService.pwSearch(pwsearchUserDTO) != null) { // db에 pw == null 이면
				pwsearchUserDTO.setPwSearch(true);

				PwPermuteDTO pwPermuteUserDTO = new PwPermuteDTO();
				String id = pwsearchUserDTO.getId();
				pwPermuteUserDTO.setId(id);
				String email = pwsearchUserDTO.getEmail();
				pwPermuteUserDTO.setEmail(email);
				String tel = pwsearchUserDTO.getTel();
				pwPermuteUserDTO.setTel(tel);

				model.addAttribute("pwPermuteUserDTO", pwPermuteUserDTO);
				return "user/pwPermute";
			}
			pwsearchUserDTO.setPwSearch(false);
			return "user/pwSearch";
		}
		return "user/pwSearch";
	}

	/* password 변경하기 */
	@RequestMapping(value = "/user/pwPermute", method = {RequestMethod.GET,
			RequestMethod.POST})
	public String pwPermute(
			@ModelAttribute("pwPermuteUserDTO") PwPermuteDTO pwPermuteUserDTO,
			Model model) {
		model.addAttribute("pwPermuteUserDTO", pwPermuteUserDTO);
		return "user/pwPermute";
	}

	@RequestMapping(value = "/user/pwPermute_proc", method = {RequestMethod.GET,
			RequestMethod.POST})
	public String pwPermute_proc(
			@Valid @ModelAttribute("pwPermuteUserDTO") PwPermuteDTO pwPermuteUserDTO,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			PwPermuteDTO pwPermuteDTO = (PwPermuteDTO) model
					.getAttribute("pwPermuteUserDTO");

			pwPermuteUserDTO.setId(pwPermuteDTO.getId());
			pwPermuteUserDTO.setEmail(pwPermuteDTO.getEmail());
			pwPermuteUserDTO.setTel(pwPermuteDTO.getTel());

			String pw1 = userService.selectSearchPw(pwPermuteUserDTO);
			String pw2 = pwPermuteUserDTO.getPw1();
			if (passwordEncoder.matches(pw2, pw1) == false) {

				pwPermuteUserDTO.setPwSearch(true);
				String pw3 = passwordEncoder.encode(pwPermuteUserDTO.getPw1());
				pwPermuteUserDTO.setPw1(pw3);
				userService.pwUpdate(pwPermuteUserDTO);

				LoginDTO loginDTO = new LoginDTO();
				model.addAttribute("loginUserDTO", loginDTO);
				return "user/login";
			}
			pwPermuteUserDTO.setPwSearch(false);
			return "user/pwPermute";
		}

		return "user/pwPermute";
	}

	@RequestMapping(value = "/infoModify", method = {RequestMethod.GET,
			RequestMethod.POST})
	public String infoModify(@ModelAttribute("userModifyDTO")UserModifyDTO userModifyDTO) {

		
		return "infoModify";
	}
	@RequestMapping(value = "/infoModify_proc", method = {RequestMethod.GET,
			RequestMethod.POST})
	public String infoModify_proc(@Valid @ModelAttribute("userModifyDTO")UserModifyDTO userModifyDTO, BindingResult result,UserInfoModifyDTO userInfoModifyDTO, Model model) {
		if (result.hasErrors()) {
			userModifyDTO.setId(loginUserBean.getId());
			String pw = userService.selectModifyPw(userModifyDTO);
			String pw1 = userModifyDTO.getPw();
			System.out.println("con");
			if (passwordEncoder.matches(pw1, pw) == true) {
				System.out.println("con");
				userModifyDTO.setModifyPw(true);	
				return "infoModify_form";
			}
			System.out.println("con");
			model.addAttribute("userInfoModifyDTO", userInfoModifyDTO);
			userModifyDTO.setModifyPw(false);
			return "infoModify";
		}
		return "infoModify";
	}
	@RequestMapping(value ="/infoModify_form",method = {RequestMethod.GET,RequestMethod.POST})
	public String infoModify_form(@ModelAttribute("userInfoModifyDTO") UserInfoModifyDTO userInfoModifyDTO) {
		
		return "infoModify_form";
	}
	@RequestMapping(value = "/infoModify_form_proc", method = {RequestMethod.GET,RequestMethod.POST})
	public String infoModify_form_proc(@Valid @ModelAttribute("userInfoModifyDTO") UserInfoModifyDTO userInfoModifyDTO,BindingResult result) {
		if (result.hasErrors()) {
			
			return "infoModify_form";
		}
		userInfoModifyDTO.setUserNum(loginUserBean.getUserNum());
		String pw1 = passwordEncoder.encode(userInfoModifyDTO.getPw1());
		userInfoModifyDTO.setPw1(pw1);
		userService.infoUpdate(userInfoModifyDTO);
		return "/home";
	}
	@RequestMapping(value = "/infoDelete", method = {RequestMethod.GET,
			RequestMethod.POST})
	public String infoDelete(HttpSession session) {
		int userNum = loginUserBean.getUserNum();
		userService.infoDelete(userNum);

		userService.logout();
		session.setAttribute("loginUser", loginUserBean);
		

		return "home";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		UserVaildator validator = new UserVaildator();
		binder.addValidators(validator);
	}
}
