<%@page import="java.sql.Date"%>
<%@page import="pro.modelo.entidad.Asistencia"%>
<%@page import="pro.modelo.entidad.Curso"%>
<%@page import="pro.modelo.dao.impl.asistenciaDaoImpl"%>
<%@page import="pro.modelo.dao.asistenciaDao"%>
<%@page import="pro.modelo.entidad.Campana"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    HttpSession session1 = request.getSession();
    String idU = (String)session1.getAttribute("idUsuario");
    if(idU == null){
        response.sendRedirect("alerta.jsp");
    }
    
    String idCampana = request.getParameter("idCampana"); idCampana=idCampana==null?"":idCampana;
    String idCargaCurso = request.getParameter("idCargaCurso"); idCargaCurso=idCargaCurso==null?"":idCargaCurso;
    String fechaHora = request.getParameter("fechaHora"); fechaHora=fechaHora==null?"":fechaHora;
    String control = request.getParameter("control"); control=control==null?"":control;
%>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6 well">
            <h1 class="text-center"><label>ASISTENCIA</label></h1>
            <form id="asistencia" name="asistencia" action="asistencia.jsp">
                <table class="table table-striped">
                    <tr>
                        <td><label class="col-md-12 control-label">Campaña</label></td>
                        <td><select id="campana" name="idCampana"    class="form-control">
                                
                                <%
                                
                                
                                  Campana    cp  = new asistenciaDaoImpl().editarCampana(idCampana);
                                   if(cp.getIdCampana()==null){
                                %>   
                                 <option>Seleccionar Campaña</option>
                                 
                                 <%   
                                   }else{
                                       %>
                                      <option value="<%=cp.getIdCampana()%>"><%=cp.getNombre()%></option>
                                     <%
                                       }
                                    //String idDocente = request.getParameter("idDocente"); idDocente=idDocente==null?"":idDocente;
                                    
                                    asistenciaDao dao = new asistenciaDaoImpl();
                                    for(Campana campana : dao.listarCampana(idUsuario)){ 
                                %>
                                <option value="<%=campana.getIdCampana()%>"><%=campana.getNombre()%></option>
                                <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label class="col-md-12 control-label">Curso</label></td>
                         <td>
                            <select name="idCargaCurso" class="form-control">
                                <%
                                  Curso curso1 = new asistenciaDaoImpl().editarCurso(idCargaCurso);
                                   if(curso1.getIdCurso()==null){
                                %>   
                                <option>Seleccionar Curso</option>
                                <%   
                                   }else{
                                       %>
                                 <option value="<%=curso1.getIdCurso()%>"><%=curso1.getNombre()%></option>
                                <%
                                   }
                                   // String idCampana = "A-00001";
                                    for(Curso curso : dao.listarCurso(idCampana, idUsuario)){ 
                                %>
                                <option value="<%=curso.getIdCurso()%>"><%=curso.getNombre()%></option>
                                <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label class="col-sm-12 control-label">Fecha</label></td>
                        <td><div class="col-md-12"><input type="date" name="fechaHora" class="form-control" value="<%=fechaHora%>"></div></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2"><input type="submit" name="aceptar" class="btn btn-primary" value="Aceptar"></td>
                    </tr>
                    <tr>
                        <th><label class="col-sm-12 control-label">Alumno</label></th>
                        <th><label class="col-sm-12 control-label">Asistencia</label></th> 
                    </tr>
                    <%
                        int count = 0;
                        for(Asistencia asistencia : dao.listarAsistencia(idCampana, idCargaCurso, fechaHora)){ 
                            
                    %>
                    <tr>
                        <td class="col-md-12">
                            <input type="text" name="" class="form-control" value="<%=asistencia.getNombre()%><%=", "%><%=asistencia.getApellidoPat()%><%=asistencia.getApellidoMat()%>">
                            <input type="hidden" name="alumno<%=count%>" value="<%=asistencia.getIdAlumno()%>">
                        </td>
                        <td><label class="radio-inline">
                            <input type="radio" name="control<%=count%>" id="inlineRadio1" value="A"<%if(asistencia.getControl().equals("A")){%> checked<%}%>>Asistio
                            </label>
                        <label class="radio-inline">
                            <input type="radio" name="control<%=count%>" id="inlineRadio2" value="T"<%if(asistencia.getControl().equals("T")){%> checked<%}%>>Tardanza
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="control<%=count%>" id="inlineRadio2" value="F"<%if(asistencia.getControl().equals("F")){%> checked<%}%>>Falta
                        </label>
                        </td>
                    </tr>
                    <%count++;}%>
                    <input type="hidden" name="maximo" value="<%=count%>">
                    <tr>
                        <td align = "center" colspan="2"><input type="submit" name="guardar" class="btn btn-primary" value="Guardar"></td>
                    </tr>
                </table>
            </form>
        </div> 
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
    </div>
</div>
                    <%@include file="WEB-INF/jspf/bottom.jspf"%>
<%
   String guardar = request.getParameter("guardar"); guardar=guardar==null?"":guardar;
   String aceptar = request.getParameter("aceptar"); aceptar=aceptar==null?"":aceptar;
   
   if(guardar.equals("Guardar")){
       
       for(int i = 0; i<count; i++){
           
           String alumno = request.getParameter("alumno"+i);alumno=alumno==null?"":alumno;
           String control1 = request.getParameter("control"+i);if(control1 == null)control1=""; 
           if(!alumno.equals("")){
               
       new asistenciaDaoImpl().modificarAsistencia(idCampana, idCargaCurso, fechaHora, control1, "", alumno);
        
           }
       
       }
       %>
        <script>
           $(document).on('ready',function(){
            
                  $("#asistencia").submit();
            
           });                
       </script>
       <%
   }
   
   if(aceptar.equals("Aceptar")){
    new asistenciaDaoImpl().inscribirAsistencia(idCampana, idCargaCurso, fechaHora);
    %>
     <script>
           $(document).on('ready',function(){
            
                  $("#asistencia").submit();
            
           });                
     </script>
    <%
    
    
   }
   
   
   
%>

 <script>
           $(document).on('ready',function(){
              $("#campana").on('change',function(){
                  $("#asistencia").submit();
              });
           });                
     </script>