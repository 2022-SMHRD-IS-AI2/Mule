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

public class PayVO {

	private BigDecimal pay_num;
    private Timestamp  pay_date;
    @NonNull private String u_id;
    @NonNull private int paid_amount;
    @NonNull private String recipient;
    @NonNull private String address;
    @NonNull private String phone;
    @NonNull private int total_amount;
    @NonNull private String main_prod_name;
 
}
