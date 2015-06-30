<%@page import="pro.modelo.entidad.Docente"%>
<%@page import="pro.modelo.dao.docenteDao"%>
<%@page import="pro.modelo.dao.impl.docenteDaoImpl"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    docenteDao dao = new docenteDaoImpl();
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
            <h1 class="text-center"><label>Lista de Docentes</label></h1>
             <div class="input-group">
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-search">
           
            </span>
            </span>
                 <input autofocus placeholder="Buscar Docente" class="form-control" name="filter2" onkeyup="filter2(this, 'filtroDocente', 1)" type="text">
            </div><br>
            <form action="lista_docente.jsp">
                <div class="table-responsive">
                    <table id="filtroDocente" class="table table-striped">
                        <thead>
                        <tr class="info">
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Apellido Paterno</th>
                            <th>Apellido Materno</th>
                            <th>N° Documento</th>
                            <th>Dirección</th>
                            <th>Ocupación</th>
                        </tr>
                    </thead>
                    <tbody>
                         <%
                        int count = 0;
                        for(Docente docente : dao.listarDocente()){ 
                            count++;
                        %>
                        <tr>
                            <td><%=count%></td>
                            <td><%=docente.getNombre()%></td>
                            <td><%=docente.getApellido_pat()%></td>
                            <td><%=docente.getApellido_mat()%></td>
                             <td><%=docente.getNumDocumento()%></td>
                              <td><%=docente.getDireccion()%></td>
                            <td><%=docente.getOcupacion()%></td>
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
