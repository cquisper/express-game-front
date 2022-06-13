package org.palacios.apiservelet.webapp.controller.controlers;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

//para tener una clase servelet debes eredar
@WebServlet("/form-registrar")
public class RegistrarServelet extends HttpServlet {
    //! Implementando el o los metodos a usar

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //datos ficticios para poder trabajar

    }
}
