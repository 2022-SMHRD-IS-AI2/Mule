package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Getter

public class BoardCommentVO {

	private BigDecimal board_cmt_num;
	@NonNull private int b_num;
	@NonNull private String board_cmt_content;
	private Timestamp board_cmt_date;
	@NonNull private String u_id;

}
