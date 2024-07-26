package com.myweb.predict.model;

import java.util.List;

public interface PredictMapper {
    List<PredictDTO> getPointList(String id);
    List<PredictDTO> getPlusPointList(String id);
    List<PredictDTO> getMinusPointList(String id);
}
