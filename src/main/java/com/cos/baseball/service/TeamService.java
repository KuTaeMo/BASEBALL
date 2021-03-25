package com.cos.baseball.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.baseball.domain.team.Team;
import com.cos.baseball.domain.team.TeamRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class TeamService {

	private final TeamRepository teamRepository;
	
	@Transactional
	public List<Team> 전체찾기(){
		return teamRepository.findAll();
	}
	
	@Transactional
	public void 저장하기(Team team) {
		teamRepository.save(team);
	}
	
	@Transactional
	public void 삭제(int id) {
		teamRepository.deleteById(id);
	}
}
