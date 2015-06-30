<%@page import="pro.modelo.entidad.Usuario"%>
<%@page import="pro.modelo.dao.impl.usuarioDaoImpl"%>
<%@page import="pro.modelo.dao.usuarioDao"%>
<%@page import="pro.modelo.entidad.Persona"%>
<%@page import="pro.modelo.dao.impl.personaDaoImpl"%>
<%@page import="pro.modelo.dao.personaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%  
    personaDao daop = new personaDaoImpl();
    usuarioDao daou = new usuarioDaoImpl();
    Persona persona = new Persona();
    Usuario usuario = new Usuario();
    String idPersona = request.getParameter("idPersona"); idPersona=idPersona==null?"":idPersona;
    String buscarLogin = request.getParameter("buscarLogin"); buscarLogin=buscarLogin==null?"":buscarLogin;
    String nombre = request.getParameter("nombre"); nombre=nombre==null?"":nombre;
    String apellidoPat = request.getParameter("apellidoPat"); apellidoPat=apellidoPat==null?"":apellidoPat;
    String apellidoMat = request.getParameter("apellidoMat"); apellidoMat=apellidoMat==null?"":apellidoMat;
    String genero = request.getParameter("genero"); genero=genero==null?"":genero;
    String login = request.getParameter("login"); login=login==null?"":login;
    String password = request.getParameter("password"); password=password==null?"":password;
    String estado = request.getParameter("estado"); estado=estado==null?"":estado;
    String buscarUusuario = request.getParameter("buscarUusuario"); buscarUusuario=buscarUusuario==null?"":buscarUusuario;
    String opcion = request.getParameter("opcion"); opcion=opcion==null?"":opcion;
    String mensaje = "";
    
    if(opcion.equals("actualizar")){
    if(!buscarLogin.equals("")){
                usuario = daou.buscarUsuario(buscarLogin);
                if(usuario !=null){
                    login = usuario.getLoggin();
                    password = usuario.getPassword();
                    opcion = "actualizando";
                }else{   
                }
     }
    }
    if(opcion.equals("actualizando")){
        
          usuario.setIdUsuario(idPersona);
          usuario.setLoggin(login);
          usuario.setPassword(buscarUusuario);
          usuario.setEstado(estado);
         daou.actualizarUsuario(usuario);
    }
    
    if(!buscarUusuario.equals("")){
                persona = daop.buscarPersona(buscarUusuario);
                if(persona !=null){
                    idPersona = persona.getIdPersona();
                    nombre = persona.getNombre();
                    apellidoPat = persona.getApellidoPat();
                    apellidoMat = persona.getApellidoMat();
                    genero = persona.getGenero();
                }else{   
                }
     }
    
    if(opcion.equals("Guardar")){    
      if(!login.equals("") && !password.equals("")){
          if(daou.inscribirUsuario(idPersona, login, password)){
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
             <h1 class="text-center"><strong>INSCRIBIR USUARIO</strong></h1>
             <form action="inscripcionUsuario.jsp">
                 <input type="hidden" name="idPersona" value="<%=idPersona%>" size="10">
                 <input type="hidden" name="buscarUusuario" value="<%=buscarUusuario%>" size="10">
                 <input type="hidden" name="opcion" value="Guardar" size="10">
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
                            <td><lebel class="col-sm-12 control-label"><strong>Usuario</strong></lebel></td>
                            <td><div class="col-sm-15"><input type="text" name="login" class="form-control" placeholder="Usuario" value="<%=login%>"></div></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><lebel class="col-sm-12 control-label"><strong>Contraseña</strong></lebel></td>
                            <td><div class="col-sm-15"><input type="password" name="password" class="form-control" placeholder="Contraseña" value="<%=buscarUusuario%>"></div></td>
                            <td></td>
                        </tr>
                         <%if(opcion.equals("Actualizando")){%>
                         <tr>
                            <td><label class="col-sm-12 control-label">Estado</label></td>
                            <td><label class="radio-inline">
                                <input type="radio" name="estado" value="1"<%if(estado.equals("1")){%> checked<%}%>>Activo
                                </label>
                            <label class="radio-inline">
                                <input type="radio" name="estado" value="0"<%if(estado.equals("0")){%> checked<%}%>>Inactivo
                                </label>
                            </td>
                        </tr>
                        <%}%>
                        <tr>
                            <td colspan="3" align="center"><input type="submit" class="btn btn-primary" value="<%=opcion%>"></td>
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