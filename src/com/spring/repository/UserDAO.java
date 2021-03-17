
package com.spring.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
import com.spring.mapper.UserMapper;

@Repository
public class UserDAO{

    @Autowired
    private UserMapper userMapper;
    
    public String checkUserId(String id) {
      return userMapper.checkUserId(id);
    }
    
    /*회원가입 - 정보 입력*/
    public void insertUserInfo(UserDTO userDTO){
        userMapper.insertUserInfo(userDTO);
    }
    /*userNum가져오기*/
    public UserDTO getUserInfo(String id) {
    	return userMapper.getUserInfo(id);
    }
    public LoginUserDTO loginSelect(LoginDTO loginUserDTO) {
    	return userMapper.loginSelect(loginUserDTO);
    }
    public LoginAuthDTO getLoginUser(LoginDTO loginUserDTO) {
    	return userMapper.getLoginUser(loginUserDTO);
    }
    public void lastLogin(LoginDTO loginUserDTO) {
    	userMapper.lastLogin(loginUserDTO);
    }
    public String idSearch(IdSearchUserDTO idsearchUserDTO) {
    	return userMapper.idSearch(idsearchUserDTO);
    }
    public String pwSearch(PwSearchDTO pwsearchUserDTO) {
    	return userMapper.pwSearch(pwsearchUserDTO);
    }
    public String selectSearchPw(PwPermuteDTO pwPermuteUserDTO) {
    	return userMapper.selectSearchPw(pwPermuteUserDTO);
    }
    public void pwUpdate(PwPermuteDTO pwPermuteUserDTO) {
    	userMapper.pwUpdate(pwPermuteUserDTO);
    }
    public String selectModifyPw(UserModifyDTO userModifyDTO) {
    	return userMapper.selectModifyPw(userModifyDTO);
    }
    public void infoUpdate(UserInfoModifyDTO userInfoModifyDTO) {
    	userMapper.infoUpdate(userInfoModifyDTO);
    }
    public void infoDelete(int userNum) {
    	userMapper.infoDelete(userNum);
    }
    
    // user_auth 테이블에 insert 하기 
    public void insertAuthKey(UserEmailAuthDTO userEmailAuthDTO) {
    	userMapper.insertAuthKey(userEmailAuthDTO);
    }
    
    public UserEmailAuthDTO getAuthKey(String email,String authKey) {
    	return userMapper.getAuthKey(email,authKey);
    }
    
    public int updateAuthStatus(UserEmailAuthDTO userEmailAuthDTO) {
    	return userMapper.updateAuthStatus(userEmailAuthDTO);
    }
    
    public void deleteAuthKey(String email) {
    	userMapper.deleteAuthKey(email);
    }
}