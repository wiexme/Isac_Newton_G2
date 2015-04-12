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
	background: url(recursos/fondo.jpg) center fixed no-repeat
	}-->
	</style>
<body>
    <section>
    <form class="form-horizontal" action="inicio.jsp">
    <div class="logeo">INGRESA AL SISTEMA</div>
    <div class="form-group">
    <label for="inputEmail3" class="col-sm-5 control-label">Email</label>
    <div class="col-sm-3">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-5 control-label">Password</label>
    <div class="col-sm-3">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10 col-md-offset-5">
      <div class="checkbox">
        <label>
          <input type="checkbox"> Recuérdame
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10 col-md-offset-5">
      <button href="#" type="submit" class="btn btn-primary">Ingresar</button>
    </div>
  </div>
 </form>
 </section>
 <section>  
    <form class="form-horizontal" action="alertas.jsp">
    <div class="logeo">¿ERES NUEVO EN EL SISTEMA? REGÍSTRATE</div>
    <div class="form-group">
    <label class="col-sm-5 control-label">Nombre</label>
    <div class="col-sm-3">
      <input type="text" class="form-control" placeholder="Nombre">
    </div>
    </div>
    <div class="form-group">
    <label for="inputEmail3" class="col-sm-5 control-label">Email</label>
    <div class="col-sm-3">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-5 control-label">Password</label>
    <div class="col-sm-3">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
    <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10 col-md-offset-5">
      <button href="alertas.jsp" type="submit" class="btn btn-success">Regístrate</button>
    </div>
  </div>
 </form>
 </section>
  <script src="jquery/jquery-1.11.2.min.js"></script>
  <script src="bootstrap/js/bootstrap.js"></script>
</body>
</html>