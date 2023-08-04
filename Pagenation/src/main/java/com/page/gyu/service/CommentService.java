package com.page.gyu.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.page.gyu.dao.CommentDao;
import com.page.gyu.vo.CommentVo;

@Service
public class CommentService {

	@Autowired
	private CommentDao commentDao;
	
	public void insertComment(CommentVo commentVo) {
		
		commentDao.insertComment(commentVo);
		
	}

	public ArrayList<CommentVo> SearchAllComment(){
		ArrayList<CommentVo> list = null;
		
		list = commentDao.SearchAllComment();
		
		return list;
	}
}
