package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.Adoption;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AdoptionMapper implements RowMapper<Adoption> {

    @Override
    public Adoption map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Adoption(rs.getInt("adoptionID"),
                rs.getDate("dateAdoption"),
                rs.getString("infoAdoption"),
                rs.getInt("userID"),
                rs.getInt("catID"),
                rs.getInt("statusAdoptionID"));
    }
}
