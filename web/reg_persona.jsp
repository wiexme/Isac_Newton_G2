<%@page import="pro.modelo.entidad.Ubigeo"%>
<%@page import="pro.modelo.entidad.Persona"%>
<%@page import="pro.modelo.entidad.TipoDocumento"%>
<%@page import="pro.modelo.dao.impl.personaDaoImpl"%>
<%@page import="pro.modelo.dao.personaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
 personaDao dao = new personaDaoImpl();
 Persona per = new Persona();
 String idPersona = request.getParameter("idPersona"); idPersona=idPersona==null?"":idPersona;
 String nombre = request.getParameter("nombre"); nombre=nombre==null?"":nombre;
 String apellidoPat = request.getParameter("apellidoPat"); apellidoPat=apellidoPat==null?"":apellidoPat;
 String apellidoMat = request.getParameter("apellidoMat"); apellidoMat=apellidoMat==null?"":apellidoMat;
 String genero = request.getParameter("genero"); genero=genero==null?"":genero;
 String fechaNacimiento = request.getParameter("fechaNacimiento"); fechaNacimiento=fechaNacimiento==null?"":fechaNacimiento;
 String idtipodocumento = request.getParameter("idtipodocumento"); idtipodocumento=idtipodocumento==null?"":idtipodocumento;
 String numDocumento = request.getParameter("numDocumento"); numDocumento=numDocumento==null?"":numDocumento;
 String direccion = request.getParameter("direccion"); direccion=direccion==null?"":direccion;
 String telefono = request.getParameter("telefono"); telefono=telefono==null?"":telefono;
 String celular = request.getParameter("celular"); celular=celular==null?"":celular;
 String estadoCivil = request.getParameter("estadoCivil"); estadoCivil=estadoCivil==null?"":estadoCivil;
 String religion = request.getParameter("religion"); religion=religion==null?"":religion;
 String idUbigeo = request.getParameter("idUbigeo"); idUbigeo=idUbigeo==null?"":idUbigeo;
 String opcion = request.getParameter("opcion"); opcion=opcion==null?"Guardar":opcion;
 String mensaje = "";
 
 if(opcion.equals("Guardar")){
 if(!nombre.equals("") && !apellidoPat.equals("") && !apellidoMat.equals("") && !genero.equals("")){
     per.setNombre(nombre);
     per.setApellidoPat(apellidoPat);
     per.setApellidoMat(apellidoMat);
     per.setGenero(genero);
     per.setFechaNacimiento(fechaNacimiento);
     per.setIdTipoDocumento(idtipodocumento);
     per.setNumDocumento(numDocumento);
     per.setDireccion(direccion);
     per.setTelefono(telefono);
     per.setCelular(celular);
     per.setEstadoCivil(estadoCivil);
     per.setReligion(religion);
     per.setIdUbigeo(idUbigeo);
     opcion = "tipo";
     }
 else{
 
 }
 }
 
 if(opcion.equals("tipo")){
    if(dao.registrarPersona(per)){
           //response.sendRedirect("inscripcionalumno.jsp?buscarAlumno="+numDocumento+"&idPersona="+idPersona);
            //response.sendRedirect("inscripcionUsuario.jsp?buscarUusuario="+numDocumento);
            //response.sendRedirect("inscripcionDocente.jsp?buscarDocente="+numDocumento);
        }else{
        mensaje = "No se pudo registrar";
        }
  }
%>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6 well">
            <%if(opcion.equals("tipo")){%>           
            <h1 class="text-center"><strong>SELECCIONAR TIPO DE REGISTRO</strong></h1>
            <form action="reg_persona.jsp">
                <input type="hidden" name="opcion" value="tipo" size="10">
                <table align="center">
                    <tr>
                        <td><div class="col-sm-12"><a class="btn btn-success" role="button" href="inscripcionalumno.jsp?buscarAlumno=<%=numDocumento%>&idPersona=<%=idPersona%>">Alumno</a></div></td>
                        <td><div class="col-sm-12"><a class="btn btn-success" role="button" href="inscripcionUsuario.jsp?buscarUusuario=<%=numDocumento%>">Usuario</a></div></td>
                        <td><div class="col-sm-12"><a class="btn btn-success" role="button" href="inscripcionDocente.jsp?buscarDocente=<%=numDocumento%>">Docente</a></div></td>
                    </tr> 
                </table>
            </form>
            
            <%}%>
<%if(opcion.equals("Guardar")){%>            
<h1 class="text-center"><strong>REGISTRAR</strong></h1>
<form action="reg_persona.jsp"> 
<table class="table table-condensed">
<tbody>   
  <tr>
    <td><label class="col-sm-12 control-label">Nombres</label></td>
    <td><div class="col-sm-15"><input type="text" name="nombre" class="form-control" placeholder="Nombres" value="<%=nombre%>" autofocus></div></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Apellido Paterno</label></td>
    <td><div class="col-sm-15"><input type="text" name="apellidoPat" class="form-control" placeholder="Apellido Paterno" value="<%=apellidoPat%>"></div></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Apellido Materno</label></td>
    <td><div class="col-sm-15"><input type="text" name="apellidoMat" class="form-control" placeholder="Apellido Materno" value="<%=apellidoMat%>"></div></td>
  </tr>
  <tr>
      <td><label class="col-sm-12 control-label">Genero</label></td>
      <td><label class="radio-inline">
          <input type="radio" name="genero" id="inlineRadio1" value="F">Femenino
          </label>
      <label class="radio-inline">
          <input type="radio" name="genero" id="inlineRadio2" value="M">Masculino
          </label>
      </td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Fecha de Nacimiento</label></td>
    <td><div class="col-sm-15"><input type="date" name="fechaNacimiento" class="form-control" value="<%=fechaNacimiento%>"></div></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Tipo de Documento</label></td>
    <td><select name="idtipodocumento" class="form-control">
            <option>Seleccionar Documento</option>
            <%
                for(TipoDocumento tipoDocumento: dao.listarTipoDocumento()){
            %>
            <option value="<%=tipoDocumento.getIdTipodocumento()%>"><%=tipoDocumento.getNombre()%></option>
    <%}%>
    </select>
    </td>

  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Número de Documento</label></td>
    <td><div class="col-sm-15"><input type="text" name="numDocumento" class="form-control" placeholder="Número de Documento" value="<%=numDocumento%>"></div></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Dirección</label></td>
    <td><div class="col-sm-15"><input type="text" name="direccion" class="form-control" placeholder="Dirección" value="<%=direccion%>"></div></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Teléfono</label></td>
    <td><div class="col-sm-15"><input type="text" name="telefono" class="form-control" placeholder="Teléfono" value="<%=telefono%>"></div></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Celular</label></td>
    <td><div class="col-sm-15"><input type="text" name="celular" class="form-control" placeholder="Celular" value="<%=celular%>"></div></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Estado Civil</label></td>
    <td><select name="estadoCivil" class="form-control">
        <option>Seleccionar</option>
        <option value="S">Soltero</option>
        <option value="C">Casado</option>
        <option value="D">Divorciado</option>
    </select></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Religión</label></td>
    <td><div class="col-sm-15"><input type="text" name="religion" class="form-control" placeholder="Religión" value="<%=religion%>"></div></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Lugar de Procedencia</label></td>
    <td><select name="idUbigeo" class="form-control">
    <option>Seleccionar</option>
    <%
                
                for(Ubigeo ubigeo: dao.listarUbigeo()){
            %>
            <option value="<%=ubigeo.getIdUbigeo()%>"><%=ubigeo.getNombre()%></option>
    <%}%>
    </select></td>
  </tr>
  <tr>
      <td colspan="2" align="center"><input type="submit" class="btn btn-primary" name="opcion" value="<%=opcion%>"></td>
  </tr>
  <%
        if(!mensaje.equals("")){
  %>
  <tr>
  <td colspan="3" class="alert alert-danger" align="center"><%=mensaje%></td>
  </tr>
  <%}%>
</tbody>
</table>
</form> 
<%}%>
</div>
<div class="col-xs-12 col-sm-3 col-md-3"></div>
</div>
</div>
<%@include file="WEB-INF/jspf/bottom.jspf"%>