<%@page import="pro.modelo.entidad.Ubigeo"%>
<%@page import="pro.modelo.entidad.Persona"%>
<%@page import="pro.modelo.entidad.TipoDocumento"%>
<%@page import="pro.modelo.dao.impl.personaDaoImpl"%>
<%@page import="pro.modelo.dao.personaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
 personaDao dao = new personaDaoImpl();
 
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
 String buscarPersona = request.getParameter("buscarPersona"); buscarPersona=buscarPersona==null?"":buscarPersona;
 String mensaje = "";

    
    Persona per = dao.buscarPersona(buscarPersona);

if(opcion.equals("Guardar")){
 if(!nombre.equals("") && !apellidoPat.equals("") && !apellidoMat.equals("") && !genero.equals("")){
     per.setIdPersona(idPersona);
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
      if(idPersona.equals("")){
    if(dao.registrarPersona(per)){
           //response.sendRedirect("inscripcionalumno.jsp?buscarAlumno="+numDocumento+"&idPersona="+idPersona);
            //response.sendRedirect("inscripcionUsuario.jsp?buscarUusuario="+numDocumento);
            //response.sendRedirect("inscripcionDocente.jsp?buscarDocente="+numDocumento);
        }else{
        mensaje = "No se pudo registrar";
        }
      }else{
         dao.actualizarPersona(per); 
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
                        <td><div class="col-sm-12"><a class="btn btn-success" role="button" href="inscripcionUsuario.jsp?buscarUusuario=<%=numDocumento%>&opcion=Guardar">Usuario</a></div></td>
                        <td><div class="col-sm-12"><a class="btn btn-success" role="button" href="inscripcionDocente.jsp?buscarDocente=<%=numDocumento%>">Docente</a></div></td>
                    </tr> 
                </table>
            </form>
            <%}%>
            <form action="reg_persona.jsp">
                <input type="hidden" name="idPersona" value="<%=idPersona%>" size="10">
                
                <table class="table table-condensed">
                    <tr>
                        <td class="col-md-12"><input type="text" class="form-control" placeholder="Ingresar DNI" name="buscarPersona" value=""></td>
                        <td><input type="submit" class="btn btn-info" value="Buscar"></td>
                    </tr>
                    <tr>
                        <td colspan="3"><%=mensaje%></td>
                    </tr>
                </table>
            </form>
<%if(opcion.equals("Guardar")){%>            
<h1 class="text-center"><strong>REGISTRAR</strong></h1>
<form action="reg_persona.jsp"> 
     <input type="hidden" name="idPersona" value="<%=per.getIdPersona()%>" size="10">
<table class="table table-condensed">
<tbody>   
  <tr>
    <td><label class="col-sm-12 control-label">Nombres</label></td>
    <td><div class="col-sm-15"><input type="text" name="nombre" class="form-control" placeholder="Nombres" value="<%=per.getNombre()%>" autofocus required></div></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Apellido Paterno</label></td>
    <td><div class="col-sm-15"><input type="text" name="apellidoPat" class="form-control" placeholder="Apellido Paterno" value="<%=per.getApellidoPat()%>" required></div></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Apellido Materno</label></td>
    <td><div class="col-sm-15"><input type="text" name="apellidoMat" class="form-control" placeholder="Apellido Materno" value="<%=per.getApellidoMat()%>" required></div></td>
  </tr>
  <tr>
      <td><label class="col-sm-12 control-label">Genero</label></td>
      <td><label class="radio-inline">
          <input type="radio" name="genero" id="inlineRadio1" value="F"<%if(per.getGenero().equals("F")){%> checked<%}%>>Femenino
          </label>
      <label class="radio-inline">
          <input type="radio" name="genero" id="inlineRadio2" value="M"<%if(per.getGenero().equals("M")){%> checked<%}%>>Masculino
          </label>
      </td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Fecha de Nacimiento</label></td>
    <td><div class="col-sm-15"><input type="date" name="fechaNacimiento" class="form-control" value="<%=per.getFechaNacimiento()%>" required></div></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Tipo de Documento</label></td>
    <td><select name="idtipodocumento" class="form-control">
            <%
                                  TipoDocumento    td  = new personaDaoImpl().editarTipoDocumento(per.getIdTipoDocumento());
                                   if(td.getIdTipodocumento()==null){
                                %>   
                                 <option>Seleccionar Documento</option>
                                 
                                 <%   
                                   }else{
                                       %>
                                      <option value="<%=td.getIdTipodocumento()%>"><%=td.getNombre()%></option>
                                     <%
                                       }
            
                for(TipoDocumento tipoDocumento: dao.listarTipoDocumento()){
            %>
            <option value="<%=tipoDocumento.getIdTipodocumento()%>"><%=tipoDocumento.getNombre()%></option>
    <%}%>
    </select>
    </td>

  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">N�mero de Documento</label></td>
    <td><div class="col-sm-15"><input type="text" name="numDocumento" class="form-control" placeholder="N�mero de Documento" value="<%=per.getNumDocumento()%>" required></div></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Direcci�n</label></td>
    <td><div class="col-sm-15"><input type="text" name="direccion" class="form-control" placeholder="Direcci�n" value="<%=per.getDireccion()%>" required></div></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Tel�fono</label></td>
    <td><div class="col-sm-15"><input type="text" name="telefono" class="form-control" placeholder="Tel�fono" value="<%=per.getTelefono()%>" required></div></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Celular</label></td>
    <td><div class="col-sm-15"><input type="text" name="celular" class="form-control" placeholder="Celular" value="<%=per.getCelular()%>" required></div></td>
  </tr>
  <tr>
      <td><label class="col-sm-12 control-label">Estado Civil</label></td>
      <td><label class="radio-inline">
          <input type="radio" name="estadoCivil" id="inlineRadio1" value="S"<%if(per.getEstadoCivil().equals("S")){%> checked<%}%>>Soltero(a)
          </label>
      <label class="radio-inline">
          <input type="radio" name="estadoCivil" id="inlineRadio2" value="C"<%if(per.getEstadoCivil().equals("C")){%> checked<%}%>>Casado(a)
          </label>
      <label class="radio-inline">
          <input type="radio" name="estadoCivil" id="inlineRadio2" value="D"<%if(per.getEstadoCivil().equals("D")){%> checked<%}%>>Divorciado(a)
          </label>
      </td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Religi�n</label></td>
    <td><div class="col-sm-15"><input type="text" name="religion" class="form-control" placeholder="Religi�n" value="<%=per.getReligion()%>" required></div></td>
  </tr>
  <tr>
    <td><label class="col-sm-12 control-label">Lugar de Procedencia</label></td>
    <td><select name="idUbigeo" class="form-control">
    
    <%
    
     Ubigeo    ubigeo1  = new personaDaoImpl().editarUbigeo(per.getIdUbigeo());
                                   if(ubigeo1.getIdUbigeo()==null){
                                %>   
                                 <option>Seleccionar</option>
                                 
                                 <%   
                                   }else{
                                       %>
                                      <option value="<%=ubigeo1.getIdUbigeo()%>"><%=ubigeo1.getNombre()%></option>
                                     <%
                                   }
                
                for(Ubigeo ubigeo: dao.listarUbigeo()){
            %>
            <option value="<%=ubigeo.getIdUbigeo()%>"><%=ubigeo.getNombre()%></option>
    <%}%>
    </select></td>
  </tr>
  <tr>
      <td colspan="2" align="center"><input type="submit" class="btn btn-info" name="opcion" value="<%=opcion%>"></td>
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