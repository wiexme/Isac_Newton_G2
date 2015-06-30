<%@page import="java.sql.Date"%>
<%@page import="pro.modelo.entidad.Campana"%>
<%@page import="pro.modelo.dao.campanaDao"%>
<%@page import="pro.modelo.dao.impl.campanaDaoImpl"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    campanaDao daoc = new campanaDaoImpl();
    Campana campana = new Campana();
    String idCampana = request.getParameter("idCampana"); idCampana=idCampana==null?"":idCampana;
    String nombre = request.getParameter("nombre"); nombre=nombre==null?"":nombre;
    String semestre = request.getParameter("semestre"); semestre=semestre==null?"":semestre;
    String fechaInicio = request.getParameter("fechaInicio"); fechaInicio=fechaInicio==null?"":fechaInicio;
    String fechaFin = request.getParameter("fechaFin"); fechaFin=fechaFin==null?"":fechaFin;
    String estado = request.getParameter("estado"); estado=estado==null?"":estado;
    String opcion=request.getParameter("opcion"); opcion=opcion==null?"Guardar":opcion;
    String mensaje = "";
    String titulo = "";
    
    
    
    if(opcion.equals("Guardar")||opcion.equals("Actualizando")){
        titulo = "Registro de Campañas";
        if(!nombre.equals("")){
            if(opcion.equals("Guardar")){
                campana.setIdCampana("");
                campana.setNombre(nombre);
                campana.setSemestre(semestre);
                campana.setFechaInicio(Date.valueOf(fechaInicio));
                campana.setFechaFin(Date.valueOf(fechaFin));
                campana.setEstado(estado);  
                if(daoc.registrarAula(campana)){
                    response.sendRedirect("lista_campana.jsp");
                }else{
                mensaje = "No se pudo registrar";
                }
            }
            if(opcion.equals("Actualizando")){
                campana.setIdCampana(idCampana);
                campana.setNombre(nombre);
                campana.setSemestre(semestre);
                campana.setFechaInicio(Date.valueOf(fechaInicio));
                campana.setFechaFin(Date.valueOf(fechaFin));
                campana.setEstado(estado);
                if(daoc.actualizarCampana(campana)){
                    response.sendRedirect("lista_campana.jsp");
                }else{
                mensaje = "No se pudo actualizar";
                }
            } 
        }
    }
    if(opcion.equals("Actualizar")){
            titulo = "Actualizar Datos";
            if(!campana.equals("")){
                    campana = daoc.buscarCampana(idCampana);
                        idCampana = campana.getIdCampana();
                        nombre = campana.getNombre();
                        semestre = campana.getSemestre();
                        fechaInicio = String.valueOf(campana.getFechaInicio());
                        fechaFin = String.valueOf(campana.getFechaFin());
                        estado = campana.getEstado();
                        opcion="Actualizando";
            }
        }  
%>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6 well">
            <h1 class="text-center"><label><%=titulo%></label></h1>
            <form action="reg_campana.jsp">
                <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <td><label class="col-sm-12 control-label">Nombre</label></td>
                            <input type="hidden" name="idCampana" value="<%=idCampana%>" size="10">
                            <td><div class="col-md-12"><input type="text" name="nombre" class="form-control" placeholder="Nombre de la Campaña" autofocus value="<%=nombre%>"></div></td>   
                        </tr>
                        <tr>
                            <td><label class="col-sm-12 control-label">Semestre</label></td>
                            <td><div class="col-md-12"><input type="text" name="semestre" class="form-control" placeholder="Semestre" value="<%=semestre%>"></div></td>
                        </tr>
                        <tr>
                            <td><label class="col-sm-12 control-label">fechaInicio</label></td>
                            <td><div class="col-md-12"><input type="date" name="fechaInicio" class="form-control" placeholder="fechaInicio" value="<%=fechaInicio%>"></div></td>
                        </tr>
                         <tr>
                            <td><label class="col-sm-12 control-label">fechaFin</label></td>
                            <td><div class="col-md-12"><input type="date" name="fechaFin" class="form-control" placeholder="fechaInicio" value="<%=fechaFin%>"></div></td>
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
</div>
<%@include file="WEB-INF/jspf/bottom.jspf"%>