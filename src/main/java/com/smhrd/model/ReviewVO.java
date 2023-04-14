package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;


  @Getter
  @AllArgsConstructor
  @RequiredArgsConstructor
  @NoArgsConstructor
  public class ReviewVO {
  
  private BigDecimal REVIEW_NUM;
  @NonNull private String PROD_NUM;
  @NonNull private String REVIEW_CONTENT; 
  private Timestamp REVIEW_DATE;
  @NonNull private String U_ID;
  @NonNull private int REVIEW_RATINGS;
  private float avg_rating;

  }

