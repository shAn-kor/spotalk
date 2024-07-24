window.onload = function() {
    // 모든 탭 내용을 숨김
    function setupTabs(tabLinksSelector, tabContentsSelector) {
        // 모든 탭 내용을 숨김
        var tabContents = document.querySelectorAll(tabContentsSelector);
        tabContents.forEach(function(content) {
            content.style.display = 'none';
        });

        // 첫 번째 탭을 선택하고 내용을 보여줌
        var tabLinks = document.querySelectorAll(tabLinksSelector);
        if (tabLinks.length > 0) {
            tabLinks[0].classList.add('active');
            document.querySelector(tabLinks[0].hash).style.display = 'block';
        }

        // 탭 클릭 이벤트 설정
        tabLinks.forEach(function(link) {
            link.addEventListener('click', function(event) {
                event.preventDefault(); // 기본 동작 방지

                // 모든 탭 내용을 숨김
                tabContents.forEach(function(content) {
                    content.style.display = 'none';
                });

                // 클릭된 탭의 내용을 표시
                var targetContent = document.querySelector(this.hash);
                targetContent.style.display = 'block';

                // 모든 탭에서 active 클래스 제거
                tabLinks.forEach(function(link) {
                    link.classList.remove('active');
                });

                // 클릭된 탭에 active 클래스 추가
                this.classList.add('active');
            });
        });
    }

    // 첫 번째 탭 그룹 설정
    setupTabs('.tabnav a', '.tabcontent > div');

    // 두 번째 탭 그룹 설정
    setupTabs('.tabnav2 a', '.tabcontent2 > div');
    setupTabs('.tabnav3 a', '.tabcontent3 > div');

    let footballRank = document.getElementById('tab2-01');
    let baseballRank = document.getElementById('tab2-02');
    let basballRank = document.getElementById('tab2-03');
}
