<%@page import="pro.modelo.dao.personaDao"%>
<%@page import="pro.modelo.dao.impl.personaDaoImpl"%>
<%@page import="pro.modelo.entidad.Persona"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    personaDao dao = new personaDaoImpl();
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
            <h1 class="text-center"><label>Lista de Personas</label></h1>
            <div class="input-group">
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-search">
           
            </span>
            </span>
                <input autofocus placeholder="Buscar Persona" class="form-control" name="filter2" onkeyup="filter2(this, 'filtro', 1)" type="text">
            </div><br>
            <form action="lista_personas.jsp">
                
                <div class="table-responsive row">
                    <table id="filtro" class="table table-striped">
                    <thead>
                        <tr class="info">
                            <th>#</th>
                            <th>Nombre y Aapellidos</th>
                            <th>Genero</th>
                            <th>Fecha Nacimiento</th>
                            <th>Tipo Documento</th>
                            <th>Numero Documento</th>
                            <th>Dirección</th>
                            <th>Telefono</th>
                            <th>Celular</th>
                            <th>Estado Civil</th>
                            <th>Religión</th>
                            <th>Procedencia</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int count = 0;
                        for(Persona persona : dao.listarPersona()){ 
                            count++;
                        %>
                        <tr>
                            <td><%=count%></td>
                            <td><%=persona.getNombre()%> <%=persona.getApellidoPat()%> <%=persona.getApellidoMat()%></td>
                            <td><%=persona.getGenero()%></td>
                            <td><%=persona.getFechaNacimiento()%></td>
                            <td><%=persona.getNombreTipoDoc()%></td>
                            <td><%=persona.getNumDocumento()%></td>
                            <td><%=persona.getDireccion()%></td>
                            <td><%=persona.getTelefono()%></td>
                            <td><%=persona.getCelular()%></td>
                            <td><%=persona.getEstadoCivil()%></td>
                            <td><%=persona.getReligion()%></td>
                            <td><%=persona.getNombreUbigeo()%></td>
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