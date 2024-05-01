package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.Gender;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface GenderDao {

    @SqlQuery("SELECT * FROM gender")
    @UseRowMapper(GenderMapper.class)
    List<Gender> getAllGenders();

    @SqlQuery("SELECT * FROM gender WHERE name = ?")
    @UseRowMapper(GenderMapper.class)
    Gender getIdGender(String name);

    @SqlQuery("SELECT * FROM gender WHERE genderID = ?")
    @UseRowMapper(GenderMapper.class)
    Gender getGender (int id);
}
