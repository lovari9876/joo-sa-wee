package com.soninlawisdice.security;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soninlawisdice.vo.MemberVO;

@Repository("userAuthDAO")
public class UserAuthDAO {

	@Autowired
    private SqlSessionTemplate sqlSession;
 
    public MemberVO getUserById(String username) {
        return sqlSession.selectOne("user.selectUserById", username);
    }

}
