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
import pro.modelo.dao.alumnoDao;
import pro.modelo.entidad.Alumno;
import pro.modelo.entidad.Persona;
import pro.modelo.util.ConexionOracle;

/**
 *
 * @author WIEXME
 */
public class alumnoDaoImpl implements alumnoDao{
    public Connection conecta(){
        return ConexionOracle.conectar();
    }

    @Override
    public boolean inscribirAlumno(String id_persona, String codigo) {
        Statement st = null;
            boolean flat = false;
            String query = "INSERT INTO alumno VALUES ('"+id_persona+"','')";
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
    public List<Alumno> listarAlumno() {
        List<Alumno> lista = new ArrayList<Alumno>();
        Alumno alumno = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select a.id_alumno, p.nombre, p.apellido_pat, p.apellido_mat, p.num_documento, p.direccion, a.codigo_alumno from alumno a, persona p where p.id_persona = a.id_alumno";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                alumno = new Alumno();
                alumno.setIdAlumno(rs.getString("id_alumno"));
                alumno.setNombre(rs.getString("nombre"));
                alumno.setApellidoPat(rs.getString("apellido_pat"));
                alumno.setApellidoMat(rs.getString("apellido_mat"));
                alumno.setNumDocumento(rs.getString("num_documento"));
                alumno.setDireccion(rs.getString("direccion"));
                alumno.setCodigoAlumno(rs.getString("codigo_alumno"));
                lista.add(alumno);
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
