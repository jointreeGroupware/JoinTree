<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.36/moment-timezone-with-data.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
html, body {
  margin: 0;
  padding: 0;
  font-family: 'Pretendard-Regular';
}
.fc-event {
    background-color: #AEC3AE;
    border: none;
}
#calendar {
  max-width: 1200px;
  margin: 40px auto;
  font-family: 'Pretendard-Regular';
}
.fc .fc-button-primary {
	border: none;
	background-color: #C8E4B2;
}

.fc .fc-timegrid-slot {
    height: 2em;
}
.fc .fc-toolbar-title {
  font-family: 'Pretendard-Regular';
}

</style>
<title>예약 현황 창(캘린더) + 예약하기</title>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/view/inc/header.jsp"/>

<div class="container-fluid page-body-wrapper">
	<jsp:include page="/WEB-INF/view/inc/sideContent.jsp"/> <!-- 사이드바 -->
		<div class="content-wrapper">
		 <!-- 컨텐츠부분 wrapper -->
		 
			<div style="font-weight: bold; font-family: 'Pretendard-Regular';">
			<span class="badge badge-success">notice</span> 예약 신청을 하시려면 빈 시간대를 클릭해주세요(정각 이전 예약)</div>
			<div><a href="/JoinTree/reservation/empMeetRoomList">회의실 목록</a></div>
			<!-- fullCal -->
			<div id='calendar'></div>
			<!------------->
			<!-- modal 추가 -->
			    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="reservationModalLabel" aria-hidden="true">
			        <div class="modal-dialog" role="document">
			            <div class="modal-content">
			                <div class="modal-header">
			                    <h4 class="modal-title" id="exampleModalLabel">회의실 예약하기</h4>
			                </div>
			                <div class="modal-body">
			                    <div class="form-group">
			                    	<!-- 회의실 이름 끌고오기 , roomNo를 할당해줍니다 -->
			                    	<input type="hidden" id="equipNo" name="equipNo" value="${roomNo}">
			                        <label for="taskId" class="col-form-label">회의실 이름</label>
			                        <input type="text" class="form-control" id="roomName" name="roomName" readonly="readonly">
			                        <!-- 날짜와 시간을 따로 두었기 때문에 합쳐서 DB에 들어가는 작업이 필요함 -->
			 						<label for="selectedDate" class="col-form-label">선택 날짜</label>
			        				<input type="text" class="form-control" id="selectedDate" name="selectedDate" readonly="readonly">
						            <label for="revStartTime" class="col-form-label">시작 시간</label>
			                        <select class="form-control" id="revStartTime" name="revStartTime">
										<option value="09:00">09:00</option>
										<option value="09:30">09:30</option>
										<option value="10:00">10:00</option>
										<option value="10:30">10:30</option>
										<option value="11:00">11:00</option>
										<option value="11:30">11:30</option>
										<option value="12:00">12:00</option>
										<option value="12:30">12:30</option>
										<option value="13:00">13:00</option>
										<option value="13:30">13:30</option>
										<option value="14:00">14:00</option>
										<option value="14:30">14:30</option>
										<option value="15:00">15:00</option>
										<option value="15:30">15:30</option>
										<option value="16:00">16:00</option>
										<option value="16:30">16:30</option>
										<option value="17:00">17:00</option>
										<option value="17:30">17:30</option>
							        </select>
			                        <label for="revEndTime" class="col-form-label">종료 시간</label>
			                        <select class="form-control" id="revEndTime" name="revEndTime">
										<option value="09:30">09:30</option>
										<option value="10:00">10:00</option>
										<option value="10:30">10:30</option>
										<option value="11:00">11:00</option>
										<option value="11:30">11:30</option>
										<option value="12:00">12:00</option>
										<option value="12:30">12:30</option>
										<option value="13:00">13:00</option>
										<option value="13:30">13:30</option>
										<option value="14:00">14:00</option>
										<option value="14:30">14:30</option>
										<option value="15:00">15:00</option>
										<option value="15:30">15:30</option>
										<option value="16:00">16:00</option>
										<option value="16:30">16:30</option>
										<option value="17:00">17:00</option>
										<option value="17:30">17:30</option>
										<option value="18:00">18:00</option>
							        </select>
			                        <label for="taskId" class="col-form-label">내용</label>
			                        <input type="text" class="form-control" id="revReason" name="revReason" placeholder="예약 내용을 적어주세요 :) 캘린더에 함께 표시됩니다.">
			                    	<div class="check" id="rn_check"></div>
			                    </div>
			                </div>
			                <div class="modal-footer">
			                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
			                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			                </div>
			            </div>
			        </div>
   				</div>
   				
<!-- 컨텐츠전체 끝 -->			
    		</div>
		</div>
<!-- footer -->
<jsp:include page="/WEB-INF/view/inc/footer.jsp"/>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var urlParams = new URLSearchParams(window.location.search);
    var roomNo = urlParams.get('roomNo'); // URL 매개변수에서 roomNo 호출
    var roomName = urlParams.get('roomName'); // URL 매개변수에서 roomName 호출

    var calendar = new FullCalendar.Calendar(calendarEl, {
    	
    	timeZone: 'Asia/Seoul',
    	locale: 'ko',
        initialView : 'timeGridWeek',
        headerToolbar : {
            start : 'prev next today',
            center : 'title',
            right: 'timeGridWeek'
        },
        titleFormat: function(date) {
            var formattedDate = date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
            return formattedDate + ' - ' + roomName + ' 예약현황';
        },
        selectOverlap: false, // 중복 불가
        selectable : true,
        droppable : true,
        editable : false,
        nowIndicator: false,
        allDaySlot: false,
        slotLabelFormat: '',
        height: 'auto',
        slotDuration: '00:30:00',
        slotMinTime: '09:00:00', // 오전 9시부터 슬롯 시작
        slotMaxTime: '18:00:00', // 오후 6시까지 슬롯 끝
        slotLabelInterval: { hours: 1 },
        slotLabelFormat: {
            hour: 'numeric',
            hour12: true
        },
        events: function(info, successCallback, failureCallback) {
            $.ajax({
                url: '/JoinTree/meetRoomReserv?roomNo=' + roomNo,
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    var events = [];
                    for (var i = 0; i < response.length; i++) {
                        events.push({
                            /* title: response[i].title, 예약 시간만 표시*/
                            start: response[i].start,
                            end: response[i].end
                        });
                    }
                    successCallback(events);
                },
                error: function() {
                    failureCallback('캘린더 값 오류');
                }
            });
        },
        
        select: function(info) {
        	
        	// 중복검사
            var selectedEnd = moment(info.endStr);
        	var now = moment(); // 현재 날짜와 시간
       	    var selectedStart = moment.tz(info.startStr, 'Asia/Seoul'); // 문자열 아니면 시간 불일치 오류
        	/* console.log("selectedDateTime",selectedDateTime); 사용자가 선택한 시간
        	console.log("now",now);
        	console.log("selectedStart",selectedStart); 선택 시작시간
        	console.log("selectedEnd",selectedEnd); 선택 종료 */
       	     
       		// --------------------------------------------------------------------------------------------
       		// 캘린더 자체에서 클릭할 때 액션
       	    // 선택한 날짜와 시간 둘 다 이전인 경우
       	    if (selectedStart.isBefore(now)) {
       	        alert("지난 날짜와 시간에는 예약할 수 없습니다.");
       	        return;
       	    }

       	    // 날짜는 같지만 시간이 현재시간 기준으로 이전인 경우
       	    if (selectedStart.isSame(now, 'day') && selectedStart.isBefore(now, 'hour')) {
       	        alert("지난 시간에는 예약할 수 없습니다.");
       	        return;
       	    }
	    	// --------------------------------------------------------------------------------------------
            
            $('#calendarModal').modal('show');

			var selectedDate = info.startStr.split("T")[0]; // 사용자가 선택한 날짜
			var selectedStartTime = moment.tz(info.startStr, 'Asia/Seoul').format('HH:mm'); // 선택 시작시간
			var selectedEndTime = moment.tz(info.endStr, 'Asia/Seoul').format('HH:mm'); // 선택 종료시간

			$('#selectedDate').val(selectedDate);
			$('#revStartTime').val(selectedStartTime);
			$('#revEndTime').val(selectedEndTime);
			$('#roomName').val(roomName); // 모달창에 자동으로 들어가는 정보
			
			var eventsByDate = {}; // 날짜별 저장 객체 생성
		    calendar.getEvents().forEach(function(event) {
		        var eventDate = moment.tz(event.startStr, 'Asia/Seoul').format('YYYY-MM-DD');
		        if (!eventsByDate[eventDate]) {
		            eventsByDate[eventDate] = [];
		        }
		        eventsByDate[eventDate].push(event);
		    });

		    if (eventsByDate[selectedDate]) {
		        eventsByDate[selectedDate].forEach(function(event) {
		            var eventStart = moment.tz(event.startStr, 'Asia/Seoul').format('HH:mm');
		            var eventEnd = moment.tz(event.endStr, 'Asia/Seoul').format('HH:mm');
		            
		            $('#revStartTime option[value="' + eventStart + '"]').prop('disabled', true).css('color', '#EAEAEA');
		            $('#revEndTime option[value="' + eventEnd + '"]').prop('disabled', true).css('color', '#EAEAEA');
		        });
		    }
		
			var now = moment.tz('Asia/Seoul');
			var selectedStartDate = moment.tz(selectedDate + ' ' + selectedStartTime, 'Asia/Seoul'); // 날짜 + 시작시간
			console.log(selectedStartDate);
			var selectedEndDate = moment.tz(selectedDate + ' ' + selectedEndTime, 'Asia/Seoul'); // 날짜 + 종료시간
			var reservRange = now.isBetween(selectedStartDate, selectedEndDate); // 예약 시간 범위
			// select option 비활성화/활성화
			$('#revStartTime option').each(function() {
			    var optionValue = $(this).val();

			    if ((now.isBefore(selectedStartDate) || reservRange) && now.isBefore(moment(selectedDate + ' ' + optionValue, 'YYYY-MM-DD HH:mm'))) {
			        // 오늘 날짜가 아닐때
			        var isReserved = false;
			        if (eventsByDate[selectedDate]) {
			            eventsByDate[selectedDate].forEach(function(event) {
			                var eventStart = moment.tz(event.startStr, 'Asia/Seoul').format('HH:mm');
			                var eventEnd = moment.tz(event.endStr, 'Asia/Seoul').format('HH:mm');
		                if (eventStart <= optionValue && optionValue < eventEnd) { // 시작 ~ 종료 시간 사이에 예약 데이터 있으면
			                    isReserved = true;
			                    return false; // 예약된 시간 찾으면 빠져나감
			                }
			            });
			        }

			        if (isReserved) {
			            $(this).prop('disabled', true).css('color', '#EAEAEA');
			        } else {
			            $(this).prop('disabled', false).css('color', '');
			        }
			    } else {
			        // 현재 시간이나 or 지난 시간
			        $(this).prop('disabled', true).css('color', '#EAEAEA');
			    }
			});

			$('#revEndTime option').each(function() {
			    var optionValue = $(this).val();

			    if ((now.isBefore(selectedStartDate) || reservRange) && now.isBefore(moment(selectedDate + ' ' + optionValue, 'YYYY-MM-DD HH:mm'))) {
			        var isReserved = false;
			        if (eventsByDate[selectedDate]) {
			            eventsByDate[selectedDate].forEach(function(event) {
			                var eventStart = moment.tz(event.startStr, 'Asia/Seoul').format('HH:mm');
			                var eventEnd = moment.tz(event.endStr, 'Asia/Seoul').format('HH:mm');
			                if (eventStart < optionValue && optionValue <= eventEnd) { 
			                    isReserved = true;
			                    return false;
			                }
			            });
			        }

			        if (isReserved) {
			            $(this).prop('disabled', true).css('color', '#EAEAEA');
			        } else {
			            $(this).prop('disabled', false).css('color', '');
			        }
			    } else {
			        $(this).prop('disabled', true).css('color', '#EAEAEA');
			    }
			});
        } //select end    
});
    
    // 추가 버튼 클릭 이벤트 처리 -----> 모달창에선 지난 시간들 예약 처리되는 오류 수정해야함
    $('#addCalendar').click(function() {
        var revReason = $('#revReason').val().trim();

        if (revReason === "") {
            $("#rn_check").text("공백은 입력할 수 없습니다.");
            $("#rn_check").css("color", "red");
            $("#revReason").focus();
            return;
        }
        
        // 예약 중복 검사
        var selectedStart = moment.tz(
        $('#selectedDate').val() + ' ' + $('#revStartTime').val(), 
        'Asia/Seoul'
	    );
	    var selectedEnd = moment.tz(
	        $('#selectedDate').val() + ' ' + $('#revEndTime').val(), 
	        'Asia/Seoul'
	    );
        console.log("추가 선택 시작 시간:",selectedStart);
        console.log("추가 선택 종료 시간:",selectedEnd);
        
        // 예약 시작시간이 종료 시간보다 느릴 경우 메시지 표시
        if (selectedStart.isSameOrAfter(selectedEnd)) {
            $("#rn_check").text("예약 시작시간이 종료 시간보다 늦거나 같을 수 없습니다.");
            $("#rn_check").css("color", "red");
            return;
        }
        
        var overlappingEvent = calendar.getEvents().find(function(event) {
            var eventStart = moment.tz(event.startStr, 'Asia/Seoul');
            var eventEnd = moment.tz(event.endStr, 'Asia/Seoul');
            console.log("예약중복검사 이미 존재하는 시작 시간:",eventStart);
            console.log("예약중복검사 이미 존재하는 종료 시간:",eventEnd);
            
            return (
                (selectedStart.isSameOrAfter(eventStart) && selectedStart.isBefore(eventEnd)) ||
                (selectedEnd.isAfter(eventStart) && selectedEnd.isSameOrBefore(eventEnd)) ||
                (selectedStart.isSameOrBefore(eventStart) && selectedEnd.isSameOrAfter(eventEnd))
            );
        });

        if (overlappingEvent) {
            alert("이미 예약된 시간이 포함되어 있습니다.");
            return;
        }
        
        var reservationInfo = {
            equipNo: roomNo,
            revStartTime: $('#selectedDate').val() + ' ' + $('#revStartTime').val(),
            revEndTime: $('#selectedDate').val() + ' ' + $('#revEndTime').val(),
            revReason: revReason // 변경된 예약 사유 사용
        };

        $.ajax({
            url: '/JoinTree/addReservation',
            type: 'POST',
            dataType: 'json',
            data: JSON.stringify(reservationInfo),
            contentType: 'application/json',
            success: function(response) {
                calendar.addEvent(reservationInfo);
                alert("예약이 성공적으로 완료되었습니다");
                $('#calendarModal').modal('hide'); 
                calreload(); // 목록 동적 생성
            },
            error: function() {
                //console.log('Reservation Info:', reservationInfo);
                console.error('예약 추가 실패');
            }
        });
    });

// 모달창이 닫힐때 초기화 하는 옵션
$('#calendarModal').on('hidden.bs.modal', function () {
    $("#rn_check").text("");
    $("#revReason").val("");
    $('#revStartTime option, #revEndTime option').prop('disabled', false).css('color', '');
});

    function calreload() {
        calendar.refetchEvents(); // 풀캘린더 reload 함수
    }
    calendar.render();
});
</script>
</body>
</html>