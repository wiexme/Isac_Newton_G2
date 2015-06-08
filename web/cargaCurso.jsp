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
        <h1 class="text-center"><label>CURSOS ACADEMICOS</label></h1>
    <div class="col-xs-12 col-sm-1 col-md-1"></div>
    <div class="col-xs-12 col-sm-6 col-md-6 well">
        <form>
            <table class="table table-striped">
                <tr>
                    <th><label class="col-sm-12 control-label">Cursos</label></th>
                    <th><label class="col-sm-12 control-label">Docentes</label></th>
                </tr>
            <%
               for(Curso curso: dao.listarCurso()){ 
            %>
            <tr>
               <td>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <input type="checkbox">
                        </span>
                        <input type="text" name="idCurso" class="form-control" value="<%=curso.getNombre()%>">
                    </div>
               </td>
               <td>
                    <select name="idDocente" class="form-control">
                        <option>Seleccionar Docente</option>
                        <%
                            for(Docente docente: dao.listarDocente()){  
                        %>
                        <option value="<%=docente.getIdDocente()%>"><%=docente.getNombre()%> <%=docente.getApellido_pat()%> <%=docente.getApellido_mat()%> <%="("%><%=docente.getOcupacion()%><%=")"%></option>
                <%}%>
                </select>
                </td>
            </tr>
            <%}%>
            </table>
        </form>
    </div>
    <div class="col-xs-12 col-sm-4 col-md-4 well">
        <form>
            <table class="table table-striped">
                <tr>
                    <th><label class="col-sm-12 control-label">Campaña</label></th>
                </tr>
            <%
               for(Campana campana: dao.listarCampana()){ 
            %>
            <tr>
                <td><div class="col-md-12">
            <div class="input-group">
                <span class="input-group-addon">
                    <input type="radio" name="radio1">
                </span>
                <input type="text" name="idCampana" class="form-control" value="<%=campana.getNombre()%>">
            </div>
            </div>
               </td>
            </tr>
            <%}%>
            </table>
        </form>
    </div>
            <div class="col-xs-12 col-sm-4 col-md-4 well">
        <form>
            <table class="table table-striped">
                <tr>
                    <th><label class="col-sm-12 control-label">Aula</label></th>
                </tr>
            <%
               for(Aula aula: dao.listarAula()){ 
            %>
            <tr>
                <td><div class="col-md-12">
            <div class="input-group">
                <span class="input-group-addon">
                    <input type="radio" name="radio2">
                </span>
                <input type="text" name="idAula" class="form-control" value="<%=aula.getNombre()%>">
            </div>
            </div>
               </td>
            </tr>
            <%}%>
            </table>
        </form>
    </div>
    <div class="col-xs-12 col-sm-1 col-md-1"></div>
 </div>
</div>                           
<%@include file="WEB-INF/jspf/bottom.jspf"%>
 