<%@page import="pro.modelo.dao.campanaDao"%>
<%@page import="pro.modelo.dao.impl.campanaDaoImpl"%>
<%@page import="pro.modelo.entidad.Campana"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    campanaDao daoc = new campanaDaoImpl();
    String opcion = request.getParameter("opcion"); opcion=opcion==null?"":opcion;
    String idCampana = request.getParameter("idCampana"); idCampana=idCampana==null?"":idCampana;
    String estado = request.getParameter("estado"); estado=estado==null?"":estado;
    String mensaje = "";
    String alert = "";
    
    if(opcion.equals("delete")){
        if(daoc.eliminarCampana(idCampana)){ 
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
            <h1 class="text-center"><label>Lista de Campañas</label></h1>
            <form action="lista_campana.jsp">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Semestre</th>
                            <th>Fecha Inicio</th>
                            <th>Fecha Fin</th>
                            <th>Estado</th>
                            <th colspan="3">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int count = 0;
                        for(Campana campana : daoc.listarCampana()){ 
                            count++;
                        
                        %>
                        <tr>
                            <td><%=count%></td>
                            <td><%=campana.getNombre()%></td>
                            <td><%=campana.getSemestre()%></td>
                            <td><%=campana.getFechaInicio()%></td>
                            <td><%=campana.getFechaFin()%></td>
                            <td>
                                <label class="radio-inline">
                                <input type="radio" name="estado<%=count%>" value="1"<%if(campana.getEstado().equals("1")){%> checked<%}%>>Activo
                                </label>
                                <label class="radio-inline">
                                <input type="radio" name="estado<%=count%>" value="0"<%if(campana.getEstado().equals("0")){%> checked<%}%>>Inactivo
                                </label>
                            </td>
                            <td class="col-md-1"><a class="btn btn-primary" href="reg_campana.jsp"><span class="glyphicon glyphicon-pencil" title="Registrar"></span></a></td>
                            <td class="col-md-1"><a class="btn btn-success" href="reg_campana.jsp?idCampana=<%=campana.getIdCampana()%>&opcion=Actualizar"><span class="glyphicon glyphicon-refresh" title="Modificar"></span></a></td>
                            <td class="col-md-1"><a class="btn btn-danger" href="lista_campana.jsp?opcion=delete&idCampana=<%=campana.getIdCampana()%>"><span class="glyphicon glyphicon-trash" title="Eliminar"></span></a></td>
                        </tr>
                        <%}%>
                        <%
                           if(!mensaje.equals("")){
                        %>
                         <tr>
                             <td colspan="9" class="alert alert-<%=alert%>" align="center"><%=mensaje%></td>
                         </tr>
                        <%}%>
                    </tbody>
                </table>
            </form>
        </div>
        <div class="col-xs-12 col-sm-10 col-md-10"></div>
    </div>
</div>
<%@include file="WEB-INF/jspf/bottom.jspf"%>
