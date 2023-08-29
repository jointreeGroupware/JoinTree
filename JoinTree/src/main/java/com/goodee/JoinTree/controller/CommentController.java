package com.goodee.JoinTree.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodee.JoinTree.service.CommentService;
import com.goodee.JoinTree.service.CommunityService;
import com.goodee.JoinTree.vo.Comment;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CommentController {
	static final String CYAN = "\u001B[46m";
	static final String RESET = "\u001B[0m";
	
	String msg = "";
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private CommunityService communityService;
	
	// 댓글 작성 액션
	@PostMapping("/comment/addComment")
	@ResponseBody
	public String addComment(@RequestParam("boardNo") int boardNo, @RequestParam("empNo") int empNo, 
			@RequestParam("category") String category, @RequestParam("commentGroupNo") int commentGroupNo, 
			@RequestParam("commentContent") String commentContent) throws UnsupportedEncodingException {
		Comment comment = new Comment();
		comment.setBoardNo(boardNo);
		comment.setEmpNo(empNo);
		comment.setCategory(category);
		comment.setCommentGroupNo(commentGroupNo);
		comment.setCommentContent(commentContent);
		
		int row = commentService.addComment(comment);
		log.debug(CYAN + row + "<-- row(CommentController-addComment)" + RESET);
		
		if (row == 1) { // 작성 완료 시
			return "success";
		} else {
			return "error";
		}
	}
	
	/*
	// 댓글 작성 액션
	@PostMapping("/comment/addComment")
	public String addComment(@RequestParam("boardNo") int boardNo, @RequestParam("empNo") int empNo, 
			@RequestParam("category") String category, @RequestParam("commentGroupNo") int commentGroupNo, 
			@RequestParam("commentContent") String commentContent) throws UnsupportedEncodingException {
		Comment comment = new Comment();
		comment.setBoardNo(boardNo);
		comment.setEmpNo(empNo);
		comment.setCategory(category);
		comment.setCommentGroupNo(commentGroupNo);
		comment.setCommentContent(commentContent);
		
		int row = commentService.addComment(comment);
		log.debug(CYAN + row + "<-- row(CommentController-addComment)" + RESET);
		
		if (row == 1) {
			msg = URLEncoder.encode("댓글이 등록되었습니다.", "UTF-8");
			
			// 댓글 작성 성공 시 리다이렉트할 URL 생성
			String redirectUrl = "/community/";
			
			if (category.equals("B0103")) {
				redirectUrl += "freeCommList/freeCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0104")) {
				redirectUrl += "anonymousCommList/anonymousCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0105")) {
				redirectUrl += "secondhandCommList/secondhandCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0106")) {
				redirectUrl += "lifeEventCommList/lifeEventCommOne?boardNo=" + boardNo;
			}
			
			 return "redirect:" + redirectUrl + "&msg=" + msg;
		} else {
			msg = URLEncoder.encode("댓글 등록에 실패했습니다. 관리자에게 문의해주세요.", "UTF-8");
			
			// 댓글 작성 성공 시 리다이렉트할 URL 생성
			String redirectUrl = "/community/";
			
			if (category.equals("B0103")) {
				redirectUrl += "freeCommList/freeCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0104")) {
				redirectUrl += "anonymousCommList/anonymousCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0105")) {
				redirectUrl += "secondhandCommList/secondhandCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0106")) {
				redirectUrl += "lifeEventCommList/lifeEventCommOne?boardNo=" + boardNo;
			}
			
			 return "redirect:" + redirectUrl + "&msg=" + msg;
			
		}		
		
	}
	*/

	// 답글(대댓글) 작성 액션
	@PostMapping("/comment/addReply")
	public String addReply(@RequestParam("boardNo") int boardNo, @RequestParam("empNo") int empNo, 
			@RequestParam("category") String category, @RequestParam("commentGroupNo") int commentGroupNo, 
			@RequestParam("commentContent") String commentContent, @RequestParam("parentCommentNo") int parentCommentNo) throws UnsupportedEncodingException {

		Comment comment = new Comment();
		comment.setBoardNo(boardNo);
		comment.setEmpNo(empNo);
		// comment.setCategory(category);
		comment.setCommentGroupNo(commentGroupNo);
		comment.setCommentContent(commentContent);
		comment.setParentCommentNo(parentCommentNo); // 부모(원 댓글)의 commentNo
		int row = commentService.addReply(comment);
		log.debug(CYAN + row + " <-- row(CommentController-addReply)" + RESET);
		
		if (row == 1) {
			msg = URLEncoder.encode("답글이 등록되었습니다.", "UTF-8");
			
			// 답글 작성 성공 시 리다이렉트할 URL 생성
			String redirectUrl = "/community/";
			
			if (category.equals("B0103")) {
				redirectUrl += "freeCommList/freeCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0104")) {
				redirectUrl += "anonymousCommList/anonymousCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0105")) {
				redirectUrl += "secondhandCommList/secondhandCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0106")) {
				redirectUrl += "lifeEventCommList/lifeEventCommOne?boardNo=" + boardNo;
			}
			
			 return "redirect:" + redirectUrl + "&msg=" + msg;
		} else {
			msg = URLEncoder.encode("답글 등록에 실패했습니다. 관리자에게 문의해주세요.", "UTF-8");
			
			// 답글 작성 성공 시 리다이렉트할 URL 생성
			String redirectUrl = "/community/";
			
			if (category.equals("B0103")) {
				redirectUrl += "freeCommList/freeCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0104")) {
				redirectUrl += "anonymousCommList/anonymousCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0105")) {
				redirectUrl += "secondhandCommList/secondhandCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0106")) {
				redirectUrl += "lifeEventCommList/lifeEventCommOne?boardNo=" + boardNo;
			}
			
			 return "redirect:" + redirectUrl + "&msg=" + msg;
		}		
	}
	
	// 댓글 삭제 액션
	@PostMapping("/comment/removeComment")
	@ResponseBody
	public String removeComment(@RequestParam("commentNo") int commentNo) {
		int row = commentService.removeCommentReply(commentNo);
		log.debug(CYAN + row + " <-- row(CommentController-removeComment)" + RESET);
		
		if (row == 1) { // 삭제 완료 시
			return "success";
		} else {
			return "error";
		}
	}
	
	@GetMapping("/comment/getComments")
	@ResponseBody
	public List<Comment> getComments(@RequestParam(name = "boardNo") int boardNo) {
	    // 댓글 목록 가져오기
	    List<Comment> comments = commentService.getCommentsByBoardNo(boardNo);
	    
	    // 댓글 작성자 empNo -> empName 변환
	    for (Comment comment : comments) {
	        int empNo = comment.getEmpNo();
	        String empName = commentService.getEmpName(empNo);
	        comment.setEmpName(empName);
	    }
	    
	    return comments;
	}
	
	/*
	// 댓글 삭제 액션
	@GetMapping("/comment/removeComment")
	public String removeComment(@RequestParam("commentNo") int commentNo, @RequestParam("boardNo") int boardNo) throws UnsupportedEncodingException {
		String category = communityService.getBoardCategory(boardNo);
		
		// 댓글 삭제 성공 시 리다이렉트할 URL 생성
		String redirectUrl = "/community/";
		
		int row = commentService.removeCommentReply(commentNo);
		log.debug(CYAN + row + "<-- row(CommentController-removeComment)" + RESET);
		
		if (row == 1) {
			msg = URLEncoder.encode("삭제되었습니다.", "UTF-8");
			
			if (category.equals("B0103")) {
				redirectUrl += "freeCommList/freeCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0104")) {
				redirectUrl += "anonymousCommList/anonymousCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0105")) {
				redirectUrl += "secondhandCommList/secondhandCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0106")) {
				redirectUrl += "lifeEventCommList/lifeEventCommOne?boardNo=" + boardNo;
			}
			
			 return "redirect:" + redirectUrl + "&msg=" + msg;
		} else {
			msg = URLEncoder.encode("삭제에 실패했습니다. 관리자에게 문의해주세요.", "UTF-8");
			
			if (category.equals("B0103")) {
				redirectUrl += "freeCommList/freeCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0104")) {
				redirectUrl += "anonymousCommList/anonymousCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0105")) {
				redirectUrl += "secondhandCommList/secondhandCommOne?boardNo=" + boardNo;
			} else if (category.equals("B0106")) {
				redirectUrl += "lifeEventCommList/lifeEventCommOne?boardNo=" + boardNo;
			}
			
			
			return "redirect:" + redirectUrl + "&msg=" + msg;
		}
	}
	*/
}
