/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package consola;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import pro.modelo.dao.alumnoDao;
import pro.modelo.dao.aulaDao;
import pro.modelo.dao.cargaCursoDao;
import pro.modelo.dao.impl.alumnoDaoImpl;
import pro.modelo.dao.impl.aulaDaoImpl;
import pro.modelo.dao.impl.cargaCursoDaoImpl;
import pro.modelo.dao.impl.personaDaoImpl;
import pro.modelo.dao.impl.tipoDocumentoDaoImpl;
import pro.modelo.dao.impl.usuarioDaoImpl;
import pro.modelo.dao.personaDao;
import pro.modelo.dao.tipoDocumentoDao;
import pro.modelo.dao.usuarioDao;
import pro.modelo.entidad.Alumno;
import pro.modelo.entidad.Aula;
import pro.modelo.entidad.Docente;
import pro.modelo.entidad.Persona;
import pro.modelo.entidad.TipoDocumento;
import pro.modelo.entidad.Ubigeo;
import pro.modelo.entidad.Usuario;

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
//       main.listar();
//       main.validar();
//       main.verUsuario();
//       main.agregarDocumento();
//       main.Update();
//       main.agregarAula();

       
        Calendar calendario = Calendar.getInstance();
        Calendar cal = new GregorianCalendar();
        System.out.println(date());
        System.out.println(date().subSequence(0, 4)+""+date().substring(5, 7)+""+date().substring(8, 10)+""+calendario.get(Calendar.HOUR_OF_DAY)+""+calendario.get(Calendar.MINUTE));
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
     public void listar(){
         cargaCursoDao dao = new cargaCursoDaoImpl();
        for(Docente docente: dao.listarDocente()){
         System.out.println("ID: "+docente.getIdDocente()+" NOMBRE:"+docente.getNombre()+" APELLIDO PAT "+docente.getApellido_pat()+" APELLIDO MAT "+docente.getApellido_mat()+" OCUPACION "+docente.getOcupacion());
        }
    
}
     
     public  void validar(){
    usuarioDao dao = new usuarioDaoImpl();
    String id_usuario = "";
    
    id_usuario = dao.validarUsuario("jany", "77665433");
        System.out.println("ID: "+id_usuario);
    }
    
    public void verUsuario(){
    usuarioDao dao = new usuarioDaoImpl();
    Usuario usuario = new Usuario();
    usuario = dao.mostrarUsuario("A-JAN0206201517572669");
        System.out.println("id: "+usuario.getIdUsuario()+" usuario: "+usuario.getLoggin()+" password: "+usuario.getPassword()+" estado: "+usuario.getEstado()+" nombre: "+usuario.getNombre()+" apellidoPat: "+usuario.getApellidoPat()+" apellidoMat: "+usuario.getApellidoMat());
    }
    
    public void agregarDocumento(){
        tipoDocumentoDao dao = new tipoDocumentoDaoImpl();
        TipoDocumento td = new TipoDocumento();
        
        td.setIdTipodocumento("");
        td.setNombre("Maria");
        if (dao.registrarTipoDocumento(td)) {
            System.out.println("Se agrego el Cliente...");
            
        } else {
            System.out.println("No se agrego el Cliente...");
        }
    }
    
    public void Update(){
         tipoDocumentoDao dao = new tipoDocumentoDaoImpl();
         TipoDocumento td = new TipoDocumento();
        
            td.setIdTipodocumento("A-ASD0806201512354840");
            td.setNombre("asf");
        
        if (dao.actualizarTipoDocumento(td)) {
            System.out.println("Se modifico la cliente...");
            
        } else {
            System.out.println("No se modifico el cliente");
        }
    }
    
    public void agregarAula(){
        aulaDao dao = new aulaDaoImpl();
        Aula aula = new Aula();
        
        aula.setIdAula("");
        aula.setNombre("Maria");
        aula.setDescripcion("");
        aula.setEstado("1");
        if (dao.registrarAula(aula)) {
            System.out.println("Se agrego el Cliente...");
            
        } else {
            System.out.println("No se agrego el Cliente...");
        }
    }
}
