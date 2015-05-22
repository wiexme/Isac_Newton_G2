<%@include file="WEB-INF/jspf/top.jspf"%>
<div class="container-fluid">
    <div class="row">
        <label class="col-lg-3"></label>
        <div class="col-xs-12 col-sm-6 col-md-6">
<div class="tabla">
<table class="table table-condensed">
<tbody>   
  <tr>
    <td><lebel class="col-sm-2 control-label">Nombre</lebel></td>
    <td><div class="col-sm-15"><input type="text" class="form-control" placeholder="Nombre" value=""></div></td>
  </tr>
  <tr>
    <td><lebel class="col-sm-2 control-label">Apellidos</lebel></td>
    <td><div class="col-sm-15"><input type="text" class="form-control" placeholder="Apellido" value=""></div></td>
  </tr>
  <tr>
      <td><lebel class="col-sm-2 control-label">Genero</lebel></td>
      <td><label class="radio-inline">
          <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">Femenino
          </label>
      <label class="radio-inline">
          <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">Masculino
          </label>
      </td>
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
    <td><lebel class="col-sm-2 control-label">Aula</lebel></td>
    <td><select class="form-control">
    <option>Seleccionar</option>
    <option>A-1</option>
    <option>A-2</option>
    <option>A-3</option>
    </select></td>
  </tr>
  <tr>
    <td><lebel class="col-sm-2 control-label">Fecha_Inicio</lebel></td>
    <td><div class="col-sm-15"><input type="date" class="form-control"></div></td>
  </tr>
  <tr>
    <td colspan="3" align="center"><input type="submit" name="Submit" class="btn btn-primary" value="Enviar"></td>
  </tr>
</tbody>
</table>
</div>
</div>
</div>
</div>
<%@include file="WEB-INF/jspf/bottom.jspf"%>