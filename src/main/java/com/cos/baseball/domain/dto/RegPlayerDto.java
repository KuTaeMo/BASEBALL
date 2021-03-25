package com.cos.baseball.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RegPlayerDto {
	private String playerName;
	private String position;
	private String teamName;

}
