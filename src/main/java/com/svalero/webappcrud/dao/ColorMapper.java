package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.Color;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ColorMapper implements RowMapper<Color> {

    @Override
    public Color map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Color(rs.getInt("id_color"),
                rs.getString("nombre_color"),
                rs.getString("descripcion_color"));
    }
}
