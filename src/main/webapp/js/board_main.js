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
