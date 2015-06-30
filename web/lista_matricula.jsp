<%@page import="pro.modelo.dao.impl.campanaDaoImpl"%>
<%@page import="pro.modelo.dao.campanaDao"%>
<%@page import="pro.modelo.entidad.Campana"%>
<%@page import="pro.modelo.entidad.Matricula"%>
<%@page import="pro.modelo.dao.matriculaDao"%>
<%@page import="pro.modelo.dao.impl.matriculaDaoImpl"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    campanaDao daoc = new campanaDaoImpl();
    matriculaDao dao = new matriculaDaoImpl();
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
            <h1 class="text-center"><label>Lista de Matricula</label></h1>
            <form action="lista_matricula.jsp">
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
                <input autofocus placeholder="Buscar Persona" class="form-control" name="filter2" onkeyup="filter2(this, 'filtroMmatricula', 1)" type="text">
            </div><br>
            <form action="lista_matricula.jsp">
                <div class="table-responsive row">
                    <table id="filtroMmatricula" class="table table-striped">
                        <thead>
                        <tr class="info">
                            <th>#</th>
                            <th>Nombre y Aapellidos</th>
                            <th>Codigo Alumno</th>
                            <th>Codigo Matricula</th>
                            <th>Fecha Inscripsión</th>
                            <th>Usuario</th>
                            <th>Campaña</th>
                            <th>Semestre</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int count = 0;
                        for(Matricula matricula : dao.listarMatricula(idCampana)){
                            count++;
                            
                            
                        %>
                        <tr>
                            <td><%=count%></td>
                            <td><%=matricula.getNombre()%><%=", "%><%=matricula.getApellidoPat()%> <%=matricula.getApellidoMat()%></td>
                            <td><%=matricula.getCodAlumno()%></td>
                            <td><%=matricula.getCodMatricula()%></td>
                            <td><%=matricula.getFecha()%></td>
                            <td><%=matricula.getLogin()%></td>
                            <td><%=matricula.getNombreCampana()%></td>
                            <td><%=matricula.getSemestre()%></td>
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
