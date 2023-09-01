package com.goodee.JoinTree.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.JoinTree.vo.Project;
import com.goodee.JoinTree.vo.ProjectMember;
import com.goodee.JoinTree.vo.ProjectTask;
import com.goodee.JoinTree.vo.TaskFile;

@Mapper
public interface ProjectMapper {
	
	/* 프로젝트 */
	// 프로젝트 검색 별 행 카운트
	int projectCountRows(String searchName, String startDate, String endDate);
	
	// 프로젝트 전체 리스트 출력
	List<Project> selectProejectList(int startRow, int rowPerPage, String searchName, String startDate, String endDate);
	
	// 프로젝트 개인별 참여 중 프로젝트 출력 -> 자신의 사번이 있고 프로젝트 상태가 진행중인거(A0502)
	List<Project> selectProjectListByPersonal(int empNo, int startRow, int rowPerPage, String searchName, String startDate, String endDate);
	
	// 프로젝트 종료된 프로젝트 출력 -> 프로젝트 상태가 완료(A0503)
	List<Project> selectEndProjectList(int startRow, int rowPerPage, String searchName, String startDate, String endDate);
	
	// 홈에서 참여중인 프로젝트 출력 -> 참여중인 프로젝트5개만
	List<Project> selectProjectListByHome(int empNo);
	
	// 프로젝트 상세보기
	Project selectProjectOne(Project project);
	
	// 프로젝트 추가
	int addProject(Project project);
	
	// 프로젝트 수정 
	int modifyProject(Project project);
	
	// 프로젝트 완료 처리
	int endProject(int projectNo);
	
	// 프로젝트 삭제
	int removeProject(int projectNo);
	/* 프로젝트 끝 */
	
	/* 프로젝트 하위작업 */
	// 프로젝트 작업 수 계산
	List<ProjectTask> projectProgress(int projectNo);
	
	// 프로젝트 하위작업 리스트 출력 
	List<ProjectTask> selectProejectTaskList(int projectNo);
	
	// 프로젝트 하위작업 추가 
	int addProjectTask(ProjectTask projectTask);
	
	// 프로젝트 하위작업 파일 업로드
	int addTaskFileUpload(TaskFile taskFile);
	
	// 프로젝트 완료 처리
	int endProjectTask(int taskNo);
	
	// 프로젝트 하위작업 삭제
	int removeProjectTask(int taskNo, int projectNo);
	/* 프로젝트 하위작업 끝 */
	
	/* 프로젝트 멤버 */
	// 프로젝트 멤버 카운트 출력 
	int selectProejectMemberCnt(int projectNo);
	
	// 프로젝트 멤버 리스트
	List<ProjectMember> selectProejectMember(int projectNo);
	
	// 프로젝트 멤버 중복검사
	int checkDuplicateProjectMember(int empNo, int projectNo);
	
	// 프로젝트 멤버 추가
	int addProjectMemeber(ProjectMember projectMember);
	
	// 프로젝트 멤버 삭제
	int removeProjectMemeber(int empNo, int projectNo);
	/* 프로젝트 멤버 끝*/
}
