package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.Cat;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CatMapper implements RowMapper<Cat> {

    @Override
    public Cat map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Cat(rs.getInt("id_cat"),
                rs.getString("nombre"),
                rs.getInt("edad"),
                rs.getString("descripcion"),
                rs.getString("imagen"),
                rs.getInt("id_sexo"),
                rs.getInt("id_raza"),
                rs.getInt("id_color"),
                rs.getInt("id_estado"),
                rs.getInt("id_user"),
                rs.getDate("fecha_ingreso"),
                rs.getDate("fecha_actualizacion"),
                rs.getString("localizacion_actual")
                );
    }
}


