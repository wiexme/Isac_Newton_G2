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
            <form class="form-inline" action="inicio.jsp">
              <div class="form-group">
                <label></label><br>
                <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Usuario">
              </div>
              <div class="form-group">
                <label></label><br>
                <input type="password" class="form-control" id="exampleInputPassword3" placeholder="Contraseña">
              </div>
              <div class="form-group">
                <label></label><br>
                <input type="submit" class="btn btn-primary" value="Ingresar">
              </div><br>
              <div class="checkbox">
                <label>
                    <input type="checkbox"> <font color="#FFFFFFF">No cerrar sesión</font>
                </label>
              </div>
            </form>
            </div>
        </div>
    </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6">
               <div class="container">
                  <div class="form-horizontal">
                  <div class="form-group">
                  <label class="col-lg-1"></label>
                  <div class="col-sm-6">      
                  <div class="well well-small">
                  <div class="row">  
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
                  </div> 
                  </div>
                  </div>
                  </div> 
                  </div> 
            </div>
            <div class="col-xs-6 col-md-6">
                <div class="logeo">
                    <font size="6">¿ERES NUEVO EN EL SISTEMA? REGÍSTRATE</font>
                </div>
                <form class="form-horizontal" action="inicio.jsp">
                    <div class="form-group">
                    <label class="col-sm-5 control-label">Nombres</label>
                    <div class="col-sm-5">
                      <input type="text" class="form-control" placeholder="Nombres">
                    </div>
                    </div>
                    <div class="form-group">
                    <label class="col-sm-5 control-label">Apellido Paterno</label>
                    <div class="col-sm-5">
                      <input type="text" class="form-control" placeholder="Apellido Paterno">
                    </div>
                    </div>
                    <div class="form-group">
                    <label class="col-sm-5 control-label">Apellido Materno</label>
                    <div class="col-sm-5">
                      <input type="text" class="form-control" placeholder="Apellido Materno">
                    </div>
                    </div>
                    <div class="form-group">
                    <label class="col-sm-5 control-label">Genero</label>
                    <div class="checkbox">
                        <div class="col-sm-5">
                            <label>Masculino</label>
                            <input type="radio" class="radio-inline" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                            <label>Femenino</label>
                            <input type="radio" class="radio-inline" name="inlineRadioOptions" id="inlineRadio1" value="option2">
                        </div>
                    </div>
                    </div>
                    <div class="form-group">
                    <label for="inputEmail3" class="col-sm-5 control-label">Usuario</label>
                    <div class="col-sm-5">
                      <input type="text" class="form-control" id="inputEmail3" placeholder="Usuario">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputPassword3" class="col-sm-5 control-label">Contraseña</label>
                    <div class="col-sm-5">
                      <input type="password" class="form-control" id="inputPassword3" placeholder="Contraseña">
                    </div>
                  </div>
                    <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10 col-md-offset-5">
                      <button href="inicio.jsp" type="submit" class="btn btn-success">Regístrate</button>
                    </div>
                  </div>
                </form>
            </div>
        </div>   
    </div>
    
  <script src="jquery/jquery-1.11.2.min.js"></script>
  <script src="bootstrap/js/bootstrap.js"></script>
</body>
</html>