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

public class OrderVO {

	private int order_num;
	@NonNull private String prod_num;
    private String order_date;
    @NonNull private String u_id;
    @NonNull private int amount;
    private String delivery_progress;
    private String payment_status;
    private String return_status;
    private String usedprod_status;
    private String review_status;
    
	
	public OrderVO(String u_id,  int order_num) {
		this.order_num = order_num;
		this.u_id = u_id;
	}
    
}
