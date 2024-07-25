document.addEventListener('DOMContentLoaded', function() {
	// point 형변환
	// .point 요소를 가져옵니다.
	var pointElement = document.querySelector('#myInfo .float .point');
	    
	// 데이터에서 포인트 값을 가져옵니다.
	var pointValue = pointElement.textContent.trim();
	   
	// 숫자와 문자열 분리
	var numericValue = parseInt(pointValue.replace(/,/g, ''), 10);
   
	// 포맷팅 함수
   function formatNumber(value) {
       if (value >= 1e12) { // 1 조 이상
           return (value / 1e12).toFixed(2) + 'T'; // Trillion
       } else if (value >= 1e9) { // 10억 이상
           return (value / 1e9).toFixed(2) + 'B'; // Billion
       } else if (value >= 1e6) { // 100만 이상
           return (value / 1e6).toFixed(2) + 'M'; // Million
       } else if (value >= 1e3) { // 1000 이상
           return (value / 1e3).toFixed(2) + 'K'; // Thousand
       } else {
           return value.toString(); // 1000 미만
       }
   }
   
   // 포맷팅된 포인트 값을 설정
   var formattedPointValue = formatNumber(numericValue) + ' pt';
   pointElement.textContent = formattedPointValue;
	
	
   	//grade 이미지 변환
	// .grade 요소를 가져옵니다.
	var gradeElement = document.querySelector('#myInfo > .float > .grade');
	
	// data-grade 속성에서 grade_id 값을 가져옵니다.
	var gradeId = gradeElement.getAttribute('data-grade');
	
	// grade_id 값에 따라 background-position을 설정합니다.
	switch (gradeId) {
	    case '1':
	        gradeElement.style.backgroundPosition = '5px 0px';
	        break;
	    case '2':
	        gradeElement.style.backgroundPosition = '-36px 0px';
	        break;
	    case '3':
	        gradeElement.style.backgroundPosition = '-76px 0px';
	        break;
	    case '4':
	        gradeElement.style.backgroundPosition = '-117px 0px';
	        break;
	    case '5':
	        gradeElement.style.backgroundPosition = '-157px 0px';
	        break;
	    case '6':
	        gradeElement.style.backgroundPosition = '2px -40px';
	        break;
	    case '7':
	        gradeElement.style.backgroundPosition = '-38px -40px';
	        break;
	    case '8':
	        gradeElement.style.backgroundPosition = '-78px -40px';
	        break;
	    case '9':
	        gradeElement.style.backgroundPosition = '-118px -40px';
	        break;
	    case '10':
	        gradeElement.style.backgroundPosition = '-157px -40px';
	        break;
	    case '11':
	        gradeElement.style.backgroundPosition = '-157px -40px';
	        break;
	    default:
	        gradeElement.style.backgroundPosition = '5px 0px'; // 기본값 설정
	        break;
    }
});
