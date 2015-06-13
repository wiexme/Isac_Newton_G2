<%@page import="pro.modelo.entidad.Turno"%>
<%@page import="pro.modelo.dao.turnoDao"%>
<%@page import="pro.modelo.dao.impl.turnoDaoImpl"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    turnoDao daot = new turnoDaoImpl();
    Turno turno = new Turno();
    String idTurno = request.getParameter("idTurno"); idTurno=idTurno==null?"":idTurno;
    String nombre = request.getParameter("nombre"); nombre=nombre==null?"":nombre;
    String estado = request.getParameter("estado"); estado=estado==null?"":estado;
    String opcion=request.getParameter("opcion"); opcion=opcion==null?"Guardar":opcion;
    String mensaje = "";
    String titulo = "";
    
        
     if(opcion.equals("Guardar")||opcion.equals("Actualizando")){
        titulo = "Registro de Turno";
        if(!nombre.equals("")){
            if(opcion.equals("Guardar")){
                turno.setIdTurno("");
                turno.setNombre(nombre);
                turno.setEstado(estado);
                if(daot.registrarTurno(turno)){
                    response.sendRedirect("lista_turno.jsp");
                }else{
                mensaje = "No se pudo registrar";
                }
            }
            if(opcion.equals("Actualizando")){
                turno.setIdTurno(idTurno);
                turno.setNombre(nombre);
                turno.setEstado(estado);
                if(daot.actualizarTurno(turno)){
                    response.sendRedirect("lista_turno.jsp");
                }else{
                mensaje = "No se pudo actualizar";
                }
            } 
        }
    }
    if(opcion.equals("Actualizar")){
            titulo = "Actualizar Datos";
            if(!idTurno.equals("")){
                    turno = daot.buscarTurno(idTurno);
                        idTurno = turno.getIdTurno();
                        nombre = turno.getNombre();
                        estado = turno.getEstado();
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
            <form action="reg_turno.jsp">
                <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <td><label class="col-sm-12 control-label">Nombre del Aula</label></td>
                            <input type="hidden" name="idTurno" value="<%=idTurno%>" size="10">
                            <td><div class="col-md-12"><input type="text" name="nombre" class="form-control" placeholder="Nombre del Turno" autofocus value="<%=nombre%>"></div></td>   
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
