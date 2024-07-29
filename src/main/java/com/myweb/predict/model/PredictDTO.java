package com.myweb.predict.model;

import java.sql.Timestamp;

public class PredictDTO {
    String userId;
    String gameId;
    String choice;
    Long betPoint;
    String pResult;
    Timestamp cDate;

    public PredictDTO() {}

    public PredictDTO(String userId, String gameId, String choice, Long betPoint, String pResult, Timestamp cDate) {
        this.userId = userId;
        this.gameId = gameId;
        this.choice = choice;
        this.betPoint = betPoint;
        this.pResult = pResult;
        this.cDate = cDate;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getChoice() {
        return choice;
    }

    public void setChoice(String choice) {
        this.choice = choice;
    }

    public Long getBetPoint() {
        return betPoint;
    }

    public void setBetPoint(Long betPoint) {
        this.betPoint = betPoint;
    }

    public String getpResult() {
        return pResult;
    }

    public void setpResult(String pResult) {
        this.pResult = pResult;
    }

    public Timestamp getcDate() {
        return cDate;
    }

    public void setcDate(Timestamp cDate) {
        this.cDate = cDate;
    }

    @Override
    public String toString() {
        return "PredictDTO{" +
                "userId='" + userId + '\'' +
                ", gameId='" + gameId + '\'' +
                ", choice='" + choice + '\'' +
                ", betPoint=" + betPoint +
                ", pResult='" + pResult + '\'' +
                ", cDate=" + cDate +
                '}';
    }

}
