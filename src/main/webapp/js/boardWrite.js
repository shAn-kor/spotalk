let boardForm = document.boardForm;
console.log(boardForm);

let submitBtn = document.getElementById("submit-btn");

submitBtn.addEventListener("click", (e) => {
    console.log(boardForm.post_title);
    console.log(boardForm.post_content);

    e.preventDefault();
    fetch('checkBadWords.board', {
        method: 'POST',
        contentType: 'application/json',
        body: JSON.stringify({
            title: boardForm.post_title.value,
            content: boardForm.post_content.value
        })
    }).then(response => { return response.json() })
        .then(data => {
            if (data.boardMsg === 'ok') {
                boardForm.submit();
            } else {
                alert('욕설은 삼가해 주세요');
            }
        }).catch(response => { console.log(response) });
})