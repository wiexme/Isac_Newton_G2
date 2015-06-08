/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao;

import java.util.List;
import pro.modelo.entidad.Alumno;
import pro.modelo.entidad.Campana;
import pro.modelo.entidad.TipoDocumento;

/**
 *
 * @author WIEXME
 */
public interface matriculaDao {
    public List<Campana> listarCampana();
    public boolean inscribirMatricula (String id_alumno, String id_campana, String cod_matricula, String id_usuario);
}
