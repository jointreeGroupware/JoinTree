package com.goodee.JoinTree.restapi;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.goodee.JoinTree.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class BoardRestController {
	
	@Autowired
	private BoardService boardService;
	
	// 게시판 목록 조회
	@GetMapping("/board/getBoardList")
	public Map<String, Object> getBoardList(@RequestParam Map<String, Object> boardListMap){
		
		Map<String, Object> getBoardListResult = boardService.getBoardList(boardListMap);
		log.debug(getBoardListResult + "<-- BoardRestController getBoardListResult");
		
		return getBoardListResult;
	}
	
	// 게시판 상단고정 목록 조회
	@GetMapping("/board/getBoardPinnedList")
	public List<Map<String, Object>> getBoardPinnedList(@RequestParam String boardCategory){
		
		List<Map<String,Object>> getBoardPinnedList = boardService.getBoardPinnedList(boardCategory);
		log.debug(getBoardPinnedList + "<-- BoardRestController getBoardPinnedList");
		
		return getBoardPinnedList;
	}
}
