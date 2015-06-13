/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import pro.modelo.dao.cargaMatriculaDao;
import pro.modelo.entidad.CargaMatricula;
import pro.modelo.util.ConexionOracle;

/**
 *
 * @author WIEXME
 */
public class cargaMatriculaDaoImpl implements cargaMatriculaDao{
     public Connection conecta(){
        return ConexionOracle.conectar();
    }

    @Override
    public boolean inscribirCargaMatricula(CargaMatricula cargaMatricula) {
        Statement st = null;
        boolean flat = false;
        String query = "BEGIN cargaAlumno('"+cargaMatricula.getIdCampana()+"','"+cargaMatricula.getIdAlumno()+"'); END;";
        System.out.println("BEGIN cargaAlumno('"+cargaMatricula.getIdCampana()+"','"+cargaMatricula.getIdAlumno()+"'); END;");
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
    
}
