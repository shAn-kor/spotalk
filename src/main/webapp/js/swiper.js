document.addEventListener("DOMContentLoaded", function() {
    var swiperWrapper = document.querySelector(".swiper-wrapper");

    function addSlide() {
        var str = "";
        for (var i = 0; i < 3; i++) {
            var sport = '';
            var teamA = '서울';
            var teamB = '인천';
			
			var soccerTeam = ['서울', '인천', '강원', '광주', '김천', '대구', '대전', '울산', '전북', '제주', '포항'];
			var baseballTeam = ['KIA', 'NC', 'KT', 'LG', 'SSG', '두산', '삼성', '키움', '한화'];
			var basketballTeam = ['고양 소노', '대구 한국가스공사', '부산 KCC', '서울 SK', '서울 삼성', '수원 KT', '울산 현대모비스', '원주 DB', '창원 LG'];
			
			if(soccerTeam.includes(teamA)){
				sport = 'soccer';
			} else if(baseballTeam.includes(teamA)){
				sport = 'baseball';
			} else if(basketballTeam.includes(teamA)){
				sport = 'basketball';
			}
			
			var backgroundImage = 'url(img/' + sport + '.jpg)';

            str += '<div class="swiper-slide" style="background-image: ' + backgroundImage + ';">';
            str += '<div class="white-background"></div>';
            str += '<div class="vs"><img src="img/vs.png" alt="vs"></div>';
            str += '<div class="teamA">';
            str += '<img src="img/' + sport + '/' + teamA + '.png" alt="team">';
            str += '</div>';
            str += '<div class="teamB">';
            str += '<img src="img/' + sport + '/' + teamB + '.png" alt="team">';
            str += '</div>';
            str += '</div>';
        }
        swiperWrapper.innerHTML = str;

        var swiper = new Swiper('.swiper-container', {
            autoplay: {
                delay: 5000, // 자동으로 넘어가는 시간(밀리초 단위)
                disableOnInteraction: false, // 사용자가 상호작용해도 자동 재생이 멈추지 않도록 설정
            },
            slidesPerView: 1,
            spaceBetween: 0,
            loop: true,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
    }

    addSlide();
});