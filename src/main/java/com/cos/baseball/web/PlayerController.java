package com.cos.baseball.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.baseball.domain.dto.RegPlayerDto;
import com.cos.baseball.domain.dto.RegStaDto;
import com.cos.baseball.domain.dto.RegTeamDto;
import com.cos.baseball.domain.player.Player;
import com.cos.baseball.domain.stadium.Stadium;
import com.cos.baseball.domain.team.Team;
import com.cos.baseball.domain.team.TeamRepository;
import com.cos.baseball.service.PlayerService;
import com.cos.baseball.service.StaService;
import com.cos.baseball.service.TeamService;
import com.cos.baseball.utils.Script;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class PlayerController {

	private final PlayerService playerService;
	private final TeamRepository teamRepository;

	@GetMapping("/player")
	private String player() {
		return "registerPlayerForm";
	}

	@GetMapping("/mplayer")
	private String findAllPlayer(Model model) {
		model.addAttribute("players",playerService.전체찾기());
		return "maPlayerForm";
	}
	
	@GetMapping("/position")
	private String viewPostion(Model model) {
		model.addAttribute("players",playerService.전체찾기());
		return "viewPlayerByPosition";
	}

	@PostMapping("/player")
	private @ResponseBody String rPlayer(RegPlayerDto dto) {
		
		System.out.println("팀 :"+dto.getTeamName());
		Player player=new Player();
		player.setPlayerName(dto.getPlayerName());
		player.setPosition(dto.getPosition());
		player.setTeam(teamRepository.findByTeamName(dto.getTeamName()));
		
		playerService.저장(player);
		
		return Script.href("저장 성공","/mplayer");
	}
	
	@DeleteMapping("/player/{id}")
	private @ResponseBody String delete(@PathVariable int id) {
		playerService.삭제(id);
		return "200";
	}
}
