/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import pro.modelo.dao.asistenciaDao;
import pro.modelo.entidad.Asistencia;
import pro.modelo.entidad.Campana;
import pro.modelo.entidad.CargaCurso;
import pro.modelo.entidad.Curso;
import pro.modelo.util.ConexionOracle;

/**
 *
 * @author WIEXME
 */
public class asistenciaDaoImpl implements asistenciaDao{
     public Connection conecta(){
        return ConexionOracle.conectar();
    }
     
    @Override
    public List<Campana> listarCampana(String idDocente) {
       List<Campana> lista = new ArrayList<Campana>();
       Statement st = null;
       ResultSet rs = null;
       String query = "select distinct c.nombre,c.id_campana " 
                       +"from campana c, carga_curso cc, docente d " 
                       +"where c.id_campana = cc.id_campana and cc.id_docente ='"+idDocente+"'";
       Campana campana =null;
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {                
                campana = new Campana();
                campana.setIdCampana(rs.getString("id_campana"));
                campana.setNombre(rs.getString("nombre"));
                lista.add(campana);
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
    public List<Curso> listarCurso(String idCampana, String idDocente) {
       List<Curso> lista = new ArrayList<Curso>();
       Statement st = null;
       ResultSet rs = null;
       String query = "select cr.nombre, cc.id_cargacurso "
                      +"from carga_curso cc, docente d, curso cr "
                      +"where d.id_docente = cc.id_docente and cr.id_curso = cc.id_curso and cc.id_campana = '"+idCampana+"' and cc.id_docente = '"+idDocente+"'";
       Curso curso =null;
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {                
                curso = new Curso();
                curso.setIdCurso(rs.getString("id_cargacurso"));
                curso.setNombre(rs.getString("nombre"));
                lista.add(curso);
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
    public Campana editarCampana(String id_campana) {
       Campana campana = new Campana();
       Statement st = null;
       ResultSet rs = null;
       String query = "select distinct c.nombre,c.id_campana " 
                       +"from campana c, carga_curso cc, docente d " 
                       +"where c.id_campana = cc.id_campana and c.id_campana ='"+id_campana+"'";
        
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {                
               
                campana.setIdCampana(rs.getString("id_campana"));
                campana.setNombre(rs.getString("nombre"));
               
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
       return campana;
    }

    @Override
    public boolean inscribirAsistencia(String IdCampana, String IdCargaCurso, String fechaHora) {
       Statement st = null;
        boolean flat = false;
        String query = "BEGIN ControlAsistencia('"+IdCampana+"','"+IdCargaCurso+"','"+fechaHora+"'); END;";
       System.out.println(query);
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
    public List<Asistencia> listarAsistencia(String IdCampana, String IdCargaCurso, String fechaHora) {
       List<Asistencia> lista = new ArrayList<Asistencia>();
       Statement st = null;
       ResultSet rs = null;
       String query = "select p.NOMBRE, p.APELLIDO_PAT, p.APELLIDO_MAT, asi.ID_ALUMNO, asi.ID_CAMPANA,"
                       +" asi.ID_CARGACURSO, asi.FECHA_HORA, asi.CONTROL, asi.APRECIACION"
                       +" from persona p, alumno a, matricula m, carga_matricula cm, asistencia asi"
                       +" where p.id_persona = a.id_alumno and a.id_alumno = m.id_alumno"
                       +" and m.id_alumno = cm.id_alumno and m.id_campana = cm.id_campana"
                       +" and cm.id_alumno = asi.id_alumno and cm.id_campana = asi.id_campana" 
                       +" and cm.id_cargacurso = asi.id_cargacurso"
                       +" and cm.id_cargacurso = '"+IdCargaCurso+"'"
                       +" AND asi.FECHA_HORA=to_date('"+fechaHora+"','yyyy/mm/dd')"
                       +" and asi.ID_CAMPANA='"+IdCampana+"'";
        System.out.println("query"+query);
       Asistencia asistencia =null;
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {                
                asistencia = new Asistencia();
                asistencia.setNombre(rs.getString("NOMBRE"));
                asistencia.setApellidoPat(rs.getString("APELLIDO_PAT"));
                asistencia.setApellidoMat(rs.getString("APELLIDO_MAT"));
                asistencia.setIdAlumno(rs.getString("ID_ALUMNO"));
                asistencia.setIdCampana(rs.getString("ID_CAMPANA"));
                asistencia.setIdCargaCurso(rs.getString("ID_CARGACURSO"));
                asistencia.setFechaHora(rs.getDate("FECHA_HORA"));
                asistencia.setControl(rs.getString("CONTROL"));
                asistencia.setApreciacion(rs.getString("APRECIACION"));
                lista.add(asistencia);
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
    public Curso editarCurso(String idcargacurso) {
       Curso curso = new Curso();
       Statement st = null;
       ResultSet rs = null;
       String query = "select cr.nombre, cc.id_cargacurso "
                      +"from carga_curso cc, docente d, curso cr "
                      +"where d.id_docente = cc.id_docente and cr.id_curso = cc.id_curso and cc.id_cargacurso = '"+idcargacurso+"'";
        
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {                
               
                curso.setIdCurso(rs.getString("id_cargacurso"));
                curso.setNombre(rs.getString("nombre"));
               
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
       return curso;
    }

    @Override
    public boolean modificarAsistencia(String IdCampana, String IdCargaCurso, String fechaHora, String control, String aprecicion, String idAlumno) {
       
       Statement st = null;
       String query = "update asistencia set control = '"+control+"' where id_cargacurso = '"+IdCargaCurso+"'"
               + "and id_campana = '"+IdCampana+"' and fecha_hora = to_date('"+fechaHora+"','yyyy/mm/dd') and id_alumno = '"+idAlumno+"'";
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
