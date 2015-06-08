<%@page import="pro.modelo.dao.impl.personaDaoImpl"%>
<%@page import="pro.modelo.entidad.Persona"%>
<%@page import="pro.modelo.dao.personaDao"%>
<%@page import="pro.modelo.entidad.Alumno"%>
<%@page import="pro.modelo.dao.impl.alumnoDaoImpl"%>
<%@page import="pro.modelo.dao.alumnoDao"%>
<%@page import="pro.modelo.entidad.Matricula"%>
<%@page import="pro.modelo.dao.matriculaDao"%>
<%@page import="pro.modelo.dao.impl.matriculaDaoImpl"%>
<%@page import="pro.modelo.entidad.Campana"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%  

    HttpSession session1 = request.getSession();
    String idU = (String)session1.getAttribute("idUsuario");
    if(idU == null){
        response.sendRedirect("alerta.jsp");
    }

    matriculaDao daom = new matriculaDaoImpl();
    personaDao daop = new personaDaoImpl();
    Persona persona = new Persona();
    Matricula matricula = new Matricula();
    alumnoDao daoa = new alumnoDaoImpl();
    Alumno alumno = new Alumno();
    
    String idPersona = request.getParameter("idPersona"); idPersona=idPersona==null?"":idPersona;
    String idCampana = request.getParameter("idCampana"); idCampana=idCampana==null?"":idCampana;
    String idAlumno = request.getParameter("idAlumno"); idAlumno=idAlumno==null?"":idAlumno;
    String nombre = request.getParameter("nombre"); nombre=nombre==null?"":nombre;
    String apellidoPat = request.getParameter("apellidoPat"); apellidoPat=apellidoPat==null?"":apellidoPat;
    String apellidoMat = request.getParameter("apellidoMat"); apellidoMat=apellidoMat==null?"":apellidoMat;
    String genero = request.getParameter("genero"); genero=genero==null?"":genero;
    String fecha = request.getParameter("fecha"); fecha=fecha==null?"":fecha;
    String codMatricula = request.getParameter("codMatricula"); codMatricula=codMatricula==null?"":codMatricula;
    String buscarMatricula = request.getParameter("buscarMatricula"); buscarMatricula=buscarMatricula==null?"":buscarMatricula;
    String opcion = request.getParameter("opcion"); opcion=opcion==null?"":opcion;

    String mensaje = "";
    if(!buscarMatricula.equals("")){
                persona = daop.buscarPersona(buscarMatricula);
                if(persona !=null){
                    idPersona = persona.getIdPersona();
                    nombre = persona.getNombre();
                    apellidoPat = persona.getApellidoPat();
                    apellidoMat = persona.getApellidoMat();
                    genero = persona.getGenero();
                }else{
                }
     }
    if(opcion.equals("Registrar")){
        if(!codMatricula.equals("")){
          //alumno.setCodigoAlumno(codigoAlumno);
          if(daom.inscribirMatricula(idPersona, idCampana, codMatricula, idUsuario)){
              response.sendRedirect("inicio.jsp");
          }else{
               mensaje = "No se pudo registrar";
          }
        } 
    }     
%>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6 well">
            <h1 class="text-center"><strong>MATRÍCULA</strong></h1>
            <form action="matricula.jsp">
                <input type="hidden" name="idPersona" value="<%=idPersona%>" size="10">
                <input type="hidden" name="buscarMatricula" value="<%=buscarMatricula%>" size="10">
                <input type="hidden" name="opcion" value="Registrar" size="10">
                <table class="table table-condensed">
                    <tbody>
                         <tr>
                            <td><lebel class="col-sm-12 control-label"><strong>Nombres</strong></lebel></td>
                            <td><div class="col-sm-15"><input type="text" name="nombre" class="form-control" placeholder="Nombres" readonly="true" value="<%=nombre%>"></div></td>
                            <td></td>
                         </tr>
                        <tr>
                            <td><lebel class="col-sm-12 control-label"><strong>Apellido Paterno</strong></lebel></td>
                            <td><div class="col-sm-15"><input type="text" name="apellidoPat" class="form-control" placeholder="Apellido Paterno" readonly="true" value="<%=apellidoPat%>"></div></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><label class="col-sm-12 control-label">Apellido Materno</label></td>
                            <td><div class="col-sm-15"><input type="text" name="apellidoMat" class="form-control" placeholder="Apellido Materno" readonly="true" value="<%=apellidoMat%>"></div></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><lebel class="col-sm-12 control-label"><strong>Genero</strong></lebel></td>
                            <td>
                                <label class="radio-inline">
                                <input type="radio" name="genero" id="inlineRadio1" value="F"<%if(genero.equals("F")){%> checked<%}%>>Femenino
                                </label>
                                <label class="radio-inline">
                                <input type="radio" name="genero" id="inlineRadio2" value="M"<%if(genero.equals("M")){%> checked<%}%>>Masculino
                                </label>
                            </td>
                            <td></td>
                        </tr>
                          <tr>
                            <td><label class="col-sm-12 control-label">Campaña</label></td>
                            <td><select name="idCampana" class="form-control">
                                    <option>Seleccionar Campaña</option>
                                    <%
                                        for(Campana campana: daom.listarCampana()){
                                    %>
                                    <option value="<%=campana.getIdCampana()%>"><%=campana.getNombre()%></option>
                            <%}%>
                            </select>
                            </td>
                            <td></td>
                          </tr>
                         <tr>
                            <td><label class="col-sm-12 control-label">Codigo Matrícula</label></td>
                            <td><div class="col-sm-15"><input type="text" name="codMatricula" class="form-control" placeholder="Codigo Matrícula" value="<%=codMatricula%>"></div></td>
                            <td></td>
                         </tr>
                         <tr>
                            <td colspan="3" align="center"><input type="submit" class="btn btn-primary" value="Guardar"></td>
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
