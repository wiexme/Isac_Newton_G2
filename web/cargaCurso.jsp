<%@page import="pro.modelo.entidad.Docente"%>
<%@page import="pro.modelo.entidad.Aula"%>
<%@page import="pro.modelo.entidad.Campana"%>
<%@page import="pro.modelo.entidad.Curso"%>
<%@page import="pro.modelo.dao.cargaCursoDao"%>
<%@page import="pro.modelo.dao.impl.cargaCursoDaoImpl"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
cargaCursoDao dao = new cargaCursoDaoImpl();
String idCurso = request.getParameter("idCurso"); idCurso=idCurso==null?"":idCurso;
String idCampana = request.getParameter("idCampana"); idCampana=idCampana==null?"":idCampana;
String idAula = request.getParameter("idAula"); idAula=idAula==null?"":idAula;
String idDocente = request.getParameter("idDocente"); idDocente=idDocente==null?"":idDocente;
%>
<div class="container-fluid">
    <div class="row">   
    <div class="col-xs-12 col-sm-1 col-md-1"></div>
    <div class="col-xs-12 col-sm-10 col-md-10 well">
        <h1 class="text-center"><label>CURSOS ACADEMICOS</label></h1>
        <form action="servlet_cargaCurso" method="post">
            <table class="table table-striped">
                <tr>
                    <td><label>Campaña</label></td>
                    <td>
                        <select required name="idCampana" class="form-control">
                            <option>Seleccionar Campaña</option>
                            <%  
                            for(Campana campana: dao.listarCampana()){  
                            %>
                            <option value="<%=campana.getIdCampana()%>"><%=campana.getNombre()%></option>
                            <%}%>
                        </select>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th><label class="col-sm-12 control-label">Cursos</label></th>
                    <th><label class="col-sm-12 control-label">Docentes</label></th>
                    <th><label class="col-sm-12 control-label">Aulas</label></th>
                </tr>
            <%
               int x_count = 0;
               int y_count = 0;
               int z_count = 0;
               for(Curso curso: dao.listarCurso()){
            %>
            <tr>
                <td class="col-md-6">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <input type="checkbox" name="idCurso<%=x_count%>" value="<%=curso.getIdCurso()%>">
                        </span>
                        <input type="text" name="idCurso" class="form-control" value="<%=curso.getNombre()%>">
                    </div>
               </td>
               <td class="col-sm-3">
                    <select name="idDocente<%=y_count%>" class="form-control">
                        <option>Seleccionar Docente</option>
                        <%  
                            for(Docente docente: dao.listarDocente()){  
                        %>
                        <option value="<%=docente.getIdDocente()%>"><%=docente.getNombre()%> <%=docente.getApellido_pat()%> <%=docente.getApellido_mat()%> <%="("%><%=docente.getOcupacion()%><%=")"%></option>
                <%}%>
                </select>
                </td>
                <td class="col-sm-3">
                    <select name="idAula<%=z_count%>" class="form-control">
                        <option>Seleccionar Aula</option>
                        <%
                            for(Aula aula: dao.listarAula()){ 
                        %>
                        <option value="<%=aula.getIdAula()%>"><%=aula.getNombre()%></option>
                        <%}%>
                    </select>
                </td>
            </tr>
            <%  
                  x_count++;
                  y_count++;
                  z_count++;    
            }%>
             <tr>
                 <td align="center" colspan="5"><input type="submit" class="btn btn-primary" value="Guardar"></td>
             </tr>
            </table>
            <input type="hidden" name="x_count" value="<%=x_count%>">
            <input type="hidden" name="y_count" value="<%=y_count%>">
            <input type="hidden" name="z_count" value="<%=z_count%>">
        </form>
    </div>
    <div class="col-xs-12 col-sm-1 col-md-1"></div>
 </div>
</div>        
<%@include file="WEB-INF/jspf/bottom.jspf"%>
 