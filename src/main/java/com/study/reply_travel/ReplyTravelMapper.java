package com.study.reply_travel;
 
import java.util.List;
import java.util.Map;
 
public interface ReplyTravelMapper {
 
   int create(ReplyTravelDTO replyDTO);
 
   List<ReplyTravelDTO> list(Map map);
 
   ReplyTravelDTO read(int replyno);
  
   int update(ReplyTravelDTO replyDTO); 
   
   int delete(int replyno);
 
   int total(int travelno);

   int bdelete(int travelno);
   
   void updatePoint(ReplyTravelDTO replyDTO);

   void deletePoint(int replyno);

}