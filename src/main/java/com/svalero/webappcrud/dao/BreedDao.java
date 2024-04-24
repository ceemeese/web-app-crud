package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.Breed;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface BreedDao {

    @SqlQuery("SELECT * FROM RAZA")
    @UseRowMapper(BreedMapper.class)
    List<Breed> getAllBreeds();

}
