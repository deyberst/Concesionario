/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udea.servlets;

import com.udea.entity.Cliente;
import com.udea.ejb.ClienteFacadeLocal;
import com.udea.entity.ClientePK;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author G1
 */
public class ClienteServlet extends HttpServlet {

    @EJB
    private ClienteFacadeLocal clienteFacade;

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

        String action = request.getParameter("action");
        String url = "Clientes.jsp";
        try (PrintWriter out = response.getWriter()) {
            if ("list".equals(action)) {
                List<Cliente> findAll = clienteFacade.findAll();
                request.getSession().setAttribute("clientes", findAll);
            } else if ("insert".equals(action)) {
                Cliente c = new Cliente();
                ClientePK pk = new ClientePK(request.getParameter("tipoDoc"), request.getParameter("numero"));
                c.setClientePK(pk);
                c.setDireccion(request.getParameter("direccion"));
                c.setNombre(request.getParameter("nombre"));
                c.setTelefono(request.getParameter("telefono"));
                clienteFacade.create(c);
            } else if ("delete".equals(action)) {
                ClientePK pk = new ClientePK(request.getParameter("tipoDoc"), request.getParameter("numero"));
                Cliente c = clienteFacade.find(pk);
                clienteFacade.remove(c);
                url = "ClienteServlet?action=list";
            } else if ("update".equals(action)) {
                ClientePK pk = new ClientePK(request.getParameter("tipoDoc"), request.getParameter("numero"));
                try{
                    Cliente c = clienteFacade.find(pk); 
                    c.setDireccion(request.getParameter("direccion"));
                    c.setNombre(request.getParameter("nombre"));
                    c.setTelefono(request.getParameter("telefono"));
                    clienteFacade.edit(c);
                } catch(Exception e){
                    System.out.println("Error al editar: "+ e.getMessage());
                    
                }
            }
            response.sendRedirect(url);
        } finally {
            System.out.close();
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
