/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao;

import java.util.List;
import pro.modelo.entidad.Alumno;

/**
 *
 * @author WIEXME
 */
public interface alumnoDao {
    public boolean inscribirAlumno(String id_persona, String codigo);
    public List<Alumno> listarAlumno();
}
