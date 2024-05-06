package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.Cat;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface CatDao {

    @SqlQuery("SELECT * FROM cat")
    @UseRowMapper(CatMapper.class)
    List<Cat> getAllCats();

    @SqlQuery("SELECT * FROM cat WHERE catID = ?")
    @UseRowMapper(CatMapper.class)
    Cat getCat(int catID);

    @SqlUpdate("INSERT INTO cat (name, age) VALUES (?,?)")
    int addCat(String name, int age);

    @SqlUpdate("INSERT INTO cat (name, age, description, image, genderID, breedID, colorID, stateID, location) VALUES (?,?,?,?,?,?,?,?,?)")
    int addCat(String name, int age, String description, String image, int genderID, int breedID, int colorID, int stateID, String location);
}
