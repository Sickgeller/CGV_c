<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택</title>
<style>
body {
  background-color: #1c1c1c;
  color: white;
  font-family: 'Noto Sans KR', sans-serif;
  padding: 40px;
}
.container {
  max-width: 700px;
  margin: 0 auto;
}
.screen {
  background-color: #fff;
  height: 40px;
  margin: 20px auto;
  width: 100%;
  transform: rotateX(-45deg);
  box-shadow: 0 4px 10px rgba(255,255,255,0.5);
  border-radius: 8px;
}
.row {
  display: flex;
  justify-content: center;
  margin-bottom: 10px;
}
.seat {
  width: 32px;
  height: 32px;
  background-color: #aaa;
  margin: 5px;
  border-radius: 6px;
  text-align: center;
  line-height: 32px;
  cursor: pointer;
  font-size: 14px;
}
.seat.selected {
  background-color: #e50914;
  color: #fff;
}
button {
  background-color: #e50914;
  border: none;
  padding: 12px 24px;
  font-size: 16px;
  color: white;
  border-radius: 6px;
  cursor: pointer;
  margin-top: 20px;
  width: 100%;
  transition: 0.3s;
}
button:hover {
  background-color: #c20710;
}
</style>
</head>
<body>
<div class="container">
  <h2 style="text-align:center;">🎟 좌석 선택</h2>
   <p>영화 ID: ${movieID}</p>
  <p>극장 ID: ${theaterID}</p>
  <p>스케줄 ID: ${scheduleID}</p>
  <div class="screen"></div>
  <form action="reserve.do" method="post">
  
    <input type="hidden" id="selectedSeats" name="selectedSeats" />
    <c:set var="prevRow" value="" />
    <c:forEach var="seat" items="${seatList}">
      <c:if test="${seat.seatRow ne prevRow}">
        <c:if test="${not empty prevRow}"></div></c:if>
        <div class="row">
        <c:set var="prevRow" value="${seat.seatRow}" />
      </c:if>
      <div class="seat" data-seat="${seat.seatName}">${seat.seatName}</div>
    </c:forEach>
    </div>
    <button type="submit">예약하기</button>
  </form>
</div>

<script>
document.querySelectorAll('.seat').forEach(seat => {
  seat.addEventListener('click', () => {
    seat.classList.toggle('selected');
    updateSeats();
  });
});
function updateSeats() {
  const selected = document.querySelectorAll('.seat.selected');
  const seatNames = Array.from(selected).map(seat => seat.dataset.seat);
  document.getElementById('selectedSeats').value = seatNames.join(',');
}

function reservation(){
    
	const f = document.movie;
	  const selectedSeatsValue = document.getElementById('selectedSeats').value;
	  const seats = selectedSeatsValue ? selectedSeatsValue.split(',') : [];

	  if (seats.length === 0) {
	    alert("좌석은 1개 이상 선택해야 합니다.");
	    return;
	  }
	  if (seats.length > 4) {
	    alert("좌석은 최대 4개까지만 선택 가능합니다.");
	    return;
	  }

	  f.submit();
}
</script>
</body>
</html>
