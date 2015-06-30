<%@page import="pro.modelo.entidad.Aula"%>
<%@page import="pro.modelo.dao.aulaDao"%>
<%@page import="pro.modelo.dao.impl.aulaDaoImpl"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    aulaDao daoa = new aulaDaoImpl();
    String opcion = request.getParameter("opcion"); opcion=opcion==null?"":opcion;
    String idAula = request.getParameter("idAula"); idAula=idAula==null?"":idAula;
    String estado = request.getParameter("estado"); estado=estado==null?"":estado;
    String mensaje = "";
    String alert = "";
    
    if(opcion.equals("delete")){
        if(daoa.eliminarAula(idAula)){ 
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
            <h1 class="text-center"><label>Lista de Aulas</label></h1>
            <form action="lista_aula.jsp">
                <table class="table table-striped">
                    <thead>
                        <tr class="info">
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Estado</th>
                            <th colspan="3">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int count = 0;
                        for(Aula al : daoa.listarAula()){ 
                            count++;
                        
                        %>
                        <tr>
                            <td><%=count%></td>
                            <td><%=al.getNombre()%></td>
                            <td><%=al.getDescripcion()%></td>
                            <td>
                                <label class="radio-inline">
                                <input type="radio" name="estado<%=count%>" value="1"<%if(al.getEstado().equals("1")){%> checked<%}%>>Activo
                                </label>
                                <label class="radio-inline">
                                <input type="radio" name="estado<%=count%>" value="0"<%if(al.getEstado().equals("0")){%> checked<%}%>>Inactivo
                                </label>
                            </td>
                            <td class="col-md-1"><a class="btn btn-primary" href="reg_aula.jsp"><span class="glyphicon glyphicon-pencil" title="Registrar"></span></a></td>
                            <td class="col-md-1"><a class="btn btn-success" href="reg_aula.jsp?idAula=<%=al.getIdAula()%>&opcion=Actualizar"><span class="glyphicon glyphicon-refresh" title="Modificar"></span></a></td>
                            <td class="col-md-1"><a class="btn btn-danger" href="lista_aula.jsp?opcion=delete&idAula=<%=al.getIdAula()%>"><span class="glyphicon glyphicon-trash" title="Eliminar"></span></a></td>
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
        <div class="col-xs-12 col-sm-1 col-md-1"></div>

    </div>
</div>
<%@include file="WEB-INF/jspf/bottom.jspf"%>
