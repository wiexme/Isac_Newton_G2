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
import pro.modelo.dao.impl.cargaCursoDaoImpl;

/**
 *
 * @author WIEXME
 */
public class servlet_cargaCurso extends HttpServlet {
    int cont=0;
    String x_contar="";
    String y_contar="";
    String z_contar="";
    String x_cursoID = "";
    String idCampana = "";
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
        x_contar =request.getParameter("x_count");if(x_contar==null)x_contar="";
        y_contar = request.getParameter("y_count");
        z_contar = request.getParameter("z_count");
        idCampana = request.getParameter("idCampana");
        if(!x_contar.equals("")){
            cont = Integer.valueOf(x_contar); 
        }
        PrintWriter out = response.getWriter();
        try {
            if(cont>0){
                for(int z=0; z<=cont; z++){
                    x_cursoID = request.getParameter("idCurso"+z);if(x_cursoID == null) x_cursoID = "";
                    System.out.println("ID"+x_cursoID);
                    if(!x_cursoID.equals("")){
                    new cargaCursoDaoImpl().inscribirCargaCurso(
                            x_cursoID,
                           idCampana,
                           request.getParameter("idAula"+z),
                           request.getParameter("idDocente"+z)
                    );
                }
                }
            }
            request.getRequestDispatcher("inicio.jsp").forward(request, response);
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet servlet_cargaCurso</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet servlet_cargaCurso at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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
