package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.*;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CatMapper implements RowMapper<Cat> {



    @Override
    public Cat map(ResultSet rs, StatementContext ctx) throws SQLException {

        Gender gender = Database.jdbi.withExtension(GenderDao.class, dao-> dao.getGender(rs.getInt("genderID")));
        Breed breed = Database.jdbi.withExtension(BreedDao.class, dao-> dao.getBreed(rs.getInt("breedID")));
        Color color = Database.jdbi.withExtension(ColorDao.class, dao-> dao.getColor(rs.getInt("colorID")));
        State state = Database.jdbi.withExtension(StateDao.class, dao-> dao.getState(rs.getInt("stateID")));


        return new Cat(rs.getInt("catID"),
                rs.getString("name"),
                rs.getInt("age"),
                rs.getString("description"),
                rs.getString("image"),
                gender,
                breed,
                color,
                state,
                rs.getInt("userID"),
                rs.getString("location")
        );
    }
}


