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
import java.util.Date;
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
       Persona persona = new Persona();
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {                
                
                persona.setIdPersona(rs.getString("id_persona"));
                persona.setNombre(rs.getString("nombre"));
                persona.setApellidoPat(rs.getString("apellido_pat"));
                persona.setApellidoMat(rs.getString("apellido_mat"));
                persona.setGenero(rs.getString("genero"));  
                persona.setFechaNacimiento(String.valueOf(rs.getDate("fecha_nacimiento")));
                persona.setIdTipoDocumento(rs.getString("id_tipodocumento"));
                persona.setNumDocumento(rs.getString("num_documento"));
                persona.setDireccion(rs.getString("direccion"));
                persona.setTelefono(rs.getString("telefono"));
                persona.setCelular(rs.getString("celular"));
                persona.setEstadoCivil(rs.getString("estado_civil"));
                persona.setReligion(rs.getString("religion"));
                persona.setIdUbigeo(rs.getString("id_ubigeo"));
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

    @Override
    public boolean actualizarPersona(Persona persona) {
       Statement st = null;
       String query = "BEGIN modificarPersona('"+persona.getIdPersona()+"','"+persona.getNombre()+"',"
               + "'"+persona.getApellidoPat()+"','"+persona.getApellidoMat()+"','"+persona.getGenero()+"',"
               + "'"+persona.getFechaNacimiento()+"','"+persona.getIdTipoDocumento()+"','"+persona.getNumDocumento()+"',"
               + "'"+persona.getDireccion()+"','"+persona.getTelefono()+"','"+persona.getCelular()+"',"
               + "'"+persona.getEstadoCivil()+"','"+persona.getReligion()+"','"+persona.getIdUbigeo()+"'); END;";
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
    public TipoDocumento editarTipoDocumento(String idTipoDocumento) {
       TipoDocumento td = new TipoDocumento();
       Statement st = null;
       ResultSet rs = null;
       String query = "select id_tipodocumento, nombre from tipo_documento where id_tipodocumento = '"+idTipoDocumento+"'";
        
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {                
               td.setIdTipodocumento(rs.getString("id_tipodocumento"));
               td.setNombre(rs.getString("nombre"));
               
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
       return td;
    }

    @Override
    public Ubigeo editarUbigeo(String idUbigeo) {
       Ubigeo ubigeo = new Ubigeo();
       Statement st = null;
       ResultSet rs = null;
       String query = "select id_ubigeo, nombre from ubigeo where id_ubigeo= '"+idUbigeo+"'";
        
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {                
               ubigeo.setIdUbigeo(rs.getString("id_ubigeo"));
               ubigeo.setNombre(rs.getString("nombre"));
               
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
       return ubigeo;
    }

    @Override
    public List<Persona> listarPersona() {
        List<Persona> lista = new ArrayList<Persona>();
        Persona persona = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.id_persona, p.nombre, p.apellido_pat, p.apellido_mat, decode(p.genero,'F','Femenino','M','Masculino','No definido') as genero, " +
                        "p.fecha_nacimiento, td.nombre as tipodocumento, p.num_documento, p.direccion, NVL(p.telefono,'Sin Asignar') as telefono, NVL(p.celular, 'Sin Asignar') as celular, " +
                        "decode(p.estado_civil, 'S', 'Soltero', 'C','Casado', 'D', 'Divorciado','No definido') as estado_civil, " +
                        "NVL(p.religion, 'Sin Asignar') as religion, u.nombre as ubigeos " +
                        "from persona p, tipo_documento td, ubigeo u where p.id_tipodocumento = td.id_tipodocumento and p.id_ubigeo = u.id_ubigeo";
        System.out.println("sas"+query);
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
                persona.setFechaNacimiento(String.valueOf(rs.getDate("fecha_nacimiento")));
                persona.setNombreTipoDoc(rs.getString("tipodocumento"));
                persona.setNumDocumento(rs.getString("num_documento"));
                persona.setDireccion(rs.getString("direccion"));
                persona.setTelefono(rs.getString("telefono"));
                persona.setCelular(rs.getString("celular"));
                persona.setEstadoCivil(rs.getString("estado_civil"));
                persona.setReligion(rs.getString("religion"));
                persona.setNombreUbigeo(rs.getString("ubigeos"));
                lista.add(persona);
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
