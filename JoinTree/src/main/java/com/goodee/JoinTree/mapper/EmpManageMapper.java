package com.goodee.JoinTree.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.JoinTree.vo.*;

@Mapper
public interface EmpManageMapper {

	// 부서 코드 조회
	List<CommonCode> selectDeptCodeList();
	
	// 현재 연도 부서별 사원 수 조회
	int selectDeptEmpCnt(Map<String, Object> currentYearDeptCnt);
	
	// 직급 코드 조회
	List<CommonCode> selectPositionCodeList();
	
	// 사원 상태 코드 조회
	List<CommonCode> selectActiveCodeList();
	
	// 사원정보 등록
	int addEmpInfo(Map<String, Object> empInfo);
	
	// 계정 등록
	int addAccount(AccountList accountList);
	
	// 인사이동 이력 등록
	int addReshuffleHistory(ReshuffleHistory reshuffleHistory);
	
	// 검색별 사원 조회
	List<Map<String, Object>> searchEmpList(Map<String, Object> searchEmpList);

	
}