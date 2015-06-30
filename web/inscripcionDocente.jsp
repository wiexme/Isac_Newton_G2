<%@page import="pro.modelo.entidad.Usuario"%>
<%@page import="pro.modelo.dao.impl.usuarioDaoImpl"%>
<%@page import="pro.modelo.dao.usuarioDao"%>
<%@page import="pro.modelo.dao.impl.docenteDaoImpl"%>
<%@page import="pro.modelo.dao.docenteDao"%>
<%@page import="pro.modelo.entidad.Persona"%>
<%@page import="pro.modelo.dao.impl.personaDaoImpl"%>
<%@page import="pro.modelo.dao.personaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%  
    HttpSession session1 = request.getSession();
    String idU = (String)session1.getAttribute("idUsuario");
    if(idU == null){
        response.sendRedirect("alerta.jsp");
    }


    personaDao daop = new personaDaoImpl();
    docenteDao daod = new docenteDaoImpl();
    usuarioDao daou = new usuarioDaoImpl();
    Usuario usuario = new Usuario();
    Persona persona = new Persona();
    
    String idPersona = request.getParameter("idPersona"); idPersona=idPersona==null?"":idPersona;
    String nombre = request.getParameter("nombre"); nombre=nombre==null?"":nombre;
    String apellidoPat = request.getParameter("apellidoPat"); apellidoPat=apellidoPat==null?"":apellidoPat;
    String apellidoMat = request.getParameter("apellidoMat"); apellidoMat=apellidoMat==null?"":apellidoMat;
    String genero = request.getParameter("genero"); genero=genero==null?"":genero;
    String buscarDocente = request.getParameter("buscarDocente"); buscarDocente=buscarDocente==null?"":buscarDocente;
    String ocupacion = request.getParameter("ocupacion"); ocupacion=ocupacion==null?"":ocupacion;
    String opcion = request.getParameter("opcion"); opcion=opcion==null?"":opcion;
    String mensaje = "";
    out.println("Usuario: "+idUsuario);

    
     if(!buscarDocente.equals("")){
                persona = daop.buscarPersona(buscarDocente);
                if(persona !=null){
                    idPersona = persona.getIdPersona();
                    nombre = persona.getNombre();
                    apellidoPat = persona.getApellidoPat();
                    apellidoMat = persona.getApellidoMat();
                    genero = persona.getGenero();
                }else{   
                }
     }
     
     if(opcion.equals("inscribir")){    
      if(!ocupacion.equals("")){
          //alumno.setCodigoAlumno(codigoAlumno);
          if(daod.inscribirDocente(idPersona, idUsuario, ocupacion)){
              response.sendRedirect("inicio.jsp");
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
             <h1 class="text-center"><strong>INSCRIBIR DOCENTE</strong></h1>
             <form action="inscripcionDocente.jsp">
                 <input type="hidden" name="idPersona" value="<%=idPersona%>" size="10">
                 <input type="hidden" name="buscarDocente" value="<%=buscarDocente%>" size="10">
                 <input type="hidden" name="opcion" value="inscribir" size="10">
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
                            <td><lebel class="col-sm-12 control-label"><strong>Ocupación</strong></lebel></td>
                            <td><div class="col-sm-15"><input type="text" name="ocupacion" class="form-control" placeholder="Ocupación" value="<%=ocupacion%>" autofocus></div></td>
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