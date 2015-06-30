/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao;

import java.util.List;
import pro.modelo.entidad.Asistencia;
import pro.modelo.entidad.Campana;
import pro.modelo.entidad.Curso;


/**
 *
 * @author WIEXME
 */
public interface asistenciaDao {
    public List<Campana> listarCampana(String idDocente);
    public Campana editarCampana(String id_campana);
    public List<Curso> listarCurso(String idCampana, String idDocente);
    public boolean inscribirAsistencia(String IdCampana, String IdCargaCurso, String fechaHora);
    public List<Asistencia> listarAsistencia(String IdCampana, String IdCargaCurso, String fechaHora);
    public Curso editarCurso(String idcargacurso);
    public boolean modificarAsistencia(String IdCampana, String IdCargaCurso, String fechaHora, String control, String aprecicion, String idAlumno);
}
