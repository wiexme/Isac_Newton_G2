<%@page import="pro.modelo.entidad.Usuario"%>
<%@page import="pro.modelo.dao.impl.usuarioDaoImpl"%>
<%@page import="pro.modelo.dao.usuarioDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    usuarioDao dao = new usuarioDaoImpl();
    String estado = request.getParameter("estado"); estado=estado==null?"":estado;
    String opcion = request.getParameter("opcion"); opcion=opcion==null?"":opcion;
    String idUsuario1 = request.getParameter("idUsuario1"); idUsuario1=idUsuario1==null?"":idUsuario1;
    String mensaje = "";
    String alert = "";
    
    if(opcion.equals("delete")){
        if(dao.eliminarUsuario(idUsuario1)){ 
            mensaje = "Se elimino correctamente";
            alert = "success";
        }else{
            mensaje = "No se elimino correctamente";
            alert = "danger";
        }
    }
%>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-1 col-md-1"></div>
        <div class="col-xs-12 col-sm-10 col-md-10 well">
            <h1 class="text-center"><label>Lista de Usuarios</label></h1>
            <form action="lista_usuario.jsp">
                <table class="table table-striped">
                    <thead>
                        <tr class="info">
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Apellido Paterno</th>
                            <th>Apellido Materno</th>
                            <th>Usuario</th>
                            <th>Contraseña</th>
                            <th>Estado</th>
                            <th colspan="3">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int count = 0;
                        for(Usuario usuario : dao.listarUsuario()){ 
                            count++;
                        
                        %>
                        <tr>
                            <td><%=count%></td>
                            <td><%=usuario.getNombre()%></td>
                            <td><%=usuario.getApellidoPat()%></td>
                            <td><%=usuario.getApellidoMat()%></td>
                            <td><%=usuario.getLoggin()%></td>
                            <td><%=usuario.getPassword()%></td>
                            <td>
                                <label class="radio-inline">
                                <input type="radio" name="estado<%=count%>" value="1"<%if(usuario.getEstado().equals("1")){%> checked<%}%>>Activo
                                </label>
                                <label class="radio-inline">
                                <input type="radio" name="estado<%=count%>" value="0"<%if(usuario.getEstado().equals("0")){%> checked<%}%>>Inactivo
                                </label>
                            </td>
                            <td class="col-md-1"><a class="btn btn-primary" href="reg_persona.jsp"><span class="glyphicon glyphicon-pencil" title="Registrar"></span></a></td>
                            <td class="col-md-1"><a class="btn btn-success" href="inscripcionUsuario.jsp?buscarLogin=<%=usuario.getIdUsuario()%>&buscarUusuario=<%=usuario.getNumDocumento()%>&opcion=actualizar"><span class="glyphicon glyphicon-refresh" title="Modificar"></span></a></td>
                            <td class="col-md-1"><a class="btn btn-danger" href="lista_usuario.jsp?opcion=delete&idUsuario1=<%=usuario.getIdUsuario()%>"><span class="glyphicon glyphicon-trash" title="Eliminar"></span></a></td>
                        </tr>
                        <%}%>
                        <%
                           if(!mensaje.equals("")){
                        %>
                         <tr>
                             <td colspan="10" class="alert alert-<%=alert%>" align="center"><%=mensaje%></td>
                         </tr>
                        <%}%>
                    </tbody>
                </table>
            </form>
        </div>
        <div class="col-xs-12 col-sm-1 col-md-1"></div>
    </div>
</div>
<%@include file="WEB-INF/jspf/bottom.jspf"%>
