/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import pro.modelo.dao.usuarioDao;
import pro.modelo.entidad.Usuario;
import pro.modelo.util.ConexionOracle;

/**
 *
 * @author WIEXME
 */
public class usuarioDaoImpl implements usuarioDao{
    public Connection conecta(){
        return ConexionOracle.conectar();
    }

    @Override
    public boolean inscribirUsuario(String id_persona, String login, String password) {
        Statement st = null;
        boolean flat = false;
        String query = "INSERT INTO usuario VALUES ('"+id_persona+"','"+login+"','"+password+"','1')";
       try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();
            conecta().close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().rollback();
                conecta().close();
                flat = false;
            } catch (Exception ex) {
            }
        }
        return flat;
    }

    @Override
    public String validarUsuario(String usuario, String password) {
        String idUsuario = null;
        String query = "SELECT id_usuario FROM usuario WHERE upper(login) = '"+usuario.toUpperCase()+"' AND password = '"+password+"'";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            if(rs.next()){
                idUsuario = rs.getString("id_usuario");
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
        return idUsuario;
    }

    @Override
    public Usuario mostrarUsuario(String idUsuario) {
        Usuario usuario = null;
        String query = "SELECT u.id_usuario, u.login, u.password, u.estado, p.nombre, p.apellido_pat, p.apellido_mat FROM persona p, usuario u WHERE p.id_persona = u.id_usuario and id_usuario = '"+idUsuario+"'";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            if(rs.next()){
                usuario = new Usuario();
                usuario.setIdUsuario(rs.getString("id_usuario"));
                usuario.setLoggin(rs.getString("login"));
                usuario.setPassword(rs.getString("password"));
                usuario.setEstado(rs.getString("estado"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellidoPat(rs.getString("apellido_pat"));
                usuario.setApellidoMat(rs.getString("apellido_mat"));
                
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
        return usuario;
    }

    @Override
    public List<Usuario> listarUsuario() {
        List<Usuario> lista = new ArrayList<Usuario>();
        Usuario usuario = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select u.id_usuario, p.NOMBRE , p.APELLIDO_PAT, p.APELLIDO_MAT, p.NUM_DOCUMENTO, u.LOGIN, u.PASSWORD, u.ESTADO  from persona p, usuario u where p.id_persona = u.id_usuario";

        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                usuario = new Usuario();
                usuario.setIdUsuario(rs.getString("id_usuario"));
                usuario.setNombre(rs.getString("NOMBRE"));
                usuario.setApellidoPat(rs.getString("APELLIDO_PAT"));
                usuario.setApellidoMat(rs.getString("APELLIDO_MAT"));
                usuario.setLoggin(rs.getString("LOGIN"));
                usuario.setPassword(rs.getString("PASSWORD"));
                usuario.setEstado(rs.getString("ESTADO"));
                usuario.setNumDocumento(rs.getString("NUM_DOCUMENTO"));
                lista.add(usuario);
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
        return lista;
    }

    @Override
    public boolean eliminarUsuario(String idUsuario) {
       Statement st = null;
       String query = "delete from usuario where id_usuario = '"+idUsuario+"'";
       System.out.println("query455"+query);
        try {
            st = conecta().createStatement();
            st.executeQuery(query);
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
       return true;
    }

    @Override
    public Usuario buscarUsuario(String idUsuario) {
       Statement st = null;
       ResultSet rs = null;
       String query = "select * from usuario where id_usuario = '"+idUsuario+"'";
       Usuario usuario = new Usuario();
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {                
                usuario.setIdUsuario(rs.getString("id_usuario"));
                usuario.setLoggin(rs.getString("login"));
                usuario.setPassword(rs.getString("password"));
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
       return usuario;
    }

    @Override
    public boolean actualizarUsuario(Usuario usuario) {
       Statement st = null;
       String query = "update usuario set login = '"+usuario.getLoggin()+"', password = '"+usuario.getPassword()+"', estado = '"+usuario.getEstado()+"' where id_usuario = '"+usuario.getIdUsuario()+"'";
       System.out.println("query455"+query);
        try {
            st = conecta().createStatement();
            st.executeQuery(query);
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
       return true;
    }
    
}
