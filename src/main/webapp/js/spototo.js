document.addEventListener('DOMContentLoaded', function() {
    // 모든 항목 선택
    var matches = document.querySelectorAll('.spototo-match');
	
    matches.forEach(function(match) {
        var matchTime = match.querySelector('.match-time');
        var gameDate = new Date(matchTime.textContent);
        var timer = match.querySelector('.Timer');
        
        function updateTime(){
        
	        var now = new Date();// 현재 시간
	        var diff = gameDate.getTime() - now.getTime(); // 시간 차이
	        // 남은 시간
	        var days = Math.floor(diff / 1000 / 60 / 60 / 24);
	        var hours = Math.floor(diff / 1000 / 60 / 60 - days * 24);
	        var minutes = Math.floor(diff / 1000 / 60 - (days * 24 * 60 + hours * 60));
	        var seconds = Math.floor(diff / 1000 - (days * 24 * 60 * 60 + hours * 60 * 60 + minutes * 60));
	        
	        timer.textContent = days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
        }
        
        updateTime();
		setInterval(updateTime,1000);
        
        // 투표 비율 업데이트
        var matchBtns = match.querySelector('.match-btns');
        var teamA = match.querySelector('.spototo-a');
        var teamB = match.querySelector('.spototo-b');
        var Draw = match.querySelector('.spototo-d');
        
        var Acnt = 0;
        var Bcnt = 0;
        var Dcnt = 0;
        var total = 0;

        matchBtns.addEventListener('click', function(event) {
			
            if (event.target.classList.contains('win-a')) {
                Acnt++;
            } else if (event.target.classList.contains('win-b')) {
                Bcnt++;
            } else if (event.target.classList.contains('win-d')) {
                Dcnt++;
            }

            total = Acnt + Bcnt + Dcnt;

            teamA.style.width = Acnt/total*100+"%";
   	 		teamB.style.width = Bcnt/total*100+"%";
    		Draw.style.width= Dcnt/total*100+"%";
        });
        
        
        
        var overlay = document.querySelector(".overlay");
    	var ok = match.querySelector("#toto-ok");

    	ok.addEventListener("click", function(){

        	overlay.style.display="block";
        
        	setTimeout(function(){ // 2초뒤 사라짐
            	overlay.style.display="none";
        	},2000); 
    	});
    	
    	
    	/*포인트 차감하기*/
    	
    	
    	
    	function usePoint(){
			
			var userP = document.getElementById("user-p").value;
	    	var usingP = document.getElementById("using-p").value;
	    	
	    	console.log(userP);
	    	console.log(usingP);
	    	
	    	var userPoint = parseInt(userP);
	    	var usingPoint = parseInt(usingP);
	    	
	    	var id="user2";
			var point=usingPoint;
			
	    	if(usingPoint > userPoint ){
				alert("포인트가 부족합니다.");
				return;
			}
			
			var data = {id: id , point: point};
			console.log(data);
			fetch("/spotalk/game/soccerlist.game",{
				method: "POST", //post방식 요청
				headers: {
					"Content-Type":"application/json" //데이터 타입
				},
				body: JSON.stringify(data)
			})
			.then(function(response){
				if (!response.ok) {
            		throw new Error('response 오류남');
        		}
    			return response.json();
			})
			.then(function(data){
				console.log(data);
			})
			.catch(function(error){
				alert("Error"+error);
			})
			
		}
    	
    	
    	/*확인 클릭하면 usePoint실행*/
    	var ok = document.getElementById("toto-ok");
    	ok.addEventListener("click", function(){
			//event.preventDefault();
			
			usePoint();
		})
    	
    	
    	
    	
    });
});
