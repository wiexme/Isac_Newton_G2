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
import pro.modelo.dao.docenteDao;
import pro.modelo.entidad.Docente;
import pro.modelo.util.ConexionOracle;

/**
 *
 * @author WIEXME
 */
public class docenteDaoImpl implements docenteDao{
    public Connection conecta(){
        return ConexionOracle.conectar();
    }

    @Override
    public boolean inscribirDocente(String id_persona, String id_usuario, String ocupacion) {
        Statement st = null;
            boolean flat = false;
            String query = "INSERT INTO docente VALUES ('"+id_persona+"','"+id_usuario+"','"+ocupacion+"')";
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
    public List<Docente> listarDocente() {
        List<Docente> lista = new ArrayList<Docente>();
        Docente docente = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select d.id_docente, p.nombre, p.apellido_pat, p.apellido_mat, p.num_documento, p.direccion, d.ocupacion from docente d, persona p where p.id_persona = d.id_docente";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                docente = new Docente();
                docente.setIdDocente(rs.getString("id_docente"));
                docente.setNombre(rs.getString("nombre"));
                docente.setApellido_pat(rs.getString("apellido_pat"));
                docente.setApellido_mat(rs.getString("apellido_mat"));
                docente.setNumDocumento(rs.getString("num_documento"));
                docente.setDireccion(rs.getString("direccion"));
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

    @Override
    public List<Docente> listarDocenteCampana(String idCamapana) {
        List<Docente> lista = new ArrayList<Docente>();
        Docente docente = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.nombre, p.apellido_pat, p.apellido_mat, d.ocupacion, c.nombre as nombrecurso, ca.nombre as nombrecampana, ca.semestre, a.nombre as nombreaula " +
        "from persona p, docente d, curso c, carga_curso cc, campana ca, aula a " +
        "where p.id_persona = d.id_docente and d.id_docente = cc.id_docente and cc.id_curso = c.id_curso and cc.id_campana = ca.id_campana " +
        "and cc.id_aula = a.id_aula and ca.id_campana = '"+idCamapana+"'";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                docente = new Docente();
                docente.setNombre(rs.getString("nombre"));
                docente.setApellido_pat(rs.getString("apellido_pat"));
                docente.setApellido_mat(rs.getString("apellido_mat"));
                docente.setNombreCurso(rs.getString("nombrecurso"));
                docente.setNombreCampana(rs.getString("nombrecampana"));
                docente.setSemestre(rs.getString("semestre"));
                docente.setOcupacion(rs.getString("ocupacion"));
                docente.setNombreAula(rs.getString("nombreaula"));
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
