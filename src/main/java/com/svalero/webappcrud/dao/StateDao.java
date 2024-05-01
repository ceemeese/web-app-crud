package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.State;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface StateDao {
    @SqlQuery("SELECT * FROM state")
    @UseRowMapper(StateMapper.class)
    List<State> getAllStates();

    @SqlQuery("SELECT * FROM state WHERE name = ?")
    @UseRowMapper(StateMapper.class)
    State getIdState(String name);

    @SqlQuery("SELECT * FROM state WHERE stateID = ?")
    @UseRowMapper(StateMapper.class)
    State getState (int id);
}
