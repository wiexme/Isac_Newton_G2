<%@page import="pro.modelo.entidad.TipoDocumento"%>
<%@page import="pro.modelo.dao.tipoDocumentoDao"%>
<%@page import="pro.modelo.dao.impl.tipoDocumentoDaoImpl"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    tipoDocumentoDao dao = new tipoDocumentoDaoImpl();
    TipoDocumento td = new TipoDocumento();
    String idTipoDocumento = request.getParameter("idTipoDocumento"); idTipoDocumento=idTipoDocumento==null?"":idTipoDocumento;
    String nombre = request.getParameter("nombre"); nombre=nombre==null?"":nombre;
    String mensaje = "";
    String opcion=request.getParameter("opcion"); opcion=opcion==null?"Guardar":opcion;
    
    if(opcion.equals("Guardar")||opcion.equals("Actualizando")){
            
        if(!nombre.equals("")){
            if(opcion.equals("Guardar")){
                td.setNombre(nombre);
                td.setIdTipodocumento("");
                if(dao.registrarTipoDocumento(td)){
                    response.sendRedirect("lista_tipoDocumento.jsp");
                }else{
                mensaje = "No se pudo registrar";
                }
            }
            if(opcion.equals("Actualizando")){
                td.setIdTipodocumento(idTipoDocumento);
                td.setNombre(nombre);
                if(dao.actualizarTipoDocumento(td)){
                    response.sendRedirect("lista_tipoDocumento.jsp");
                }else{
                mensaje = "No se pudo actualizar";
                }
            } 
        }
    }
    if(opcion.equals("Actualizar")){
            if(!idTipoDocumento.equals("")){
                    td = dao.buscarTipoDocumento(idTipoDocumento);
                        idTipoDocumento = td.getIdTipodocumento();
                        nombre = td.getNombre(); 
                        opcion="Actualizando";
            }
        }  
        

%>
<div class="container-fluid">
    <%if(opcion.equals("Guardar")||opcion.equals("Actualizando")){%>
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6 well">
            <h1 class="text-center"><label>Registro de Tipo de Documentos</label></h1>
            <form action="reg_tipoDocumento.jsp">
                <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <td><label class="col-sm-12 control-label">Nombre del Documento</label></td>
                            <input type="hidden" name="idTipoDocumento" value="<%=idTipoDocumento%>" size="10">
                            <td><div class="col-md-12"><input type="text" name="nombre" class="form-control" placeholder="Nombre del Documento" autofocus value="<%=nombre%>"></div></td>
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
        </div>
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
    </div>
                        <%}%>
</div>
<%@include file="WEB-INF/jspf/bottom.jspf"%>