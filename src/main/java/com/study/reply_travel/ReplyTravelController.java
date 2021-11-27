package com.study.reply_travel;

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
public class ReplyTravelController {
  private static final Logger log = LoggerFactory.getLogger(ReplyTravelController.class);

  @Autowired
  private ReplyTravelMapper mapper;

  @GetMapping("/travel/reply/list/{travelno}/{sno}/{eno}")
  public ResponseEntity<List<ReplyTravelDTO>> getList(@PathVariable("travelno") int travelno, 
      @PathVariable("sno") int sno,
      @PathVariable("eno") int eno) {

    Map map = new HashMap();
    map.put("sno", sno);
    map.put("eno", eno);
    map.put("travelno", travelno);

    return new ResponseEntity<List<ReplyTravelDTO>>(mapper.list(map), HttpStatus.OK);
  }

  @GetMapping("/travel/reply/page")
  public ResponseEntity<String> getPage(@RequestParam("nPage") int nPage, 
      @RequestParam("nowPage") int nowPage,
      @RequestParam("travelno") int travelno, 
      @RequestParam("col") String col, 
      @RequestParam("word") String word) {

    int total = mapper.total(travelno);
    String url = "read";

    int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수

    String paging = Utility.rpagingTravel(total, nowPage, recordPerPage, col, word, url, nPage, travelno);

    return new ResponseEntity<>(paging, HttpStatus.OK);

  }
  
  @PostMapping("/travel/reply/create")
  public ResponseEntity<String> create(@RequestBody ReplyTravelDTO vo) {
 
    log.info("ReplyDTO1: " + vo.getContent());
    log.info("ReplyDTO1: " + vo.getId());
    log.info("ReplyDTO1: " + vo.getTravelno());
 
    vo.setContent(vo.getContent().replaceAll("/n/r", "<br>"));
 
    int flag = mapper.create(vo);
    mapper.updatePoint(vo);
 
    log.info("Reply INSERT flag: " + flag);
 
    return flag == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
  }
 
  @GetMapping("/travel/reply/{replyno}")
  public ResponseEntity<ReplyTravelDTO> get(@PathVariable("replyno") int replyno) {
 
    log.info("get: " + replyno);
 
    return new ResponseEntity<>(mapper.read(replyno), HttpStatus.OK);
  }
  
  @PutMapping("/travel/reply/{replyno}")
  public ResponseEntity<String> modify(@RequestBody ReplyTravelDTO vo, 
      @PathVariable("replyno") int replyno) {
 
    log.info("replyno: " + replyno);
    log.info("modify: " + vo);
 
    return mapper.update(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
 
  }
  
  @DeleteMapping("/travel/reply/{replyno}")
  public ResponseEntity<String> remove(@PathVariable("replyno") int replyno) {
 
    log.info("remove: " + replyno);
    mapper.deletePoint(replyno);
 
    return mapper.delete(replyno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
 
  }
}