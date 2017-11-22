package com.leaf.model.game;

import java.util.List;

public interface GameDAO {

	void insertScore(GameDTO dto);

	int updateScore(GameDTO dto);

	List<GameDTO> getScoreList(String id);
	
}
