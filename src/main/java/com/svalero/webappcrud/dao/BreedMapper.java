package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.Breed;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BreedMapper implements RowMapper<Breed> {

    @Override
    public Breed map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Breed(rs.getInt("breedID"),
                rs.getString("name"),
                rs.getString("description"),
                rs.getString("image"));
    }
}
