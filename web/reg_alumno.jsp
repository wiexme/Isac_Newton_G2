<%@include file="WEB-INF/jspf/top.jspf"%>
<div class="tabla">
<table class="table table-condensed">
  <tr>
    <td><lebel class="col-sm-2 control-label">Nombre</lebel></td>
    <td><div class="col-sm-15"><input type="text" class="form-control" placeholder="Nombre" value=""></div></td>
  </tr>
  <tr>
    <td><lebel class="col-sm-2 control-label">Apellidos</lebel></td>
    <td><div class="col-sm-15"><input type="text" class="form-control" placeholder="Apellido" value=""></div></td>
  </tr>
  <tr>
    <td><lebel class="col-sm-2 control-label">Dirección</lebel></td>
    <td><div class="col-sm-15"><input type="text" class="form-control" placeholder="Dirección" maxlength="9" value=""></div></td>
  </tr>
  <tr>
    <td><lebel class="col-sm-2 control-label">D.N.I</lebel></td>
    <td><div class="col-sm-15"><input type="text" class="form-control" placeholder="D.N.I" maxlength="8" value=""></div></td>
  </tr>
  <tr>
    <td colspan="3" align="center"><input type="submit" name="Submit" class="btn btn-primary" value="Enviar"></td>
  </tr>
</tbody>
</table>
</div>
<%@include file="WEB-INF/jspf/bottom.jspf"%>