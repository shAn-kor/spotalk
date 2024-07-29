package com.myweb.predict.model;

import java.util.List;

public interface PredictMapper {
    List<PredictDTO> getPointList(String id);
    List<PredictDTO> getPlusPointList(String id);
    List<PredictDTO> getMinusPointList(String id);

    int insertBatting(PredictDTO dto);

    List<PredictDTO> getTeamChoice(String gameId);
}
