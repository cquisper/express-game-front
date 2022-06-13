package org.palacios.apiservelet.webapp.controller.controlers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet({"/form-ingresar", "/form-ingresar.html"})
public class IngresarServelet extends HttpServlet {
    //prueba
    final static String USERNAME = "admin";
    final static String PASSWORD = "12345";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username"); //optenemos el valor que se le haya dado desde el formulario de ingreso
        String password = req.getParameter("password");
        //! Sustiturir luego con una recorrido de la base de datos
        if(USERNAME.equals(username) && PASSWORD.equals(password)){
            //! Establecemos la sesion del usuario  -> es global y esta disponibleparatoods los request
            HttpSession sesion = req.getSession(); //Guarda opbejetos
            sesion.setAttribute("username", username); //para agregar valores  a la sesion se le pasa llave y valor
            //! Servidor ->Redireccionar a la pagina del login mismo pero con la respuesta
            resp.sendRedirect(req.getContextPath()+ "/ingresar.html");
        }else{
            //si algo ta mal botar error -> muchos errores puedes buscar lso que te gusten puedesponerle incluso numeros
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Error, no puede acceder en este momento");
        }

    }
}
