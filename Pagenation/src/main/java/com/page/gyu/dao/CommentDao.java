package com.page.gyu.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.page.gyu.vo.CommentVo;

@Repository
public class CommentDao {

	@Autowired
	private SqlSession sqlSession;
	
	public void insertComment(CommentVo commentVo) {
		int flag = 0;
				
		System.out.println("(dao) comment content : " + commentVo.getContent());
		
		flag = sqlSession.insert("mapper.board.insertComment", commentVo);
		
		System.out.println("(commentDao) insert : " + flag);
	}
	
	public ArrayList<CommentVo> SearchAllComment(){
		ArrayList<CommentVo> list = null;
		
		list = (ArrayList)sqlSession.selectList("mapper.board.SearchAllComment");
		
		if(list!=null) {
			System.out.println("(dao)comment selectAll : " + list.get(0).getWriter());
		}
		
		return list;
	}
}
