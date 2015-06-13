<%@page import="pro.modelo.entidad.TipoDocumento"%>
<%@page import="pro.modelo.dao.impl.tipoDocumentoDaoImpl"%>
<%@page import="pro.modelo.dao.tipoDocumentoDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    tipoDocumentoDao dao = new tipoDocumentoDaoImpl();
    TipoDocumento tpd = new TipoDocumento();
    String opcion = request.getParameter("opcion"); opcion=opcion==null?"":opcion;
    String idTipoDocumento = request.getParameter("idTipoDocumento"); idTipoDocumento=idTipoDocumento==null?"":idTipoDocumento;
    String mensaje = "";
    String alert = "";
    
    if(opcion.equals("delete")){
        if(dao.eliminarTipoDocumento(idTipoDocumento)){ 
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
            <h1 class="text-center"><label>Lista de Tipo de Documentos</label></h1>
            <form action="lista_tipoDocumento.jsp">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th colspan="3">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int count = 0;
                        for(TipoDocumento tipo : dao.listarTipoDocumento()){ 
                            count++;
                        
                        %>
                        <tr>
                            <td><%=count%></td>
                            <td><%=tipo.getNombre()%></td>
                            <td class="col-md-1"><a class="btn btn-primary" href="reg_tipoDocumento.jsp"><span class="glyphicon glyphicon-pencil" title="Registrar"></span></a></td>
                            <td class="col-md-1"><a class="btn btn-success" href="reg_tipoDocumento.jsp?idTipoDocumento=<%=tipo.getIdTipodocumento()%>&opcion=Actualizar"><span class="glyphicon glyphicon-refresh" title="Modificar"></span></a></td>
                            <td class="col-md-1"><a class="btn btn-danger" href="lista_tipoDocumento.jsp?opcion=delete&idTipoDocumento=<%=tipo.getIdTipodocumento()%>"><span class="glyphicon glyphicon-trash" title="Eliminar"></span></a></td>
                        </tr>
                        <%}%>
                        <%
                           if(!mensaje.equals("")){
                        %>
                         <tr>
                             <td colspan="5" class="alert alert-<%=alert%>" align="center"><%=mensaje%></td>
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
