package com.study.reply_food;
 
import java.util.List;
import java.util.Map;
 
public interface ReplyFoodMapper {
 
   int create(ReplyFoodDTO replyDTO);
 
   List<ReplyFoodDTO> list(Map map);
 
   ReplyFoodDTO read(int replyno);
  
   int update(ReplyFoodDTO replyDTO); 
   
   int delete(int replyno);
 
   int total(int foodno);

   int bdelete(int foodno);

   void updatePoint(ReplyFoodDTO replyDTO);

   void deletePoint(int replyno);

}