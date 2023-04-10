package com.smhrd.model;

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

public class UserVO{


	@NonNull private String u_id;
	@NonNull private String u_pw;
	private String u_name;
	private String u_nick;
	private String u_addr;
	private String u_phone;
	private String u_gender;
	private int u_age;
	private String u_job;
	
}
