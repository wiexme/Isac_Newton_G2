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
import pro.modelo.dao.cargaCursoDao;
import pro.modelo.entidad.Aula;
import pro.modelo.entidad.Campana;
import pro.modelo.entidad.Curso;
import pro.modelo.entidad.Docente;
import pro.modelo.entidad.TipoDocumento;
import pro.modelo.entidad.Ubigeo;
import pro.modelo.util.ConexionOracle;
import pro.modelo.util.HibernateUtil;

/**
 *
 * @author WIEXME
 */
public class cargaCursoDaoImpl implements cargaCursoDao{
    
    public Connection conecta(){
        return ConexionOracle.conectar();
    }

    @Override
    public boolean inscribirCargaCurso(String id_curso, String id_campana, String id_aula, String id_docente) {
        Statement st = null;
        boolean flat = false;
        String query = "INSERT INTO carga_curso VALUES ('', '"+id_curso+"','"+id_campana+"',"
                + "'"+id_aula+"','"+id_docente+"')";
        
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
    public List<Curso> listarCurso() {
        List<Curso> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Curso>();
            Query query = session.createQuery("FROM Curso");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

    @Override
    public List<Campana> listarCampana() {
        List<Campana> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Campana>();
            Query query = session.createQuery("FROM Campana");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

    @Override
    public List<Aula> listarAula() {
        List<Aula> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Aula>();
            Query query = session.createQuery("FROM Aula");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

    @Override
    public List<Docente> listarDocente() {
        List<Docente> lista = new ArrayList<Docente>();
       Statement st = null;
       ResultSet rs = null;
       String query = "select p.id_persona as id, p.nombre as nombre, p.apellido_pat as apellidoPat, p.apellido_mat as apellidoMat, d.ocupacion as ocupacion from persona p, docente d where p.id_persona = d.id_docente";
       Docente docente =null;
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {                
                docente = new Docente();
                docente.setIdDocente(rs.getString("id"));
                docente.setNombre(rs.getString("nombre"));
                docente.setApellido_pat(rs.getString("apellidoPat"));
                docente.setApellido_mat(rs.getString("apellidoMat"));
                docente.setOcupacion(rs.getString("ocupacion"));
                lista.add(docente);
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
