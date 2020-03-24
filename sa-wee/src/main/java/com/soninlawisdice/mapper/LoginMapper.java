package com.soninlawisdice.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.soninlawisdice.vo.MemberVO;

public interface LoginMapper {


  	public MemberVO login(@Param("m_id")String m_id, @Param("m_pw")String m_pw);

}
