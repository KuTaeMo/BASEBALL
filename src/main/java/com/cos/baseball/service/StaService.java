package com.cos.baseball.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.baseball.domain.stadium.Stadium;
import com.cos.baseball.domain.stadium.StadiumRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class StaService {

	private final StadiumRepository stadiumRepository;
	
	@Transactional
	public List<Stadium> 전체찾기() {
		return stadiumRepository.findAll();
	}
	
	@Transactional
	public void 저장하기(Stadium stadium) {
		stadiumRepository.save(stadium);
	}
	
	@Transactional
	public void 삭제(int id) {
		stadiumRepository.deleteById(id);
	}
}
