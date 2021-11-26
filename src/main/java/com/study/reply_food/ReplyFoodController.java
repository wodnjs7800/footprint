package com.study.reply_food;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.study.utility.Utility;

@RestController
public class ReplyFoodController {
  private static final Logger log = LoggerFactory.getLogger(ReplyFoodController.class);

  @Autowired
  private ReplyFoodMapper mapper;

  @GetMapping("/food/reply/list/{foodno}/{sno}/{eno}")
  public ResponseEntity<List<ReplyFoodDTO>> getList(@PathVariable("foodno") int foodno, 
      @PathVariable("sno") int sno,
      @PathVariable("eno") int eno) {

    Map map = new HashMap();
    map.put("sno", sno);
    map.put("eno", eno);
    map.put("foodno", foodno);

    return new ResponseEntity<List<ReplyFoodDTO>>(mapper.list(map), HttpStatus.OK);
  }

  @GetMapping("/food/reply/page")
  public ResponseEntity<String> getPage(@RequestParam("nPage") int nPage, 
      @RequestParam("nowPage") int nowPage,
      @RequestParam("foodno") int foodno, 
      @RequestParam("col") String col, 
      @RequestParam("word") String word) {

    int total = mapper.total(foodno);
    String url = "read";

    int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수

    String paging = Utility.rpagingFood(total, nowPage, recordPerPage, col, word, url, nPage, foodno);

    return new ResponseEntity<>(paging, HttpStatus.OK);

  }
  
  @PostMapping("/food/reply/create")
  public ResponseEntity<String> create(@RequestBody ReplyFoodDTO vo) {
 
    log.info("ReplyDTO1: " + vo.getContent());
    log.info("ReplyDTO1: " + vo.getId());
    log.info("ReplyDTO1: " + vo.getFoodno());
    log.info("ReplyDTOpoint: " + vo.getPoint());
 
    vo.setContent(vo.getContent().replaceAll("/n/r", "<br>"));
    int flag = mapper.create(vo);
    mapper.updatePoint(vo);
 
    log.info("Reply INSERT flag: " + flag);
 
    return flag == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
  }
 
  @GetMapping("/food/reply/{replyno}")
  public ResponseEntity<ReplyFoodDTO> get(@PathVariable("replyno") int replyno) {
 
    log.info("get: " + replyno);
 
    return new ResponseEntity<>(mapper.read(replyno), HttpStatus.OK);
  }
  
  @PutMapping("/food/reply/{replyno}")
  public ResponseEntity<String> modify(@RequestBody ReplyFoodDTO vo, 
      @PathVariable("replyno") int replyno) {
 
    log.info("replyno: " + replyno);
    log.info("modify: " + vo);
 
    return mapper.update(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
 
  }
  
  @DeleteMapping("/food/reply/{replyno}")
  public ResponseEntity<String> remove(@PathVariable("replyno") int replyno) {
 
    log.info("remove: " + replyno);
    mapper.deletePoint(replyno);
    
    return mapper.delete(replyno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
 
  }
}