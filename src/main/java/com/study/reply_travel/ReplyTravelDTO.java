package com.study.reply_travel;

import lombok.Data;

@Data
public class ReplyTravelDTO {
  private int replyno;
  private String content;
  private String regdate;
  private String id;
  private float point;
  private int travelno; 
}