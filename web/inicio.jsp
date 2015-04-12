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
 <div class="carousel-inner" role="listbox">
    <div class="active item"><img class="first-slide" src="recursos/img1.jpg" alt="First slide"></div>
    <div class="item"><img class="second-slide"  src="recursos/img2.jpg" alt="Second slide"></div>
    <div class="item"><img class="third-slide" src="recursos/img3.jpg" alt="Third slide"></div>
  </div>
  <!-- Carousel nav -->
   <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
   </a>
   <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
   </a>
</div>
</section> 
<%@include file="WEB-INF/jspf/bottom.jspf"%>