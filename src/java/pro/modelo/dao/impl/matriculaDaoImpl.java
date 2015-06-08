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
        String query = "INSERT INTO matricula VALUES ('"+id_alumno+"','"+id_campana+"', sysdate, '"+cod_matricula+"', '"+id_usuario+"')";
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
