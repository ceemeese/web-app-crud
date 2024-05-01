package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.Breed;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface BreedDao {

    @SqlQuery("SELECT * FROM breed")
    @UseRowMapper(BreedMapper.class)
    List<Breed> getAllBreeds();

    @SqlQuery("SELECT * FROM breed WHERE name = ?")
    @UseRowMapper(BreedMapper.class)
    Breed getIdBreed(String name);

    @SqlQuery("SELECT * FROM breed WHERE breedID = ?")
    @UseRowMapper(BreedMapper.class)
    Breed getBreed (int id);


}
