/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao;

import pro.modelo.entidad.Alumno;
import pro.modelo.entidad.Persona;

/**
 *
 * @author WIEXME
 */
public interface alumnoDao {
    public boolean inscribirAlumno(Alumno alumno, Persona persona);
}
