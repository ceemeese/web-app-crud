package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.User;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<User> {

    @Override
    public User map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new User(rs.getInt("userID"),
                rs.getString("username"),
                rs.getString("pass"),
                rs.getString("email"),
                rs.getString("name"),
                rs.getString("surname"),
                rs.getString("address"),
                rs.getString("mobile"),
                rs.getDate("register"),
                rs.getString("role"));
    }
}
