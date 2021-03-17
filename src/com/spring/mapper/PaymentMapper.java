package com.spring.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.spring.dto.payment.PaymentDTO;
import com.spring.dto.payment.PointDTO;

public interface PaymentMapper {



	@Insert("insert into payment(userNum, ordName, ordNum, ordColor, ordCount, ordPrice, payDate, receiver, email, phone, addr1, addr2, addr3, message, depositor, bankName, payMethod, cal, myPoint, usePoint,useCouponCal , cpNum)" + 
	  		" VALUES(#{userNum}, #{ordName}, DATE_FORMAT(now(), '%Y%m%d%k%i%s'),#{ordColor},#{ordCount},#{ordPrice},now(),#{receiver},#{email},#{phone},#{addr1},#{addr2},#{addr3},#{message, jdbcType=VARCHAR},#{depositor}, #{bankName},#{payMethod},#{cal},#{myPoint}, #{usePoint},#{useCouponCal}, #{cpNum})")
	void insertPayment(PaymentDTO paymentDTO);
	
	@Select("SELECT userNum, SUM(myPoint-usePoint) as totalPoint FROM payment where userNum=${userNum} GROUP BY userNum")
	PointDTO totalPoint(int payNum);
	
	
	
	@Select("select * from payment where payNum=#{payNum}")
	PaymentDTO paymentSelect(int payNum);
	
	@Select("select *  from payment where userNum = #{userNum} order by paynum desc")
	List<PaymentDTO> pointView(int userNum);
	
	
	@Select("SELECT A.payNum, A.userNum, A.ordName, A.ordNum, A.ordColor, A.ordCount, A.ordPrice, A.payDate, A.receiver, A.email, A.phone, A.depositor, A.addr1, A.addr2, A.addr3, A.message, A.bankName, A.payMethod, A.cal, A.myPoint, A.usePoint, A.useCouponCal, B.name, B.id, B.tel FROM  payment A, user_info B WHERE A.userNum = B.userNum and A.userNum = #{userNum} order by paynum desc")
	List<PaymentDTO> myPage(int userNum);
	
	@Select("SELECT @rownum:=@rownum+1 as rownum , A.payNum, A.userNum, A.ordName, A.ordNum, A.ordColor, A.ordCount, A.ordPrice, A.payDate, A.receiver, " + 
			"A.email, A.phone, A.depositor, A.addr1, A.addr2, A.addr3, A.message, A.bankName, A.payMethod, A.cal, " + 
			"A.myPoint, A.usePoint, A.useCouponCal, B.name,  B.id, B.tel FROM payment A " + 
			"left join user_info B on A.userNum = B.userNum " + 
			"where A.userNum = #{userNum} and (@rownum:=0)=0 order by paynum desc limit 1")
	PaymentDTO paymentResult(int userNum);


	
	
}
