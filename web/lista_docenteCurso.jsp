<%@page import="pro.modelo.entidad.Campana"%>
<%@page import="pro.modelo.dao.impl.campanaDaoImpl"%>
<%@page import="pro.modelo.dao.campanaDao"%>
<%@page import="pro.modelo.entidad.Docente"%>
<%@page import="pro.modelo.dao.impl.docenteDaoImpl"%>
<%@page import="pro.modelo.dao.docenteDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    campanaDao daoc = new campanaDaoImpl();
    docenteDao dao = new docenteDaoImpl();
    String idCampana = request.getParameter("idCampana"); idCampana=idCampana==null?"":idCampana;
%>
<div class="container-fluid">
    <div class="row">
        <script type="text/javascript">
            function filter2 (phrase, _id){
                    var words = phrase.value.toLowerCase().split(" ");
                    var table = document.getElementById(_id);
                    var ele;
                    for (var r = 1; r < table.rows.length; r++){
                            ele = table.rows[r].innerHTML.replace(/<[^>]+>/g,"");
                            var displayStyle = 'none';
                            for (var i = 0; i < words.length; i++) {
                                if (ele.toLowerCase().indexOf(words[i])>=0)
                                    displayStyle = '';
                                else {
                                    displayStyle = 'none';
                                    break;
                                }
                            }
                            table.rows[r].style.display = displayStyle;
                    }
            }
        </script>
        <div class="col-xs-12 col-sm-1 col-md-1"></div>
        <div class="col-xs-12 col-sm-10 col-md-10 well">
            <h1 class="text-center"><label>Docente por Campaña</label></h1>
            <form action="lista_docenteCurso.jsp">
                <table class="table table-striped">
                    <tr>
                            <td><label class="col-sm-2 control-label">Campaña</label></td>
                            <td class="col-sm-4"><select name="idCampana" class="form-control">
                                    <option>Seleccionar Campaña</option>
                                    <%
                                        for(Campana campana: daoc.listarCampana()){
                                    %>
                                    <option value="<%=campana.getIdCampana()%>"><%=campana.getNombre()%></option>
                            <%}%>
                            </select>
                            </td>
                            <td><input type="submit" class="btn btn-info" value="Buscar"></td>
                    </tr>
                </table>
            </form>
            <div class="input-group">
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-search">
           
            </span>
            </span>
                 <input autofocus placeholder="Buscar Docente" class="form-control" name="filter2" onkeyup="filter2(this, 'filtroDocente', 1)" type="text">
            </div><br>
            <form action="lista_docenteCurso.jsp">
                <div class="table-responsive">
                    <table id="filtroDocente" class="table table-striped">
                        <thead>
                        <tr class="info">
                            <th>#</th>
                            <th>Nombres y Apellidos</th>
                            <th>Ocupación</th>
                            <th>Curso</th>
                            <th>Campaña</th>
                            <th>Semestre</th>
                            <th>Aula</th>
                        </tr>
                    </thead>
                    <tbody>
                         <%
                        int count = 0;
                        for(Docente docente : dao.listarDocenteCampana(idCampana)){ 
                            count++;
                        %>
                        <tr>
                            <td><%=count%></td>
                            <td><%=docente.getNombre()%><%=", "%> <%=docente.getApellido_pat()%> <%=docente.getApellido_mat()%></td>
                            <td><%=docente.getOcupacion()%></td>
                            <td><%=docente.getNombreCurso()%></td>
                            <td><%=docente.getNombreCampana()%></td>
                            <td><%=docente.getSemestre()%></td>
                            <td><%=docente.getNombreAula()%></td>
                        </tr>
                        <%}%>
                    </tbody>
                    </table>
                </div>
            </form>
        </div>
        <div class="col-xs-12 col-sm-1 col-md-1"></div>
    </div>
</div>
<%@include file="WEB-INF/jspf/bottom.jspf"%>
