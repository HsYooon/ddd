package com.spring.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.dto.user.IdSearchUserDTO;
import com.spring.dto.user.LoginAuthDTO;
import com.spring.dto.user.LoginDTO;
import com.spring.dto.user.LoginUserDTO;
import com.spring.dto.user.PwPermuteDTO;
import com.spring.dto.user.PwSearchDTO;
import com.spring.dto.user.UserDTO;
import com.spring.dto.user.UserEmailAuthDTO;
import com.spring.dto.user.UserInfoModifyDTO;
import com.spring.dto.user.UserLikeDTO;
import com.spring.dto.user.UserModifyDTO;

public interface UserMapper {

	@Select("select id from user_info where id = #{id}")
	String checkUserId(String id);

	@Insert("insert into user_info(name, id, pw, email, tel, regDate, mAddr, lAddr, dlAddr)\r\n" + 
  		"VALUES(#{name},#{id},#{pw1},#{email},#{tel},now(),#{mAddr},#{lAddr},#{dlAddr})")
	void insertUserInfo(UserDTO userDTO);
	
	@Select("select userNum,email,authStatus from user_info where id=#{id}")
	UserDTO getUserInfo(String id);
  
	@Select("select userNum, name, id, email, tel, regDate, mAddr, lAddr, dlAddr from user_info where id=#{id}")
	LoginUserDTO loginSelect(LoginDTO loginUserDTO);
  
	@Select("select userNum,id,pw,email,authStatus from user_info where id=#{id}")
	LoginAuthDTO getLoginUser(LoginDTO loginUserDTO);
  
	@Update("update user_info set lastData = sysdate where id = #{id}")
	void lastLogin(LoginDTO loginUserDTO);
	
	@Select("select id from user_info where name = #{name} and email = #{email} and tel = #{tel}")
	String idSearch(IdSearchUserDTO idsearchUserDTO);
	
	@Select("select pw from user_info where id=#{id} and email = #{email} and tel = #{tel}")
	String pwSearch(PwSearchDTO pwsearchUserDTO);
	
	@Select("select pw from user_info where id=#{id}")
	String selectSearchPw(PwPermuteDTO pwPermuteUserDTO);
	
	@Update("update user_info set pw = #{pw1} where id = #{id} and email = #{email} and tel = #{tel}")
	void pwUpdate(PwPermuteDTO pwPermuteUserDTO);
	
	@Select("select pw from user_info where id = #{id}")
	String selectModifyPw(UserModifyDTO userModifyDTO);
	
	@Update("update user_info set pw = #{pw1}, email = #{email},tel = #{tel} ,mAddr = #{mAddr},lAddr = #{lAddr} ,dlAddr = #{dlAddr} where userNum = #{userNum}")
	void infoUpdate(UserInfoModifyDTO userInfoModifyDTO);
	
	@Delete("Delete from user_info where userNum = #{userNum}")
	void infoDelete(int userNum);
	
	@Insert("insert into user_like(gdsNum, userNum) values(#{gdsNum},#{userNum})")
	void addUserLike(UserLikeDTO userLikeDTO);
	
	@Delete("delete from user_like where gdsNum=#{gdsNum} and userNum=#{userNum}")
	void deleteUserLike(UserLikeDTO userLikeDTO);
	
	@Select("SELECT count(*) from user_like where gdsNum=#{num} and userNum=#{userNum}")
	int getUserLikeGds(@Param("num") int num,@Param("userNum") int userNum);
	
	@Select("SELECT count(*) from user_like where userNum=#{userNum}")
	int getUserLikeCount(@Param("userNum") int userNum);
	
	@Select("select gdsNum from user_like where userNum = #{userNum} order by gdsNum")
	List<Integer> getUserLikeGdsList(int userNum);
	
	@Select("select a.gdsNum, b.thumbImg,b.gdsName, b.gdsDetail,c.gdsTag " + 
			"from user_like a,gds_info b , gds_tag c where a.gdsNum=b.gdsNum and b.gdsNum = c.gdsNum and userNum=#{userNum} order by a.gdsNum;")
	List<UserLikeDTO> getUserLikeList(int userNum);
	
	
	@Insert("insert user_auth(userNum,email,authkey,regTime,endTime) values(#{userNum},#{email},#{authKey},#{regTime},#{endTime})")
	void insertAuthKey(UserEmailAuthDTO userEmailAuthDTO);
	
	@Select("select a.authNum,a.userNum,a.email,a.endTime,b.authstatus " + 
			"from (select authNum ,userNum ,email ,endTime from user_auth as a where email=#{email} and authkey=#{authKey}) as a " + 
			"join user_info as b on a.userNum = b.userNum;")
	UserEmailAuthDTO getAuthKey(@Param("email") String email, @Param("authKey") String authKey);
	
	@Update("update user_info set authstatus=1 where userNum=#{userNum}")
	int updateAuthStatus(UserEmailAuthDTO userEmailAuthDTO);
	
	@Delete("delete from user_auth where email=#{email}")
	void deleteAuthKey(String email);
}
