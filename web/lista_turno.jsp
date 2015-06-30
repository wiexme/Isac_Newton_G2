<%@page import="pro.modelo.entidad.Turno"%>
<%@page import="pro.modelo.dao.impl.turnoDaoImpl"%>
<%@page import="pro.modelo.dao.turnoDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    turnoDao daot = new turnoDaoImpl();
    String opcion = request.getParameter("opcion"); opcion=opcion==null?"":opcion;
    String idTurno = request.getParameter("idTurno"); idTurno=idTurno==null?"":idTurno;
    String estado = request.getParameter("estado"); estado=estado==null?"":estado;
    String mensaje = "";
    String alert = "";
    
    if(opcion.equals("delete")){
        if(daot.eliminarTurno(idTurno)){ 
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
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6 well">
            <h1 class="text-center"><label>Lista de Turnos</label></h1>
            <form action="lista_turno.jsp">
                <table class="table table-striped">
                    <thead>
                        <tr class="info">
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Estado</th>
                            <th colspan="3">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int count = 0;
                        for(Turno t : daot.listarTurno()){ 
                            count++;
                        
                        %>
                        <tr>
                            <td><%=count%></td>
                            <td><%=t.getNombre()%></td>
                            <td>
                                <label class="radio-inline">
                                <input type="radio" name="estado<%=count%>" value="1"<%if(t.getEstado().equals("1")){%> checked<%}%>>Activo
                                </label>
                                <label class="radio-inline">
                                <input type="radio" name="estado<%=count%>" value="0"<%if(t.getEstado().equals("0")){%> checked<%}%>>Inactivo
                                </label>
                            </td>
                            <td class="col-md-1"><a class="btn btn-primary" href="reg_turno.jsp"><span class="glyphicon glyphicon-pencil" title="Registrar"></span></a></td>
                            <td class="col-md-1"><a class="btn btn-success" href="reg_turno.jsp?idTurno=<%=t.getIdTurno()%>&opcion=Actualizar"><span class="glyphicon glyphicon-refresh" title="Modificar"></span></a></td>
                            <td class="col-md-1"><a class="btn btn-danger" href="lista_turno.jsp?opcion=delete&idTurno=<%=t.getIdTurno()%>"><span class="glyphicon glyphicon-trash" title="Eliminar"></span></a></td>
                        </tr>
                        <%}%>
                        <%
                           if(!mensaje.equals("")){
                        %>
                         <tr>
                             <td colspan="7" class="alert alert-<%=alert%>" align="center"><%=mensaje%></td>
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
