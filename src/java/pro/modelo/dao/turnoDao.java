/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao;

import java.util.List;
import pro.modelo.entidad.Turno;

/**
 *
 * @author WIEXME
 */
public interface turnoDao {
     public boolean registrarTurno(Turno turno);
     public List<Turno> listarTurno();
     public boolean actualizarTurno(Turno turno);
     public boolean eliminarTurno(String turno);
     public Turno buscarTurno(String idTurno);
}
