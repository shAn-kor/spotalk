let commentContent = document.getElementById("commentContent");

let commentSubmitBtn = document.getElementById("comment-submit-btn");

commentSubmitBtn.addEventListener("click", (e) => {
    e.preventDefault();
    fetch('checkBadWords.board', {
        method: 'POST',
        contentType: 'application/json',
        body: JSON.stringify({
            title: commentContent.value,
            content: commentContent.value
        })
    }).then(response => { return response.json() })
        .then(data => {
            if (data.boardMsg === 'ok') {
                document.commentForm.submit();
            } else {
                alert('욕설은 삼가해 주세요');
            }
        }).catch(response => { console.log(response) });
})