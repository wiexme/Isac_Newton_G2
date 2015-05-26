/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
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
    public boolean inscribirAlumno(Alumno alumno, Persona persona) {
        Statement st = null;
            boolean flat = false;
            String query = "INSERT INTO alumno VALUES ('"+persona.getIdPersona()+"', '"+alumno.getCodigoAlumno()+"')";
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
