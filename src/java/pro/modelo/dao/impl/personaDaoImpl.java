/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import pro.modelo.dao.personaDao;
import pro.modelo.entidad.Persona;
import pro.modelo.entidad.TipoDocumento;
import pro.modelo.entidad.Ubigeo;
import pro.modelo.util.ConexionOracle;
import pro.modelo.util.HibernateUtil;

/**
 *
 * @author WIEXME
 */
public class personaDaoImpl implements personaDao{
    
    public Connection conecta(){
        return ConexionOracle.conectar();
    }

    @Override
    public List<TipoDocumento> listarTipoDocumento() {
        List<TipoDocumento> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<TipoDocumento>();
            Query query = session.createQuery("FROM TipoDocumento");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }


    @Override
    public Persona buscarPersona(String numdoc) {
       Statement st = null;
       ResultSet rs = null;
       String query = "SELECT * FROM persona WHERE num_documento = '"+numdoc+"'";
       Persona persona =null;
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {                
                persona = new Persona();
                persona.setIdPersona(rs.getString("id_persona"));
                persona.setNombre(rs.getString("nombre"));
                persona.setApellidoPat(rs.getString("apellido_pat"));
                persona.setApellidoMat(rs.getString("apellido_mat"));
                persona.setGenero(rs.getString("genero"));               
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
       return persona;
    }

    @Override
    public boolean registrarPersona(Persona persona) {
       Statement st = null;
        boolean flat = false;
        String query = "INSERT INTO persona "
                + "(nombre, apellido_pat,"
                + "apellido_mat, genero,"
                + "fecha_nacimiento,id_tipodocumento,"
                + "num_documento, direccion,"
                + "telefono, celular,"
                + "estado_civil, religion,"
                + "id_ubigeo) VALUES ('"+persona.getNombre()+"',"
                + "'"+persona.getApellidoPat()+"',"
                + "'"+persona.getApellidoMat()+"',"
                + "'"+persona.getGenero()+"',"
                + "to_date('"+persona.getFechaNacimiento()+"','yyyy-mm-dd'),"
                + "'"+persona.getIdTipoDocumento()+"',"
                + "'"+persona.getNumDocumento()+"',"
                + "'"+persona.getDireccion()+"',"
                + "'"+persona.getTelefono()+"',"
                + "'"+persona.getCelular()+"',"
                + "'"+persona.getEstadoCivil()+"',"
                + "'"+persona.getReligion()+"',"
                + "'"+persona.getIdUbigeo()+"')";
        
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
    public List<Ubigeo> listarUbigeo() {
       List<Ubigeo> lista = new ArrayList<Ubigeo>();
       Statement st = null;
       ResultSet rs = null;
       String query = "select distinct ub3.id_ubigeo as id, ub3.nombre as nombre " 
               + "from ubigeo ub1, ubigeo ub2, ubigeo ub3, ubigeo ub4 " 
               + "where ub1.id_ubigeo_sup=ub2.id_ubigeo and ub2.id_ubigeo_sup=ub3.id_ubigeo "
               + "and ub3.id_ubigeo_sup='51000000'";
       Ubigeo ubigeo =null;
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {                
                ubigeo = new Ubigeo();
                ubigeo.setIdUbigeo(rs.getString("id"));
                ubigeo.setNombre(rs.getString("nombre"));
                lista.add(ubigeo);
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
    
}
