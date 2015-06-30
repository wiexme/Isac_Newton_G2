<%@page import="pro.modelo.dao.impl.aulaDaoImpl"%>
<%@page import="pro.modelo.entidad.Aula"%>
<%@page import="pro.modelo.dao.aulaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    aulaDao daoa = new aulaDaoImpl();
    Aula aula = new Aula();
    String idAula = request.getParameter("idAula"); idAula=idAula==null?"":idAula;
    String nombre = request.getParameter("nombre"); nombre=nombre==null?"":nombre;
    String descripcion = request.getParameter("descripcion"); descripcion=descripcion==null?"":descripcion;
    String estado = request.getParameter("estado"); estado=estado==null?"":estado;
    String mensaje = "";
    String titulo = "";
    String opcion=request.getParameter("opcion"); opcion=opcion==null?"Guardar":opcion;
    
     if(opcion.equals("Guardar")||opcion.equals("Actualizando")){
        titulo = "Registro de Aulas";
        if(!nombre.equals("")){
            if(opcion.equals("Guardar")){
                aula.setIdAula("");
                aula.setNombre(nombre);
                aula.setDescripcion(descripcion);
                aula.setEstado(estado);
                if(daoa.registrarAula(aula)){
                    response.sendRedirect("lista_aula.jsp");
                }else{
                mensaje = "No se pudo registrar";
                }
            }
            if(opcion.equals("Actualizando")){
                aula.setIdAula(idAula);
                aula.setNombre(nombre);
                aula.setDescripcion(descripcion);
                aula.setEstado(estado);
                if(daoa.actualizarAula(aula)){
                    response.sendRedirect("lista_aula.jsp");
                }else{
                mensaje = "No se pudo actualizar";
                }
            } 
        }
    }
    if(opcion.equals("Actualizar")){
            titulo = "Actualizar Datos";
            if(!idAula.equals("")){
                    aula = daoa.buscarAula(idAula);
                        idAula = aula.getIdAula();
                        nombre = aula.getNombre();
                        descripcion = aula.getDescripcion();
                        estado = aula.getEstado();
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
            <form action="reg_aula.jsp"> 
                <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <td><label class="col-sm-12 control-label">Nombre del Aula</label></td>
                            <input type="hidden" name="idAula" value="<%=idAula%>" size="10">
                            <td><div class="col-md-12"><input type="text" name="nombre" class="form-control" placeholder="Nombre del Aula" autofocus value="<%=nombre%>"></div></td>   
                        </tr>
                        <tr>
                            <td><label class="col-sm-12 control-label">Descripción</label></td>    
                            <td><textarea class="form-control" name="descripcion" value="<%=descripcion%>"><%=descripcion%></textarea></td>
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