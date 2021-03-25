package com.cos.baseball.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.baseball.domain.dto.RegStaDto;
import com.cos.baseball.domain.stadium.Stadium;
import com.cos.baseball.service.StaService;
import com.cos.baseball.utils.Script;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class StadiumController {

	private final StaService staService;
	
	@GetMapping("/")
	private String stadium() {
		return "registerStadiumForm";
	}
	
	@GetMapping("/msta")
	private String findAllSta(Model model) {
		model.addAttribute("stadiums",staService.전체찾기());
		return "maStadiumForm";
	}
	
	@PostMapping("/stadium")
	private @ResponseBody String rStadium(RegStaDto dto) {
		String name=dto.getStadiumName();
		Stadium stadium=Stadium.builder()
				.stadiumName(name)
				.build();
		staService.저장하기(stadium);
		return Script.href("저장성공", "/msta");
	}
	
	@DeleteMapping("/stadium/{id}")
	public @ResponseBody String delete(@PathVariable int id) {
		staService.삭제(id);
		
		return "200";
	}
}
