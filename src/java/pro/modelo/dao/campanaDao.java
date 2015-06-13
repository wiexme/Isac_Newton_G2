/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao;

import java.util.List;
import pro.modelo.entidad.Campana;

/**
 *
 * @author WIEXME
 */
public interface campanaDao {
     public boolean registrarAula(Campana campana);
     public List<Campana> listarCampana();
     public boolean actualizarCampana(Campana campana);
     public boolean eliminarCampana(String campana);
     public Campana buscarCampana(String idCampana);
}
