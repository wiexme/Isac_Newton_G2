<%-- 
    Document   : registroUsuario
    Created on : 18/05/2015, 09:20:17 PM
    Author     : WIEXME
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
    </body>
</html>
