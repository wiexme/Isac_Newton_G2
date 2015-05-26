/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package consola;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import pro.modelo.dao.impl.personaDaoImpl;
import pro.modelo.dao.personaDao;
import pro.modelo.entidad.Persona;
import pro.modelo.entidad.Ubigeo;

/**
 *
 * @author WIEXME
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       NewMain main = new NewMain();
//       main.listarubigeo();
        //main.Inert();
       
       
        Calendar calendario = Calendar.getInstance();
        Calendar cal = new GregorianCalendar();
        System.out.println(date());
        System.out.println(date().subSequence(0, 4)+""+date().substring(5, 7)+""+date().substring(8, 10)+""+calendario.get(Calendar.HOUR_OF_DAY)+""+calendario.get(Calendar.MINUTE)+""+calendario.get(Calendar.SECOND)+""+calendario.get(Calendar.MILLISECOND));
    }
    
    public void listarubigeo(){
         personaDao dao = new personaDaoImpl();
        for(Ubigeo ubigeo: dao.listarUbigeo()){
         System.out.println("Ubigeo "+ubigeo.getNombre());
        }
    }
    public void Inert(){
         personaDao dao = new personaDaoImpl();
         Persona per = new Persona();
         
         per.setNombre("Carlos");
         per.setApellidoPat("ma");
         per.setApellidoMat("f");
         per.setGenero("S");
         per.setFechaNacimiento("1995/12/01");
         per.setIdTipoDocumento("A-CAR2405201511035758");
         per.setIdUbigeo("51000000");
         if (dao.registrarPersona(per)) {
            System.out.println("Se agrego la cliente...");
            
        } else {
            System.out.println("No se agrego el cliente");
        }
    }
    
}
