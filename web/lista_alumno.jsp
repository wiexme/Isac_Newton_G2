<%@page import="pro.modelo.dao.alumnoDao"%>
<%@page import="pro.modelo.dao.impl.alumnoDaoImpl"%>
<%@page import="pro.modelo.entidad.Alumno"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    alumnoDao dao =new alumnoDaoImpl();
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
            <h1 class="text-center"><label>Lista de Alumnos</label></h1>
            <div class="input-group">
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-search">
           
            </span>
            </span>
                <input autofocus placeholder="Buscar Alumno" class="form-control" name="filter2" onkeyup="filter2(this, 'filtroalumno', 1)" type="text">
            </div><br>
            <form action="lista_alumno.jsp">
                <div class="table-responsive">
                    <table id="filtroalumno" class="table table-striped">
                        <thead>
                        <tr class="info">
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Apellido Paterno</th>
                            <th>Apellido Materno</th>
                            <th>N° Documento</th>
                            <th>Dirección</th>
                            <th>Código</th>
                        </tr>
                    </thead>
                    <tbody>
                         <%
                        int count = 0;
                        for(Alumno alumno : dao.listarAlumno()){ 
                            count++;
                        %>
                        <tr>
                            <td><%=count%></td>
                            <td><%=alumno.getNombre()%></td>
                            <td><%=alumno.getApellidoPat()%></td>
                            <td><%=alumno.getApellidoMat()%></td>
                            <td><%=alumno.getNumDocumento()%></td>
                            <td><%=alumno.getDireccion()%></td>
                            <td><%=alumno.getCodigoAlumno()%></td>
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