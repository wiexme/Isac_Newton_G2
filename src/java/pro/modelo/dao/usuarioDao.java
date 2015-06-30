/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao;

import java.util.List;
import pro.modelo.entidad.Usuario;

/**
 *
 * @author WIEXME
 */
public interface usuarioDao {
    public boolean inscribirUsuario(String id_persona, String login, String password);
    public String validarUsuario(String usuario, String password);
    public Usuario mostrarUsuario(String idUsuario);
    public List<Usuario> listarUsuario();
    public boolean eliminarUsuario(String idUsuario);
    public Usuario buscarUsuario(String idUsuario);
    public boolean actualizarUsuario(Usuario usuario);
}
