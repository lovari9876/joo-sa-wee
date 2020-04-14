package com.soninlawisdice.vo;

import java.sql.Timestamp;

// 게임정보
public class GameVO {
	private	int	g_no; // 게임번호
	private	String g_name; // 게임이름
	private	Timestamp g_written_date;	//	작성일
	private	Timestamp g_updated_date;	//	수정일
	private	int	g_hit; // 조회수
	private	int	g_recommend_num; // 추천수
	private	String	g_designer;	// 디자이너
	private	int	g_min; // 최소인원
	private	int	g_max; // 최대인원
	private	int	g_playtime;	// 플레이시간
	private	int	g_age; // 사용연령
	private	int	g_difficulty; // 게임난이도
	private	int g_release; // 출시일
	private	int	g_level; //	게임난이도합
	private	int	g_ruletime;	// 룰설명시간합
	private	int	g_lang;	// 언어의존도합
	private	int	g_inter; //	상호작용합
	private	int	g_theme; //	테마충실도합
	private	int	g_replay; // 리플레이성합
	private	int	g_artwork; // 아트웍합
	private	int	g_contents;	//	내용물구성합
	private	int	g_num; // 득표수
	private String g_image;
	private String g_thumbnail;
	private String g_name_kor;
	
	// for resultMap
	private Game_personVO game_personVO;

	// constructors
	public GameVO() {}
	
	public GameVO(int g_no, String g_name, Timestamp g_written_date, Timestamp g_updated_date, int g_hit,
			int g_recommend_num, String g_designer, int g_min, int g_max, int g_playtime, int g_age, int g_difficulty,
			int g_release, int g_level, int g_ruletime, int g_lang, int g_inter, int g_theme, int g_replay,
			int g_artwork, int g_contents, int g_num, String g_image, String g_thumbnail, String g_name_kor,
			Game_personVO game_personVO) {
		this.g_no = g_no;
		this.g_name = g_name;
		this.g_written_date = g_written_date;
		this.g_updated_date = g_updated_date;
		this.g_hit = g_hit;
		this.g_recommend_num = g_recommend_num;
		this.g_designer = g_designer;
		this.g_min = g_min;
		this.g_max = g_max;
		this.g_playtime = g_playtime;
		this.g_age = g_age;
		this.g_difficulty = g_difficulty;
		this.g_release = g_release;
		this.g_level = g_level;
		this.g_ruletime = g_ruletime;
		this.g_lang = g_lang;
		this.g_inter = g_inter;
		this.g_theme = g_theme;
		this.g_replay = g_replay;
		this.g_artwork = g_artwork;
		this.g_contents = g_contents;
		this.g_num = g_num;
		this.g_image = g_image;
		this.g_thumbnail = g_thumbnail;
		this.g_name_kor = g_name_kor;
		this.game_personVO = game_personVO;
	}





	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public Timestamp getG_written_date() {
		return g_written_date;
	}
	public void setG_written_date(Timestamp g_written_date) {
		this.g_written_date = g_written_date;
	}
	public Timestamp getG_updated_date() {
		return g_updated_date;
	}
	public void setG_updated_date(Timestamp g_updated_date) {
		this.g_updated_date = g_updated_date;
	}
	public int getG_hit() {
		return g_hit;
	}
	public void setG_hit(int g_hit) {
		this.g_hit = g_hit;
	}
	public int getG_recommend_num() {
		return g_recommend_num;
	}
	public void setG_recommend_num(int g_recommend_num) {
		this.g_recommend_num = g_recommend_num;
	}
	public String getG_designer() {
		return g_designer;
	}
	public void setG_designer(String g_designer) {
		this.g_designer = g_designer;
	}
	public int getG_min() {
		return g_min;
	}
	public void setG_min(int g_min) {
		this.g_min = g_min;
	}
	public int getG_max() {
		return g_max;
	}
	public void setG_max(int g_max) {
		this.g_max = g_max;
	}
	public int getG_playtime() {
		return g_playtime;
	}
	public void setG_playtime(int g_playtime) {
		this.g_playtime = g_playtime;
	}
	public int getG_age() {
		return g_age;
	}
	public void setG_age(int g_age) {
		this.g_age = g_age;
	}
	public int getG_difficulty() {
		return g_difficulty;
	}
	public void setG_difficulty(int g_difficulty) {
		this.g_difficulty = g_difficulty;
	}
	public int getG_release() {
		return g_release;
	}
	public void setG_release(int g_release) {
		this.g_release = g_release;
	}
	public int getG_level() {
		return g_level;
	}
	public void setG_level(int g_level) {
		this.g_level = g_level;
	}
	public int getG_ruletime() {
		return g_ruletime;
	}
	public void setG_ruletime(int g_ruletime) {
		this.g_ruletime = g_ruletime;
	}
	public int getG_lang() {
		return g_lang;
	}
	public void setG_lang(int g_lang) {
		this.g_lang = g_lang;
	}
	public int getG_inter() {
		return g_inter;
	}
	public void setG_inter(int g_inter) {
		this.g_inter = g_inter;
	}
	public int getG_theme() {
		return g_theme;
	}
	public void setG_theme(int g_theme) {
		this.g_theme = g_theme;
	}
	public int getG_replay() {
		return g_replay;
	}
	public void setG_replay(int g_replay) {
		this.g_replay = g_replay;
	}
	public int getG_artwork() {
		return g_artwork;
	}
	public void setG_artwork(int g_artwork) {
		this.g_artwork = g_artwork;
	}
	public int getG_contents() {
		return g_contents;
	}
	public void setG_contents(int g_contents) {
		this.g_contents = g_contents;
	}
	public int getG_num() {
		return g_num;
	}
	public void setG_num(int g_num) {
		this.g_num = g_num;
	}
	public String getG_image() {
		return g_image;
	}
	public void setG_image(String g_image) {
		this.g_image = g_image;
	}
	public String getG_thumbnail() {
		return g_thumbnail;
	}
	public void setG_thumbnail(String g_thumbnail) {
		this.g_thumbnail = g_thumbnail;
	}
	
	public Game_personVO getGame_personVO() {
		return game_personVO;
	}

	public void setGame_personVO(Game_personVO game_personVO) {
		this.game_personVO = game_personVO;
	}

	public String getG_name_kor() {
		return g_name_kor;
	}

	public void setG_name_kor(String g_name_kor) {
		this.g_name_kor = g_name_kor;
	}
	
	
}
