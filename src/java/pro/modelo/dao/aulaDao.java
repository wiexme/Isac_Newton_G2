/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao;

import java.util.List;
import pro.modelo.entidad.Aula;

/**
 *
 * @author WIEXME
 */
public interface aulaDao {
     public boolean registrarAula(Aula aula);
     public List<Aula> listarAula();
     public boolean actualizarAula(Aula aula);
     public boolean eliminarAula(String aula);
     public Aula buscarAula(String idAula);
}
