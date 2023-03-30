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
}


