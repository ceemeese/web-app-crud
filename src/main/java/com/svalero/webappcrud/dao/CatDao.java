package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.Cat;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface CatDao {

    @SqlQuery("SELECT * FROM Gatos")
    @UseRowMapper(CatMapper.class)
    List<Cat> getAllCats();

    @SqlUpdate("INSERT INTO Gatos (nombre, edad) VALUES (?,?)")
    int addCat(String name, int age);
}
