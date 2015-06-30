/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao;

import java.util.List;
import pro.modelo.entidad.Persona;
import pro.modelo.entidad.TipoDocumento;
import pro.modelo.entidad.Ubigeo;

/**
 *
 * @author WIEXME
 */
public interface personaDao {
    public List<TipoDocumento> listarTipoDocumento();
    public Persona buscarPersona(String numdoc);
    public boolean registrarPersona(Persona persona);
    public List<Ubigeo> listarUbigeo();
    public boolean actualizarPersona(Persona persona);
    public TipoDocumento editarTipoDocumento(String idTipoDocumento);
    public Ubigeo editarUbigeo(String idUbigeo);
    public List<Persona> listarPersona();
    
}
