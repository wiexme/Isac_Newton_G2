<%@page import="pro.modelo.entidad.Alumno"%>
<%@page import="pro.modelo.dao.impl.alumnoDaoImpl"%>
<%@page import="pro.modelo.dao.alumnoDao"%>
<%@page import="pro.modelo.entidad.Persona"%>
<%@page import="pro.modelo.dao.personaDao"%>
<%@page import="pro.modelo.dao.impl.personaDaoImpl"%>
<%@page import="pro.modelo.entidad.TipoDocumento"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    personaDao daop = new personaDaoImpl();
    alumnoDao daoa = new alumnoDaoImpl();
    Persona persona = new Persona();
    Alumno alumno = new Alumno();
    String buscarAlumno = request.getParameter("buscarAlumno"); buscarAlumno=buscarAlumno==null?"":buscarAlumno;
    String idPersona = request.getParameter("idPersona"); idPersona=idPersona==null?"":idPersona;
    String nombre = request.getParameter("nombre"); nombre=nombre==null?"":nombre;
    String apellidoPat = request.getParameter("apellidoPat"); apellidoPat=apellidoPat==null?"":apellidoPat;
    String apellidoMat = request.getParameter("apellidoMat"); apellidoMat=apellidoMat==null?"":apellidoMat;
    String genero = request.getParameter("genero"); genero=genero==null?"":genero;
    String codigoAlumno = request.getParameter("codigoAlumno"); codigoAlumno=codigoAlumno==null?"":codigoAlumno;
    String opcion = request.getParameter("opcion"); opcion=opcion==null?"":opcion;
    String mensaje = "";
     if(!buscarAlumno.equals("")){
                persona = daop.buscarPersona(buscarAlumno);
                if(persona !=null){
                    idPersona = persona.getIdPersona();
                    nombre = persona.getNombre();
                    apellidoPat = persona.getApellidoPat();
                    apellidoMat = persona.getApellidoMat();
                    genero = persona.getGenero();
                }else{
                }
     }   
    if(opcion.equals("Registrar")){
        if(!codigoAlumno.equals("")){
          //alumno.setCodigoAlumno(codigoAlumno);
          if(daoa.inscribirAlumno(idPersona, codigoAlumno)){
              response.sendRedirect("matricula.jsp?buscarMatricula="+buscarAlumno+"&idPersona="+idPersona);
          }else{
               mensaje = "No se pudo registrar";
          }
        } 
    }          
                
    
%>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6 well">
            <h1 class="text-center"><label>INSCRIBIR ALUMNO</label></h1>
            <form action="inscripcionalumno.jsp">
                 <input type="hidden" name="codigoAlumno" class="form-control" placeholder="Codigo Alumno" value="<%=alumno.getCodigoAlumno()%>">
                <input type="hidden" name="idPersona" value="<%=idPersona%>" size="10">
                <input type="hidden" name="buscarAlumno" value="<%=buscarAlumno%>" size="10">
                <input type="hidden" name="opcion" value="Registrar" size="10">
                <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <td><lebel class="col-sm-12 control-label"><strong>Nombres</strong></lebel></td>
                            <td><div class="col-sm-15"><input type="text" name="nombre" class="form-control" placeholder="Nombres" readonly="true" value="<%=nombre%>"></div></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><lebel class="col-sm-12 control-label"><strong>Apellido Paterno</strong></lebel></td>
                            <td><div class="col-sm-15"><input type="text" name="apellidoPat" class="form-control" placeholder="Apellido Paterno" readonly="true" value="<%=apellidoPat%>"></div></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><lebel class="col-sm-12 control-label"><strong>Apellido Materno</strong></lebel></td>
                            <td><div class="col-sm-15"><input type="text" name="apellidoMat" class="form-control" placeholder="Apellido Materno" readonly="true" value="<%=apellidoMat%>"></div></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><lebel class="col-sm-12 control-label"><strong>Genero</strong></lebel></td>
                            <td>
                                <label class="radio-inline">
                                <input type="radio" name="genero" id="inlineRadio1" value="F"<%if(genero.equals("F")){%> checked<%}%>>Femenino
                                </label>
                                <label class="radio-inline">
                                <input type="radio" name="genero" id="inlineRadio2" value="M"<%if(genero.equals("M")){%> checked<%}%>>Masculino
                                </label>
                            </td>
                            <td></td>
                        </tr>
                        
                    
                           
                        <tr>
                            <td colspan="3" align="center"><input type="submit" class="btn btn-primary" value="Guardar"></td>
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
        </div>
        <div class="col-xs-12 col-sm-3 col-md-3"></div>  
    </div>
</div>
<%@include file="WEB-INF/jspf/bottom.jspf"%>
