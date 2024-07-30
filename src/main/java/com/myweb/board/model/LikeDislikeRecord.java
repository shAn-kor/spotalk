package com.myweb.board.model;

public class LikeDislikeRecord {
    private String userId;
    private String postId;  // 게시글에 대한 기록을 위한 필드
    private String commentId;  // 댓글에 대한 기록을 위한 필드
    private String isLike;  // 'Y'는 추천, 'N'은 비추천

    // 기본 생성자
    public LikeDislikeRecord() {}

    // 생성자
    public LikeDislikeRecord(String userId, String postId, String isLike) {
        this.userId = userId;
        this.postId = postId;
        this.isLike = isLike;
    }

    // Getter 및 Setter
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public String getCommentId() {
        return commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId;
    }

    public String getIsLike() {
        return isLike;
    }

    public void setIsLike(String isLike) {
        this.isLike = isLike;
    }

    @Override
    public String toString() {
        return "LikeDislikeRecord{" +
                "userId='" + userId + '\'' +
                ", postId='" + postId + '\'' +
                ", commentId='" + commentId + '\'' +
                ", isLike='" + isLike + '\'' +
                '}';
    }
}
