
function likePost(postId) {
    $.post('likePost.board', {postId: postId}, function() {
        location.reload();
    });
}

function dislikePost(postId) {
    $.post('dislikePost.board', {postId: postId}, function() {
        location.reload();
    });
}


function likeComment(commentId, postId) {
    $.post('likeComment.board', {commentId: commentId, postId: postId}, function() {
        location.reload();
    });
}

function dislikeComment(commentId, postId) {
    $.post('dislikeComment.board', {commentId: commentId, postId: postId}, function() {
        location.reload();
    });
}


document.addEventListener('DOMContentLoaded', function() {
	var commentsContainer = document.querySelector('.comments-container');
	var comments = Array.from(commentsContainer.children);
	
	// 댓글을 오래된 순서로 재정렬
	comments.reverse().forEach(comment => commentsContainer.appendChild(comment));
});

