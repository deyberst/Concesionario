/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udea.servlets;

import com.udea.ejb.ClienteFacadeLocal;
import com.udea.ejb.VehiculoFacadeLocal;
import com.udea.ejb.VentaFacadeLocal;
import com.udea.entity.Cliente;
import com.udea.entity.ClientePK;
import com.udea.entity.Vehiculo;
import com.udea.entity.Venta;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author G1
 */
public class VentaServlet extends HttpServlet {

    @EJB
    private VehiculoFacadeLocal vehiculoFacade;

    @EJB
    private ClienteFacadeLocal clienteFacade;

    @EJB
    private VentaFacadeLocal ventaFacade;

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
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        String url = "Ventas_Generales.jsp";
        try (PrintWriter out = response.getWriter()) {
            if ("list".equals(action)) {
                List<Venta> findAll = ventaFacade.findAll();
                request.getSession().setAttribute("ventas", findAll);
            } else if ("insert".equals(action)) {
                ClientePK pk = new ClientePK(request.getParameter("tipoDoc"),request.getParameter("numero"));
                Cliente ci = clienteFacade.find(pk);
                Vehiculo v = vehiculoFacade.find(request.getParameter("matricula"));
                if(v != null && ci != null){
                    Venta c = new Venta();
                    c.setIdVenta(request.getParameter("idVenta"));
                    c.setFechaventa(formatter.parse(request.getParameter("fechaVenta")));
                    c.setMatricula(request.getParameter("matricula"));
                    c.setNumCliente(request.getParameter("numero"));
                    c.setTipoDoc(request.getParameter("tipoDoc"));
                    c.setPrecio(Integer.parseInt(request.getParameter("precio")));
                    ventaFacade.create(c);
                }                
            } else if ("delete".equals(action)) {
                Venta c = ventaFacade.find(request.getParameter("idVenta"));
                ventaFacade.remove(c);
                url = "VentaServlet?action=list";
            } else if ("update".equals(action)) {
                String pk = request.getParameter("idVenta");
                try{
                    Venta c = ventaFacade.find(pk); 
                    c.setFechaventa(formatter.parse(request.getParameter("fechaVenta")));
                    c.setMatricula(request.getParameter("matricula"));
                    c.setNumCliente(request.getParameter("numero"));
                    c.setTipoDoc(request.getParameter("tipoDoc"));
                    c.setPrecio(Integer.parseInt(request.getParameter("precio")));
                    ventaFacade.edit(c);
                } catch(Exception e){
                    System.out.println("Error al editar: "+ e.getMessage());                    
                }
            }
            response.sendRedirect(url);
        } catch (ParseException ex) {
            Logger.getLogger(VentaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
