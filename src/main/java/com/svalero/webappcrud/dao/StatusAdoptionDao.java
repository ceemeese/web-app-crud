package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.StatusAdoption;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface StatusAdoptionDao {
    @SqlQuery("SELECT * FROM status_adoption")
    @UseRowMapper(StatusAdoptionMapper.class)
    List<StatusAdoption> getAllStatusAdoption();

    @SqlQuery("SELECT * FROM status_adoption WHERE name = ?")
    @UseRowMapper(StatusAdoptionMapper.class)
    StatusAdoption getStatusAdoptionID(String name);

    @SqlQuery("SELECT * FROM status_adoption WHERE statusAdoptionID = ?")
    @UseRowMapper(StatusAdoptionMapper.class)
    StatusAdoption getStatusAdoption (int statusAdoptionID);

}
