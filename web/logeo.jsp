<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Academia Isaac Newton</title>
  <link rel="shortcut icon" type="imagen/x-icon" href="recursos/flat-graduation-cap-128.ico"/>
  <link rel="stylesheet" type="text/css" href="css/estilos.css">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
</head>
<style type="text/css">
	<!--
	body {
	background: #E6E6E6
	}-->
</style>

<body>
    <div class="cabecera">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6">
                <font class="" face="Arial Black" size="10" color="#FFFFFF">Academia Isaac Newton</font>
            </div>
            <div class="col-xs-6 col-md-6">
           <form class="form-inline" action="validarUsuario" method="post">
              <div class="form-group">
                <label></label><br>
                <input type="text" class="form-control" name="usuario" placeholder="Usuario" value="">
              </div>
              <div class="form-group">
                <label></label><br>
                <input type="password" class="form-control" name="password" placeholder="Contraseña" value="">
              </div>
              <div class="form-group">
                <label></label><br>
                <input type="submit" class="btn btn-primary" value="Ingresar">
              </div><br>
            </form>
            </div>
        </div>
    </div>
    </div>
<div class="container-fluid">
    <div class="form-horizontal">
        <div class="row"> 
            <div class="col-xs-12 col-sm-3 col-md-3"></div>
               <div class="col-xs-12 col-sm-6 col-md-6 well"> 
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
            </div>
               <div class="col-xs-12 col-sm-3 col-md-3"></div>
        </div> 
      </div>   
</div>
    	<footer>
     <div class="pie">
     <marquee><font face="Broadway" size="4" color="FFFFF#">&copy; *** ENGINEERS   EXPLORERS ***</font></marquee>
     </div>
  	</footer>
  <script src="jquery/jquery-1.11.2.min.js"></script>
  <script src="bootstrap/js/bootstrap.js"></script>
</body>
</html>