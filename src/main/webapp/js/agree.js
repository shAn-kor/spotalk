window.onload = function () {
    const checkAll = document.getElementById('all_check');
    const chks = document.querySelectorAll('.chk');  
    const chkBoxLength = chks.length;
     
    checkAll.addEventListener('click', function(event) {
        if(event.target.checked)  {
            chks.forEach(function(value){
            value.checked = true;
        })
        } else {
           chks.forEach(function(value){
                value.checked = false;
            })
        }
    });
    for (chk of chks){
        chk.addEventListener('click', function() {
            let count = 0;
            chks.forEach(function(value){
                if(value.checked == true){
                    count++;
                }
            })
            if(count !== chkBoxLength){
                checkAll.checked = false;
            }else{
                checkAll.checked = true;
            }
        });
    }

    const submitBtn=document.getElementById('submit_btn');
    submitBtn.addEventListener('click', function(event) {
        if (checkAll.checked == true) {
            location.href="auth.user";
        } else {
            alert('약관에 모두 동의해 주세요!');
        }
    });
}
    