window.onload = function() {
  let answer = document.getElementById('QnA_A');
  let answerResult = false;
  answer.addEventListener('change', checkAnswer);
  function checkAnswer() {
      if (answer.value.length >= 1) {
  		answerResult = true;
      } else idResult = false;
    }
    
    let QnAForm = document.QnAForm;
    let QnABtn = document.getElementById("QnA_submit");
    QnABtn.addEventListener('click', function() {
  	event.preventDefault();
  	
  	checkAnswer();
  	
  	if (!answerResult) {
  		alert('답을 입력해주세요.');
  		answer.focus();
  	} 
  	
  	if (answerResult) {
  		QnAForm.submit();
  	}
    });
}