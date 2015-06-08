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
import pro.modelo.dao.tipoDocumentoDao;
import pro.modelo.entidad.TipoDocumento;
import pro.modelo.util.HibernateUtil;

/**
 *
 * @author WIEXME
 */
public class tipoDocumentoDaoImpl implements tipoDocumentoDao{

    @Override
    public boolean registrarTipoDocumento(TipoDocumento tipodocumento) {
        boolean flat = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction transaction = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session =  sf.openSession();
            transaction = session.beginTransaction();
            session.save(tipodocumento);
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
    public List<TipoDocumento> listarTipoDocumento() {
        List<TipoDocumento> lista = null;
        SessionFactory sf = null;
        Session session = null;
        Criteria criteria = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            criteria = session.createCriteria(TipoDocumento.class);
            lista = criteria.list();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

    @Override
    public boolean actualizarTipoDocumento(TipoDocumento tipoDocumento) {
        boolean flat = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction transaction = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session =  sf.openSession();
            transaction = session.beginTransaction();
            
            TipoDocumento tdUpdate = (TipoDocumento)session.get(TipoDocumento.class, tipoDocumento.getIdTipodocumento());
            tdUpdate.setNombre(tipoDocumento.getNombre());
            session.update(tdUpdate);
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
    public boolean eliminarTipoDocumento(String tipodocumento) {
        boolean flat = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction transaction = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session =  sf.openSession();
            transaction = session.beginTransaction();
            
            TipoDocumento tdDelete = (TipoDocumento)session.get(TipoDocumento.class,tipodocumento);
            session.delete(tdDelete);
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
    public TipoDocumento buscarTipoDocumento(String idTipoDocumento) {
        TipoDocumento tipodocumento = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            Query query = session.createQuery("FROM TipoDocumento WHERE idTipodocumento = '"+idTipoDocumento+"'");
            tipodocumento = (TipoDocumento)query.uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return tipodocumento; 
    }
    
}
