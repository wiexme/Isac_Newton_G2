<%@page import="pro.modelo.entidad.Curso"%>
<%@page import="pro.modelo.dao.impl.cursoDaoImpl"%>
<%@page import="pro.modelo.dao.cursoDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    cursoDao dao = new cursoDaoImpl();
    Curso tpd = new Curso();
    String opcion = request.getParameter("opcion"); opcion=opcion==null?"":opcion;
    String idCurso = request.getParameter("idCurso"); idCurso=idCurso==null?"":idCurso;
    String mensaje = "";
    String alert = "";
    
    if(opcion.equals("delete")){
        if(dao.eliminarCurso(idCurso)){ 
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
            <form action="lista_curso.jsp">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th colspan="3">Acciones</th>
                        </tr>
                        <tr>
                            <th>#</th>
                            <th>Hora_Pedagogica</th>
                            <th colspan="3">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int count = 0;
                        for(Curso tipo : dao.listarCurso()){ 
                            count++;
                        
                        %>
                        <tr>
                            <td><%=count%></td>
                            <td><%=tipo.getNombre()%></td>
                            <td class="col-md-1"><a class="btn btn-primary" href="reg_curso.jsp"><span class="glyphicon glyphicon-pencil" title="Registrar"></span></a></td>
                            <td class="col-md-1"><a class="btn btn-success" href="reg_curso.jsp?id=<%=tipo.getIdCurso() %>&opcion=Actualizar"><span class="glyphicon glyphicon-refresh" title="Modificar"></span></a></td>
                            <td class="col-md-1"><a class="btn btn-danger" href="lista_curso.jsp?opcion=delete&idCurso=<%=tipo.getIdCurso() %>"><span class="glyphicon glyphicon-trash" title="Eliminar"></span></a></td> 
                        </tr>
                        <tr>
                            <td><%=count%></td>
                            <td><%=tipo.getHoraPedagogica() %></td>
                            <td class="col-md-1"><a class="btn btn-primary" href="reg_curso.jsp"><span class="glyphicon glyphicon-pencil" title="Registrar"></span></a></td>
                            <td class="col-md-1"><a class="btn btn-success" href="reg_curso.jsp?id=<%=tipo.getIdCurso() %>&opcion=Actualizar"><span class="glyphicon glyphicon-refresh" title="Modificar"></span></a></td>
                            <td class="col-md-1"><a class="btn btn-danger" href="lista_curso.jsp?opcion=delete&idCurso=<%=tipo.getIdCurso() %>"><span class="glyphicon glyphicon-trash" title="Eliminar"></span></a></td> 
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
