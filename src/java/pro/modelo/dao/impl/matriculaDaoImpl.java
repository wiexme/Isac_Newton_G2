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
import pro.modelo.dao.matriculaDao;
import pro.modelo.entidad.Alumno;
import pro.modelo.entidad.Campana;
import pro.modelo.entidad.Matricula;
import pro.modelo.entidad.Persona;
import pro.modelo.entidad.TipoDocumento;
import pro.modelo.util.ConexionOracle;
import pro.modelo.util.HibernateUtil;

/**
 *
 * @author WIEXME
 */
public class matriculaDaoImpl implements matriculaDao{
    public Connection conecta(){
            return ConexionOracle.conectar();
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
    public boolean inscribirMatricula(String id_alumno, String id_campana, String cod_matricula, String id_usuario) {
        Statement st = null;
        boolean flat = false;
        String query = "INSERT INTO matricula VALUES ('"+id_alumno+"','"+id_campana+"', sysdate, '', '"+id_usuario+"')";
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
    public List<Matricula> listarMatricula(String idMatricula) {
        List<Matricula> lista = new ArrayList<Matricula>();
        Matricula matricula = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.nombre, p.apellido_pat, p.apellido_mat, a.CODIGO_ALUMNO, m.COD_MATRICULA, to_char(m.fecha, 'yyyy/mm/dd HH:mm:ss am') as fecha, u.login, c.nombre as nombrecampana, c.SEMESTRE " +
                        "from persona p, alumno a, matricula m, usuario u, campana c " +
                        "where p.id_persona = a.id_alumno and a.id_alumno = m.id_alumno " +
                        "and m.id_campana = c.id_campana and u.id_usuario = m.id_usuario and c.id_campana = '"+idMatricula+"'";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                matricula = new Matricula();
                matricula.setNombre(rs.getString("nombre"));
                matricula.setApellidoPat(rs.getString("apellido_pat"));
                matricula.setApellidoMat(rs.getString("apellido_mat"));
                matricula.setCodAlumno(rs.getString("CODIGO_ALUMNO"));
                matricula.setCodMatricula(rs.getString("COD_MATRICULA"));
                matricula.setFecha(rs.getString("fecha"));
                matricula.setLogin(rs.getString("login"));
                matricula.setNombreCampana(rs.getString("nombrecampana"));
                matricula.setSemestre(rs.getString("SEMESTRE"));
                lista.add(matricula);
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
