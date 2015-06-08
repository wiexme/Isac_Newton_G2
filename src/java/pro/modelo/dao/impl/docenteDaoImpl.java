/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import pro.modelo.dao.docenteDao;
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
    
}
