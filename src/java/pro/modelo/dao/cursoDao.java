/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao;

import java.util.List;
import pro.modelo.entidad.Curso;


/**
 *
 * @author GESSEÑY
 */
public interface cursoDao {
    public boolean registrarCurso(Curso curso);
     public List<Curso> listarCurso();
     public boolean actualizarCurso(Curso curso);
     public boolean eliminarCurso(String curso);
     public Curso buscarCurso(String idCurso);
}
