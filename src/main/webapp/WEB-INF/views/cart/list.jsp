<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기</title>

<link href="${pageContext.request.contextPath }/css/heon.css"
   rel="stylesheet">
<script type="text/javascript">
   function readf(foodno) {
      var url = "../food/read";
      url += "?foodno=" + foodno;
      url += "&nowPage=1";
      location.href = url;

   }
   function readt(travelno) {
      var url = "../travel/read";
      url += "?travelno=" + travelno;
      url += "&nowPage=1";
      location.href = url;

   }
   function deleteC(cartno) {
      var url = "/cart/delete";
      url += "?cartno=" + cartno;
      location.href = url;
   }
</script>
</head>
<body>
   <div class="space-medium">
      <div class="container">
         <div class="row">
            <div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <div class="section-title text-center">
                  <h1>여행</h1>
               </div>
            </div>
         </div>
         <div class="row">
            <!-- Swiper -->
            <div class="swiper mySwiper">
               <div class="swiper-wrapper">

                  <c:forEach var="dto" items="${tlist }">
                     <div class="swiper-slide expand_img">
                        <div class="service-block">
                           <div class="testimonial" style="width: 230px; height: 168px">
                              <img src="/travel/storage/${dto.bname }" class="img-thumbnail"
                                 style="width: 230px; height: 168px"
                                 onclick='location.href="javascript:readt(${dto.travelno} )"'>
                           </div>
                           <div class="service-content">
                              <div class="testimonial-content" style="padding: 10px">
                                 <h4 class="hiddenx">
                                    ${dto.bname }
                                    <button type="button"
                                       class="btn btn-outline-success my-2 my-sm-0"
                                       style="margin-left: 5px; height: 30px"
                                       onclick="deleteC('${dto.cartno}')">X</button>
                                 </h4>
                              </div>
                           </div>

                        </div>
                     </div>
                  </c:forEach>

               </div>
               <div class="swiper-button-next"></div>
               <div class="swiper-button-prev"></div>
               <div class="swiper-pagination"></div>
            </div>

            <!-- Swiper JS -->
            <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

            <!-- Initialize Swiper -->
            <script>
               var swiper = new Swiper(".mySwiper", {
                  slidesPerView : 3,
                  spaceBetween : 30,
                  slidesPerGroup : 3,
                  loop : true,
                  loopFillGroupWithBlank : true,
                  pagination : {
                     el : ".swiper-pagination",
                     clickable : true,
                  },
                  navigation : {
                     nextEl : ".swiper-button-next",
                     prevEl : ".swiper-button-prev",
                  },
               });
            </script>
         </div>
      </div>
   </div>
   <div class="space-medium">
      <div class="container">
         <div class="row">
            <div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <div class="section-title text-center">
                  <h1>음식</h1>
               </div>
            </div>
         </div>
         <div class="row">
            <!-- Swiper -->
            <div class="swiper mySwiper">
               <div class="swiper-wrapper">

                  <c:forEach var="dto" items="${flist }">
                     <div class="swiper-slide expand_img">
                        <div class="service-block">
                           <div class="testimonial" style="width: 230px; height: 168px">
                              <img src="/food/storage/${dto.bname }" class="img-thumbnail"
                                 style="width: 230px; height: 168px"
                                 onclick='location.href="javascript:readf(${dto.foodno} )"'>
                           </div>
                           <div class="service-content">
                              <div class="testimonial-content" style="padding: 10px">
                                 <h4 class="hiddenx">
                                    ${dto.bname }
                                    <button type="button"
                                       class="btn btn-outline-success my-2 my-sm-0"
                                       style="margin-left: 5px; height: 30px"
                                       onclick="deleteC('${dto.cartno}')">X</button>
                                 </h4>
                              </div>
                           </div>

                        </div>
                     </div>
                  </c:forEach>

               </div>
               <div class="swiper-button-next"></div>
               <div class="swiper-button-prev"></div>
               <div class="swiper-pagination"></div>
            </div>

            <!-- Swiper JS -->
            <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

            <!-- Initialize Swiper -->
            <script>
               var swiper = new Swiper(".mySwiper", {
                  slidesPerView : 3,
                  spaceBetween : 30,
                  slidesPerGroup : 3,
                  loop : true,
                  loopFillGroupWithBlank : true,
                  pagination : {
                     el : ".swiper-pagination",
                     clickable : true,
                  },
                  navigation : {
                     nextEl : ".swiper-button-next",
                     prevEl : ".swiper-button-prev",
                  },
               });
            </script>
         </div>
      </div>
   </div>
</body>
</html>