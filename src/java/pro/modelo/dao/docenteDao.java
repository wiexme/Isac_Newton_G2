/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao;

import java.util.List;
import pro.modelo.entidad.Docente;

/**
 *
 * @author WIEXME
 */
public interface docenteDao {
     public boolean inscribirDocente(String id_persona, String id_usuario, String ocupacion);
     public List<Docente> listarDocente();
     public List<Docente> listarDocenteCampana(String idCamapana);
}
