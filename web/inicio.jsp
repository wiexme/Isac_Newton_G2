<%@include file="WEB-INF/jspf/top.jspf"%>
<section>
  <div class="container">
    <header>
      <div class="container cabecera2">
            <font face="Arial" size="5">BIENVENIDOS AL SISTEMA</font>
      </div>
    </header>
  </div>
<div id="myCarousel" class="carousel slide">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <!-- Carousel items -->
  <div class="carousel-inner">
    <div class="active item"><img src="recursos/fer1.jpg"></div>
    <div class="item"><img src="recursos/fer2.jpg"></div>
    <div class="item"><img src="recursos/fer3.jpg"></div>
  </div>
  <!-- Carousel nav -->
  <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
  <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div>
</section> 
<%@include file="WEB-INF/jspf/bottom.jspf"%>