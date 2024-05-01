package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.Gender;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class GenderMapper implements RowMapper<Gender> {

    @Override
    public Gender map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Gender(rs.getInt("genderID"),
                rs.getString("name"));
    }
}
