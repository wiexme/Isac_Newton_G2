<%@page import="pro.modelo.entidad.Curso"%>
<%@page import="pro.modelo.dao.cursoDao"%>
<%@page import="pro.modelo.dao.impl.cursoDaoImpl"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    cursoDao dao = new cursoDaoImpl();
    Curso curso = new Curso();
    String idCurso = request.getParameter("idCurso"); idCurso=idCurso==null?"":idCurso;
    String nombre = request.getParameter("nombre"); nombre=nombre==null?"":nombre;
    String hora_pedagogica=request.getParameter("hora_pedagogica");hora_pedagogica=hora_pedagogica==null?"":hora_pedagogica;
    String opcion=request.getParameter("opcion"); opcion=opcion==null?"Guardar":opcion;
    String mensaje = "";
    String titulo = "";

    if(opcion.equals("Guardar")||opcion.equals("Actualizando")){
        titulo = "Registrar Curso";  
        if(!nombre.equals("")){
            if(opcion.equals("Guardar")){
                curso.setIdCurso("");
                curso.setNombre(nombre);
                curso.setHoraPedagogica(hora_pedagogica);
                if(dao.registrarCurso(curso)){
                    response.sendRedirect("lista_curso.jsp");
                }else{
                mensaje = "No se pudo registrar";
                }
            }
            if(opcion.equals("Actualizando")){
                curso.setIdCurso(idCurso);
                curso.setNombre(nombre);
                curso.setHoraPedagogica(hora_pedagogica);
                if(dao.actualizarCurso(curso)){
                    response.sendRedirect("lista_curso.jsp");
                }else{
                mensaje = "No se pudo actualizar";
                }
            } 
        }
    }
    if(opcion.equals("Actualizar")){
        titulo = "Actualizar Datos";
            if(!idCurso.equals("")){
                    curso = dao.buscarCurso(idCurso);
                        idCurso = curso.getIdCurso();
                        nombre = curso.getNombre(); 
                        hora_pedagogica=curso.getHoraPedagogica();
                        opcion="Actualizando";
            }
        }  
        

%>
<div class="container-fluid">
    <%if(opcion.equals("Guardar")||opcion.equals("Actualizando")){%>
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6 well">
            <h1 class="text-center"><label><%=titulo%></label></h1>
            <form action="reg_curso.jsp">
                <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <td><label class="col-sm-12 control-label">Nombre del Curso</label></td>
                            <input type="hidden" name="idCurso" value="<%=idCurso%>" size="10">
                            <td><div class="col-md-12"><input type="text" name="nombre" class="form-control" placeholder="Nombre del Curso" autofocus value="<%=nombre%>"></div></td>
                        </tr>
                        <tr>
                            <td><label class="col-sm-12 control-label">Hora pedagogica</label></td>
                            <td><div class="col-md-12"><input type="text" name="hora_pedagogica" class="form-control" placeholder="Hora Pedagogica" value="<%=hora_pedagogica%>"></div></td>
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