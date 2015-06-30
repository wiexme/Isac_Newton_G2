/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro.modelo.entidad;

import java.util.Date;

/**
 *
 * @author WIEXME
 */
public class Asistencia {
    private String idCampana;
    private String idCargaCurso;
    private Date fechaHora;
    private String control;
    private String apreciacion;
    private String idAlumno;
    private String nombre;
    private String apellidoPat;
    private String apellidoMat;
    

    public Asistencia() {
    }

    public Asistencia(String idCampana, String idCargaCurso, Date fechaHora) {
        this.idCampana = idCampana;
        this.idCargaCurso = idCargaCurso;
        this.fechaHora = fechaHora;
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

    public Date getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public String getControl() {
        return control;
    }

    public void setControl(String control) {
        this.control = control;
    }

    public String getApreciacion() {
        return apreciacion;
    }

    public void setApreciacion(String apreciacion) {
        this.apreciacion = apreciacion;
    }

    public String getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(String idAlumno) {
        this.idAlumno = idAlumno;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidoPat() {
        return apellidoPat;
    }

    public void setApellidoPat(String apellidoPat) {
        this.apellidoPat = apellidoPat;
    }

    public String getApellidoMat() {
        return apellidoMat;
    }

    public void setApellidoMat(String apellidoMat) {
        this.apellidoMat = apellidoMat;
    }
    
    
}
