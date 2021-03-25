package com.cos.baseball.domain.team;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.cos.baseball.domain.player.Player;
import com.cos.baseball.domain.stadium.Stadium;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Team {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String teamName;

	//선수
	@OneToMany(mappedBy = "team", cascade=CascadeType.ALL)
	private List<Player> players;
	
	//구장
	@OneToOne
	@JoinColumn(name = "stadiumName")
	private Stadium stadium;
}
