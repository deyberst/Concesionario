/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udea.servlets;

import com.udea.entity.Vehiculo;
import com.udea.ejb.VehiculoFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class VehiculoServlet extends HttpServlet {

    @EJB
    private VehiculoFacadeLocal vehiculoFacade;

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
        String url = "Vehiculos.jsp";
        try (PrintWriter out = response.getWriter()) {
            if ("insert".equals(action)) {
                Vehiculo c = new Vehiculo();
                c.setCilindraje(request.getParameter("cilindraje"));
                c.setColor(request.getParameter("color"));
                c.setMarca(request.getParameter("marca"));
                c.setMatricula(request.getParameter("matricula"));
                c.setTipoCarro(request.getParameter("tipo"));                             
                vehiculoFacade.create(c);                
            }
            else if("update".equals(action)){
                try{
                    Vehiculo c = vehiculoFacade.find(request.getParameter("matricula"));
                    c.setCilindraje(request.getParameter("cilindraje"));
                    c.setColor(request.getParameter("color"));
                    c.setMarca(request.getParameter("marca"));                    
                    c.setTipoCarro(request.getParameter("tipo"));                              
                    vehiculoFacade.edit(c);
                }catch(Exception e){
                    System.out.println("Error al editar: "+ e.getMessage());
                }
                url = "VehiculoServlet?action=list";
                  
            }else if("delete".equals(action)){
                Vehiculo v = vehiculoFacade.find(request.getParameter("matricula"));
                vehiculoFacade.remove(v);
            }else if("list".equals(action)){
                List<Vehiculo> findAll = vehiculoFacade.findAll();
                request.getSession().setAttribute("vehiculos", findAll);
                
            }else if("buscar".equals(action)){
                List<Vehiculo> find = new ArrayList<Vehiculo>();                                    
                Vehiculo c = vehiculoFacade.find(request.getParameter("matricula")); 
                if(c !=null){
                    find.add(c);
                }

                request.getSession().setAttribute("vehiculo",find);
            }    
            response.sendRedirect(url);
        } finally{
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
