var gradeElement = document.querySelector('.rank-box .user > .rank-user-grade');

// data-grade 속성에서 grade_id 값을 가져옵니다.
var gradeId = gradeElement.innerHTML;

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