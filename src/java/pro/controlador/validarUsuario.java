package pro.controlador;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pro.modelo.dao.impl.usuarioDaoImpl;
import pro.modelo.dao.usuarioDao;

/**
 *
 * @author WIEXME
 */
public class validarUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String usuario = request.getParameter("usuario"); usuario = usuario == null?"":usuario;
        String password = request.getParameter("password"); password = password == null?"":password;
        String idUsuario = "";
        
        usuarioDao dao = new usuarioDaoImpl();
        
        if (dao.validarUsuario(usuario, password)!=null) {
            HttpSession session = request.getSession();
            session.setAttribute("idUsuario", dao.validarUsuario(usuario, password));
            
            idUsuario = dao.validarUsuario(usuario, password);
            
            
            request.setAttribute("user", dao.mostrarUsuario(idUsuario));
            request.setAttribute("usuario", usuario);//seteo de atributos desde un formulario.
            
            request.getRequestDispatcher("inicio.jsp").forward(request, response);
            
        } else {
            request.getRequestDispatcher("alertas.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
