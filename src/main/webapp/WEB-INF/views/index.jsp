<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Want to start your travel agency online and need website for your travel business? Start with travel agency responsive website template. Its absolutely free.">
    <meta name="keywords" content="travel, tour, tourism, honeymoon pacakage, summer trip, exotic vacation, destination, international, domestic website template, holiday, travel agecny responsive website template">
    <title>Tour and Travel Agency - Responsive Website Template</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Style CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link href="/css/font-awesome.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Link Swiper's CSS -->
    <link
    rel="stylesheet"
    href="https://unpkg.com/swiper/swiper-bundle.min.css"
  />
 <!-- Demo styles -->
 <style>
    html,
    body {
      position: relative;
      height: 100%;
    }

    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper {
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }

    .swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
  </style>
</head>

<body>

    <!-- page-header-start -->
	<div
		style="background: url(${pageContext.request.contextPath }/images/12.jpg) no-repeat center; background-size: cover; margin: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5 col-sm-6 col-xs-12">
					<div class="page-section">
						<h1 class="page-title">메인페이지</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
    <!-- service-section start -->
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="section-title text-center">
                        <h1>여행 추천</h1>
                    </div>
                </div>
            </div>
            <div class="row">
               <!-- Swiper -->
    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide">    
                <div class="service-block">
                    <div class="service-img">
                        <a href="#"><img src="images/service-img-1.jpg" alt="Tour and Travel Agency - Responsive Website Template"></a>
                    </div>
                    <div class="service-content">
                        <h3><a href="#" class="title">Tour</a></h3>
                        <p>Scelerisque vitae velit e llamcorper plvinar esras sit amet odio et dolor por bibendum sit amet neceros.</p>
                     
                    </div>
                
            </div>
          </div>
          <div class="swiper-slide"> 
                <div class="service-block">
                    <div class="service-img">
                        <a href="#"><img src="images/service-img-1.jpg" alt="Tour and Travel Agency - Responsive Website Template"></a>
                    </div>
                    <div class="service-content">
                        <h3><a href="#" class="title">Tour</a></h3>
                        <p>Scelerisque vitae velit e llamcorper plvinar esras sit amet odio et dolor por bibendum sit amet neceros.</p>
                     
                    </div>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="service-block">
                <div class="service-img">
                    <a href="#"><img src="images/service-img-1.jpg" alt="Tour and Travel Agency - Responsive Website Template"></a>
                </div>
                <div class="service-content">
                    <h3><a href="#" class="title">Tour</a></h3>
                    <p>Scelerisque vitae velit e llamcorper plvinar esras sit amet odio et dolor por bibendum sit amet neceros.</p>
                  
                </div>
        </div>
          </div>
          <div class="swiper-slide">Slide 4</div>
          <div class="swiper-slide">Slide 5</div>
          <div class="swiper-slide">Slide 6</div>
          <div class="swiper-slide">Slide 7</div>
          <div class="swiper-slide">Slide 8</div>
          <div class="swiper-slide">Slide 9</div>
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
          slidesPerView: 3,
          spaceBetween: 30,
          slidesPerGroup: 3,
          loop: true,
          loopFillGroupWithBlank: true,
          pagination: {
            el: ".swiper-pagination",
            clickable: true,
          },
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
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
                        <h1>맛집 추천</h1>
                    </div>
                </div>
            </div>
            <div class="row">
               <!-- Swiper -->
    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <div class="service-block">
                <div class="service-img">
                    <a href="#"><img src="images/service-img-1.jpg" alt="Tour and Travel Agency - Responsive Website Template"></a>
                </div>
                <div class="service-content">
                    <h3><a href="#" class="title">Food</a></h3>
                    <p>Scelerisque vitae velit e llamcorper plvinar esras sit amet odio et dolor por bibendum sit amet neceros.</p>
                 
                </div>
            
        </div>
          </div>
          <div class="swiper-slide">
            <div class="service-block">
                <div class="service-img">
                    <a href="#"><img src="images/service-img-1.jpg" alt="Tour and Travel Agency - Responsive Website Template"></a>
                </div>
                <div class="service-content">
                    <h3><a href="#" class="title">Food</a></h3>
                    <p>Scelerisque vitae velit e llamcorper plvinar esras sit amet odio et dolor por bibendum sit amet neceros.</p>
                 
                </div>
            
        </div>
          </div>
          <div class="swiper-slide">
            <div class="service-block">
                <div class="service-img">
                    <a href="#"><img src="images/service-img-1.jpg" alt="Tour and Travel Agency - Responsive Website Template"></a>
                </div>
                <div class="service-content">
                    <h3><a href="#" class="title">Food</a></h3>
                    <p>Scelerisque vitae velit e llamcorper plvinar esras sit amet odio et dolor por bibendum sit amet neceros.</p>
                 
                </div>
            
        </div>
          </div>
          <div class="swiper-slide">Slide 4</div>
          <div class="swiper-slide">Slide 5</div>
          <div class="swiper-slide">Slide 6</div>
          <div class="swiper-slide">Slide 7</div>
          <div class="swiper-slide">Slide 8</div>
          <div class="swiper-slide">Slide 9</div>
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
          slidesPerView: 3,
          spaceBetween: 30,
          slidesPerGroup: 3,
          loop: true,
          loopFillGroupWithBlank: true,
          pagination: {
            el: ".swiper-pagination",
            clickable: true,
          },
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
        });
      </script>
            </div>
        </div>
    </div>
    <!-- service-section close -->

    
            
          
</body>