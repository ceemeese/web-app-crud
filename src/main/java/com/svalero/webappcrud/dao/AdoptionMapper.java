package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.Adoption;
import com.svalero.webappcrud.domain.Cat;
import com.svalero.webappcrud.domain.StatusAdoption;
import com.svalero.webappcrud.domain.User;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AdoptionMapper implements RowMapper<Adoption> {

    @Override
    public Adoption map(ResultSet rs, StatementContext ctx) throws SQLException {

        User user = Database.jdbi.withExtension(UserDao.class, dao-> dao.getUser(rs.getInt("userID")));
        Cat cat = Database.jdbi.withExtension(CatDao.class, dao-> dao.getCat(rs.getInt("catID")));
        StatusAdoption status_adoption = Database.jdbi.withExtension(StatusAdoptionDao.class, dao-> dao.getStatusAdoption(rs.getInt("statusAdoptionID")));


        return new Adoption(rs.getInt("adoptionID"),
                rs.getDate("dateAdoption"),
                rs.getString("infoAdoption"),
                user,
                cat,
                status_adoption
        );
    }
}
