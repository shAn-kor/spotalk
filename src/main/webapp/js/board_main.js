document.addEventListener('DOMContentLoaded', () => {
    const dropdownToggle = document.querySelector('[data-toggle="dropdown"]');
    const dropdownMenu = document.querySelector('.dropdown-menu');
    const form = document.getElementById('sortForm');
    
    // 드롭다운 버튼 클릭 시 메뉴 표시/숨김
    dropdownToggle.addEventListener('click', () => {
        const isVisible = dropdownMenu.style.display === 'block';
        dropdownMenu.style.display = isVisible ? 'none' : 'block';
    });

    // 드롭다운 메뉴의 링크 클릭 시 폼 제출
    dropdownMenu.addEventListener('click', (event) => {
        const target = event.target.closest('.dropdown-item');
        if (target) {
            event.preventDefault(); // 기본 링크 동작 방지
            form.submit(); // 폼 제출
        }
    });
    
    // 페이지 클릭 시 드롭다운 메뉴 닫기
    document.addEventListener('click', (event) => {
        if (!dropdownToggle.contains(event.target) && !dropdownMenu.contains(event.target)) {
            dropdownMenu.style.display = 'none';
        }
    });
});




document.addEventListener("DOMContentLoaded", function () {
    const titles = document.querySelectorAll('.truncate');
    titles.forEach(title => {
        const maxLength = 50;
        if (title.textContent.length > maxLength) {
            title.textContent = title.textContent.substring(0, maxLength - 3) + '...';
        }
    });
});

