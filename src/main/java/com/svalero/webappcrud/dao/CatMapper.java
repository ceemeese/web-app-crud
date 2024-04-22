package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.Cat;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.mapper.RowMappers;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class CatMapper implements RowMapper<Cat> {

    @Override
    public Cat map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Cat(rs.getInt("id"),
                rs.getString("name"),
                rs.getInt("age"),
                rs.getString("gender"),
                rs.getString("description"),
                rs.getString("race"),
                rs.getString("color"),
                rs.getString("state"),
                rs.getDate("admissionDate"),
                rs.getInt("id_user"),
                rs.getDate("updateDate"),
                rs.getString("location"),
                rs.getString("picture")
                );
    }
}
