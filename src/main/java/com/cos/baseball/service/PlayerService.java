package com.cos.baseball.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.baseball.domain.player.Player;
import com.cos.baseball.domain.player.PlayerRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PlayerService {

	private final PlayerRepository playerRepository;
	
	@Transactional
	public List<Player> 전체찾기(){
		return playerRepository.findAll();
	}
	
	public void 저장(Player player) {
		playerRepository.save(player);
	}
	
	public void 삭제(int id) {
		playerRepository.deleteById(id);
	}
}
