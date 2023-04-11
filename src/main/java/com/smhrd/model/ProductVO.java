package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

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

public class ProductVO {

    private BigDecimal prod_num;
    @NonNull private String prod_name;
    @NonNull private String prod_cate;
    @NonNull private int prod_price;
    @NonNull private String prod_title;
    @NonNull private String prod_img1;
    @NonNull private String prod_img2;
    @NonNull private String prod_desc;
    private int likes;
    private int views;
    private Timestamp prod_date;
    @NonNull private int number_of_people;
    @NonNull private int customs_clearance_num;
    @NonNull private String seller_id;
    private String prod_check;
    @NonNull private String return_period;
    private int amount;
    private int bucket_num;
    private int buyer_cnt;
    private String buy_date;
    private String order_date;
    private String delivery_progress;
    private String payment_status;
    private String return_status;
    private String usedprod_status;
    private String review_status;
    private int Order_num;
    
	public ProductVO(String prod_name,int prod_price,String prod_title, String prod_img1,
			String prod_img2, String prod_desc,String seller_id,String return_period,String buy_date) {
		
		this.prod_name =prod_name;
		this.prod_price =prod_price;
		this.prod_title =prod_title;
		this.prod_img1 =prod_img1;
		this.prod_img2 = prod_img2;
		this.prod_desc =prod_desc;
		this.seller_id =seller_id;
		this.return_period =return_period;
		this.buy_date = buy_date;
	}
    
    
}


