package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.StatusAdoption;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StatusAdoptionMapper implements RowMapper<StatusAdoption> {

    @Override
    public StatusAdoption map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new StatusAdoption(rs.getInt("statusAdoptionID"),
                rs.getString("name"));
    }
}