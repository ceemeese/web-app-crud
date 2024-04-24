package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.Color;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface ColorDao {

    @SqlQuery("SELECT * FROM COLOR")
    @UseRowMapper(ColorMapper.class)
    List<Color> getAllColors();

}
