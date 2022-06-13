package org.palacios.apiservelet.webapp.controller.repositories;

import java.sql.SQLException;
import java.util.List;

//!Encargaado de administrat los cambios de LAS tablas --> muchos datos distintos -> generico
public interface Repository<T> {
    //execute query
    List<T> listar() throws SQLException;
    T busquedaId(Long id)  throws SQLException;
    //execute update
    void guardar(T t) throws SQLException;
    void eliminar(Long id) throws SQLException;

}
