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


	let nick = document.querySelector('#myInfo > .float > .name');
	let randomModal = document.querySelector('.right > #random-modal');
	let resultModal = document.querySelector('.right > #random-result-modal');

	let canvas = document.querySelector('.modal .modal_popup #menu canvas');
	let ctx = canvas.getContext('2d');
	let points = ["50", "100", "50", "100", "150", "200", "500", "1000"];
	let colors = [];
	let randomBtn = document.getElementById('random-btn');
	let modalCloseBtn = document.getElementById('modal-close-btn');
	let resultNum = 0;
	let isAttendance = false;


	fetch('checkIsAttendance.user', {
		method: 'POST',
		contentType: 'application/json',
		body: JSON.stringify({nick: nick.value})
	}).then(response => { return response.json(); })
		.then(data => {
			if (data.msg === 'ok') isAttendance = true;
		})

	if (isAttendance) {
		randomModal.classList.add('on');

		console.log(Date.now());

		let obj = {
			value: nick.innerHTML,
			expire: Date.now()
		};
		localStorage.setItem('nick', JSON.stringify(obj));

		newMake();
	}

	function newMake() {
		let [cw, ch] = [canvas.width/2, canvas.height/2];
		let arc = Math.PI / (points.length / 2);

		for (let i = 0; i < points.length; i++) {
			ctx.beginPath();
			if(colors.length === 0){
				for(var l=0; l<points.length; l++){
					let r = Math.floor(Math.random() * 256);
					let g = Math.floor(Math.random() * 256);
					let b = Math.floor(Math.random() * 256);
					colors.push("rgb(" + r + "," + g + "," + b + ")");
				}
			}
			ctx.fillStyle = colors[i % (colors.length)];
			ctx.moveTo(cw, ch);
			ctx.arc(cw, ch, cw, arc * (i - 1), arc * i);
			ctx.fill();
			ctx.closePath();
		}

		ctx.fillStyle = "#fff";
		ctx.font = "18px Pretendard";
		ctx.textAlign = "center";

		for (let i = 0; i < points.length; i++) {
			const angle = (arc * i) + (arc / 2);

			ctx.save();

			ctx.translate(
				cw + Math.cos(angle) * (cw - 50),
				ch + Math.sin(angle) * (ch - 50)
			);

			ctx.rotate(angle + Math.PI / 2);

			points[i].split(' ').forEach((text, j) => {
				ctx.fillText(text, 0, 30 * j);
			});

			ctx.restore();
		}
	}

	randomBtn.addEventListener('click', rotate);

	function rotate() {

		canvas.style.transform = 'initial';
		canvas.style.transition = 'initial';
		let alpha = Math.floor(Math.random()*100);

		setTimeout(() => {
			let ran = Math.floor(Math.random() * points.length);
			let arc = 360 / points.length;
			let rotate = (ran * arc) + 3600 + (arc * 3) - (arc/4) + alpha;

			console.log(ran);
			console.log(arc);
			console.log(rotate);

			resultNum = points[ran-1];
			console.log(resultNum);

			canvas.style.transform = `rotate(-${rotate}deg`;
			canvas.style.transition = '2s';

			setTimeout(() => {
				resultModal.classList.add('on');

				let resultMessage = document.getElementById('random-result');
				resultMessage.innerText += ' ' + resultNum + ' 포인트 당첨!!!!!!';
			}, 3000);
		}, 1);
	}

	modalCloseBtn.addEventListener('click', function() {
		resultModal.classList.remove('on');
		randomModal.classList.remove('on');

		resultModal.display='none';
		randomModal.display='none';
	});
});
