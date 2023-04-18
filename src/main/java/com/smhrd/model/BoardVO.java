package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@AllArgsConstructor //모든 파라미터를 받는 생성자
@RequiredArgsConstructor //final or @NonNUll 파라미터만 받는 생성자
@NoArgsConstructor //기본생성자
@Getter //getter메소드
@Setter //setter 메소드
public class BoardVO {

	private BigDecimal b_num;
	@NonNull private String b_name;
	@NonNull private String b_content;
	private Timestamp b_date;
	@NonNull private String u_id;
	private int b_views;
	private int b_likes;
	@NonNull private String b_img;
}
