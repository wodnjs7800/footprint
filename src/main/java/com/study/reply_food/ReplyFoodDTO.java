package com.study.reply_food;

import lombok.Data;

@Data
public class ReplyFoodDTO {
  private int replyno;
  private String content;
  private String regdate;
  private String id;
  private float point;
  private int foodno; 
}