/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao;

import java.util.List;
import pro.modelo.entidad.TipoDocumento;



/**
 *
 * @author WIEXME
 */
public interface tipoDocumentoDao {
     public boolean registrarTipoDocumento(TipoDocumento tipodocumento);
     public List<TipoDocumento> listarTipoDocumento();
     public boolean actualizarTipoDocumento(TipoDocumento tipoDocumento);
     public boolean eliminarTipoDocumento(String tipodocumento);
     public TipoDocumento buscarTipoDocumento(String idTipoDocumento);
}
