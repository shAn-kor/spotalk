var gradeElement = document.querySelectorAll('.rank-box .user > .rank-user-grade');

// data-grade 속성에서 grade_id 값을 가져옵니다.
for (var i = 0; i < gradeElement.length; i++) {

    var gradeId = gradeElement[i].innerHTML;

    // grade_id 값에 따라 background-position을 설정합니다.
    switch (gradeId.toString().trim()) {
        case '1':
            document.getElementById('rank-'+gradeId.toString().trim()).style.backgroundPosition = '5px 0px';
            break;
        case '2':
            document.getElementById('rank-'+gradeId.toString().trim()).style.backgroundPosition = '-36px 0px';
            break;
        case '3':
            document.getElementById('rank-'+gradeId.toString().trim()).style.backgroundPosition = '-76px 0px';
            break;
        case '4':
            console.log('grade 4');
            document.getElementById('rank-'+gradeId.toString().trim()).style.backgroundPosition = '-117px 0px';
            break;
        case '5':
            document.getElementById('rank-'+gradeId.toString().trim()).style.backgroundPosition = '-157px 0px';
            break;
        case '6':
            document.getElementById('rank-'+gradeId.toString().trim()).style.backgroundPosition = '2px -40px';
            break;
        case '7':
            document.getElementById('rank-'+gradeId.toString().trim()).style.backgroundPosition = '-38px -40px';
            break;
        case '8':
            document.getElementById('rank-'+gradeId.toString().trim()).style.backgroundPosition = '-78px -40px';
            break;
        case '9':
            document.getElementById('rank-'+gradeId.toString().trim()).style.backgroundPosition = '-118px -40px';
            break;
        case '10':
            document.getElementById('rank-'+gradeId.toString().trim()).style.backgroundPosition = '-157px -40px';
            break;
        case '11':
            document.getElementById('rank-'+gradeId.toString().trim()).style.backgroundPosition = '-157px -40px';
            break;
        default:
            gradeElement[i].style.backgroundPosition = '5px 0px'; // 기본값 설정
            break;
    }
}