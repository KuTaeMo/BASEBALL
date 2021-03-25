package com.cos.baseball.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.baseball.domain.dto.RegTeamDto;
import com.cos.baseball.domain.stadium.Stadium;
import com.cos.baseball.domain.stadium.StadiumRepository;
import com.cos.baseball.domain.team.Team;
import com.cos.baseball.service.TeamService;
import com.cos.baseball.utils.Script;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class TeamController {

	private final TeamService teamService;
	private final StadiumRepository stadiumRepository;
	
	@GetMapping("/team")
	private String team() {
		return "registerTeamForm";
	}
	
	@GetMapping("/mteam")
	private String findAllTeam(Model model) {
		model.addAttribute("team",teamService.전체찾기());
		return "maTeamForm";
	}
	
	@PostMapping("/team")
	private @ResponseBody String rTeam(RegTeamDto dto) {
		String tname=dto.getTeamName();
		String sname=dto.getStadiumName();
	
		
		Stadium stadiumEntity=stadiumRepository.findByStadiumName(sname);
		
		System.out.println(sname+"/"+tname);

		Team team=Team.builder()
				.teamName(tname)
				.build();
		
		stadiumEntity.setTeam(team);
		
		team.setStadium(stadiumEntity);
		
		teamService.저장하기(team);
		
		return Script.href("저장성공", "/mteam");
	}
	
	@DeleteMapping("/team/{id}")
	private @ResponseBody String delete(@PathVariable int id) {
		teamService.삭제(id);
		return "200";
	}
}
