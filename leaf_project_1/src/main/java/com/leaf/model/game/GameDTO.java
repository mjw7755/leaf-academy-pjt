package com.leaf.model.game;

public class GameDTO {
	private String id;
	private int score;
	
	public GameDTO () {}
	
	public GameDTO(String id, int score) {
		super();
		this.id = id;
		this.score = score;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	
	
	
}
