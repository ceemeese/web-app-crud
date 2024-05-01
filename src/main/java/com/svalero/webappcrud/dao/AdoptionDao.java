package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.Adoption;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.sql.Date;
import java.util.List;

public interface AdoptionDao {

    @SqlQuery("SELECT * FROM adoption")
    @UseRowMapper(AdoptionMapper.class)
    List<Adoption> getAllAdoptions();

    @SqlQuery("SELECT * FROM adoption WHERE name = ?")
    @UseRowMapper(AdoptionMapper.class)
    Adoption getIdAdoption(String name);

    @SqlQuery("SELECT * FROM adoption WHERE adoptionID = ?")
    @UseRowMapper(AdoptionMapper.class)
    Adoption getAdoption (int id);

    @SqlUpdate("INSERT INTO adoption (dateAdoption, infoAdoption, userID, catID, statusAdoptionID) VALUES (?,?,?,?,?)")
    int addAdoption(Date dateAdoption, String infoAdoption, Integer userID, Integer catID, Integer statusAdoptionID);
}
