/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao;

import java.util.List;
import pro.modelo.entidad.Aula;
import pro.modelo.entidad.Campana;
import pro.modelo.entidad.Curso;
import pro.modelo.entidad.Docente;

/**
 *
 * @author WIEXME
 */
public interface cargaCursoDao {
    public List<Curso> listarCurso();
    public List<Campana> listarCampana();
    public List<Aula> listarAula();
    public List<Docente> listarDocente();
    public boolean inscribirCargaCurso(String id_curso, String id_campana, String id_aula, String id_docente);
}
