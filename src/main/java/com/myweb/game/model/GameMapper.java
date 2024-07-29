package com.myweb.game.model;

import java.util.List;

public interface GameMapper {
	List<GameDTO> getSoccer();
	List<GameDTO> getBase();
	List<GameDTO> getBasket();
	List<GameDTO> getGames();
}
