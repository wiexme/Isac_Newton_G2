/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.dao.impl;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import pro.modelo.dao.campanaDao;
import pro.modelo.entidad.Campana;
import pro.modelo.util.HibernateUtil;

/**
 *
 * @author WIEXME
 */
public class campanaDaoImpl implements campanaDao{

    @Override
    public boolean registrarAula(Campana campana) {
        boolean flat = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction transaction = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session =  sf.openSession();
            transaction = session.beginTransaction();
            session.save(campana);
            transaction.commit();
            session.close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            session.close();
            flat = false;
        }
        return flat;
    }

    @Override
    public List<Campana> listarCampana() {
        List<Campana> lista = null;
        SessionFactory sf = null;
        Session session = null;
        Criteria criteria = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            criteria = session.createCriteria(Campana.class);
            lista = criteria.list();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

    @Override
    public boolean actualizarCampana(Campana campana) {
        boolean flat = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction transaction = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session =  sf.openSession();
            transaction = session.beginTransaction();
            
            Campana caUpdate = (Campana)session.get(Campana.class, campana.getIdCampana());
            caUpdate.setNombre(campana.getNombre());
            caUpdate.setSemestre(campana.getSemestre());
            caUpdate.setFechaInicio(campana.getFechaInicio());
            caUpdate.setFechaFin(campana.getFechaFin());
            caUpdate.setEstado(campana.getEstado());
            session.update(caUpdate);
            transaction.commit();
            session.close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            session.close();
            flat = false;
        }
        return flat;
    }

    @Override
    public boolean eliminarCampana(String campana) {
         boolean flat = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction transaction = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session =  sf.openSession();
            transaction = session.beginTransaction();
            
            Campana caDelete = (Campana)session.get(Campana.class,campana);
            session.delete(caDelete);
            transaction.commit();
            session.close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            session.close();
            flat = false;
        }
        return flat;
    }

    @Override
    public Campana buscarCampana(String idCampana) {
        Campana campana = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            Query query = session.createQuery("FROM Campana WHERE idCampana = '"+idCampana+"'");
            campana = (Campana)query.uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return campana; 
    }
    
}
