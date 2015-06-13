/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.entidad;

/**
 *
 * @author WIEXME
 */
public class CargaMatricula {
    private String idCampana;
    private String idCargaCurso;
    private String idAlumno;

    public CargaMatricula() {
    }

    public CargaMatricula(String idCampana, String idCargaCurso, String idAlumno) {
        this.idCampana = idCampana;
        this.idCargaCurso = idCargaCurso;
        this.idAlumno = idAlumno;
    }

    public String getIdCampana() {
        return idCampana;
    }

    public void setIdCampana(String idCampana) {
        this.idCampana = idCampana;
    }

    public String getIdCargaCurso() {
        return idCargaCurso;
    }

    public void setIdCargaCurso(String idCargaCurso) {
        this.idCargaCurso = idCargaCurso;
    }

    public String getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(String idAlumno) {
        this.idAlumno = idAlumno;
    }
    
    
}
