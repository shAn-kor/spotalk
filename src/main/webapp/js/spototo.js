window.onload = function() {
    // 모든 항목 선택
    let matches = document.querySelectorAll('.spototo-match');
	let userId = document.getElementById('user-id-spototo');
	
    matches.forEach(function(match) {

        let matchTime = match.querySelector('.match-time');
        let gameDate = new Date(matchTime.textContent);
        let timer = match.querySelector('.Timer');
		let usingP = match.querySelector('#using-p');
		let userP = match.querySelector('#user-p');
		let gameId = match.querySelector('#game-id').value;

		console.log(userP);
		console.log(usingP);

		let teamA = document.getElementById(gameId+'-teamA').innerHTML;
		let teamB = document.getElementById(gameId+'-teamB').innerHTML;

		let soccerTeam = ['서울', '인천', '강원', '광주', '김천', '대구', '대전', '울산', '전북', '제주', '포항', '수원FC'];
		let baseballTeam = ['KIA', 'NC', 'KT', 'LG', 'SSG', '두산', '삼성', '키움', '한화', '롯데'];
		let basketballTeam = ['고양 소노', '대구 한국가스공사', '부산 KCC', '서울 SK', '서울 삼성', '수원 KT', '울산 현대모비스', '원주 DB', '창원 LG'];


		let teamAGraph = document.getElementById(gameId+'-teamA-graph');
		let teamBGraph = document.getElementById(gameId+'-teamB-graph');
		let drawGraph = document.getElementById(gameId+'-draw-graph');
		let graphLength = match.querySelector('.spototo-basic > .match').offsetWidth;

		let teamAImg = teamAGraph.querySelector('img');
		let teamBImg = teamBGraph.querySelector('img');

		let sport;
		if(soccerTeam.includes(teamA)){
			sport = 'soccer';
		} else if(baseballTeam.includes(teamA)){
			sport = 'baseball';
		} else if(basketballTeam.includes(teamA)){
			sport = 'basketball';
		}

		teamAImg.src = '../img/' + sport + '/' + teamA + '.png';
		teamBImg.src = '../img/' + sport + '/' + teamB + '.png';

		fetch('getPredictStatus.predict', {
			method: 'POST',
			contentType: 'application/json',
			body: JSON.stringify({gameId: gameId})
		}).then(response => { return response.json() })
			.then(data => {

				let teamACnt = data[teamA] === undefined ? 0 : data[teamA];
				let teamBCnt = data[teamB] === undefined ? 0 : data[teamB];
				let drawCnt = data['draw'] === undefined ? 0 : data['draw'];

				let totalCnt = parseInt(teamACnt + teamBCnt + drawCnt);

				console.log(teamACnt);
				console.log(teamBCnt);
				console.log(drawCnt);
				console.log(totalCnt);

				if (totalCnt === 0) {
					teamACnt = 1;
					teamBCnt = 1;
					drawCnt = 1;
				}

				console.log(graphLength / totalCnt * teamACnt);
				// teamAGraph.display = 'inline-block';
				teamAGraph.style.width = Math.round(graphLength / totalCnt * teamACnt).toString() + 'px';

				// teamBGraph.display = 'inline-block';
				teamBGraph.style.width = Math.round(graphLength / totalCnt * teamBCnt).toString() + 'px';

				// drawGraph.display = 'inline-block';
				drawGraph.style.width = Math.round(graphLength / totalCnt * drawCnt).toString() + 'px';
			});

        function updateTime(){
        
	        let now = new Date();// 현재 시간
	        let diff = gameDate.getTime() - now.getTime(); // 시간 차이
	        // 남은 시간
	        let days = Math.floor(diff / 1000 / 60 / 60 / 24);
	        let hours = Math.floor(diff / 1000 / 60 / 60 - days * 24);
	        let minutes = Math.floor(diff / 1000 / 60 - (days * 24 * 60 + hours * 60));
	        let seconds = Math.floor(diff / 1000 - (days * 24 * 60 * 60 + hours * 60 * 60 + minutes * 60));
	        
	        timer.textContent = days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
        }
        
        updateTime();
		setInterval(updateTime,1000);
        
        // 투표 비율 업데이트
		let teamABtn = document.getElementById('btn-'+gameId+'-'+teamA);
		let teamBBtn = document.getElementById('btn-'+gameId+'-'+teamB);
		let drawBtn = document.getElementById('btn-'+gameId+'-draw');
        let choose = null;

		teamABtn.addEventListener('click', function(){
			choose = teamA;
		});
		teamBBtn.addEventListener('click', function(){
			choose = teamB;
		});
		drawBtn.addEventListener('click', function(){
			choose = 'draw';
		});

		console.log(choose);

    	let ok = match.querySelector("#toto-ok");

    	ok.addEventListener("click", function(){
			if (usingP.value === "" || usingP.value == null) {
				alert('사용할 포인트를 입력해주세요');
				userP.focus();
				return;
			}

			if (parseInt(usingP.value) > parseInt(userP.value)) {
				console.log(usingP.value);
				console.log(userP.value);
				alert('갖고 계신 포인트보다 많이 입력할 수 없습니다.');
				return;
			}

			if (choose == null) {
				alert('예측 결과를 선택해주세요');
				return;
			}

			fetch('betPoint.predict', {
				method: 'POST',
				contentType: 'application/json',
				body: JSON.stringify(
					{
						userId: userId.value,
						gameId: gameId,
						userPoint: userP.value,
						usingPoint: usingP.value,
						choose: choose
					})
			}).then(response => { return response.json() })
				.then(data => {
					console.log(data);
					displayOverlay();
				});

    	});
    	
    	function displayOverlay() {
			let overlay = document.querySelector(".overlay");
			overlay.style.display="block";

			setTimeout(function(){ // 2초뒤 사라짐
				overlay.style.display="none";
				location.reload();
			},2000);
		}
    });
}
