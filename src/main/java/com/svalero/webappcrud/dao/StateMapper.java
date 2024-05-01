package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.State;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StateMapper implements RowMapper<State> {

    @Override
    public State map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new State(rs.getInt("stateID"),
                rs.getString("name"));
    }
}