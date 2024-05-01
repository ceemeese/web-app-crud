package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.Color;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface ColorDao {

    @SqlQuery("SELECT * FROM color")
    @UseRowMapper(ColorMapper.class)
    List<Color> getAllColors();

    @SqlQuery("SELECT * FROM color WHERE name = ?")
    @UseRowMapper(ColorMapper.class)
    Color getIdColor(String name);

    @SqlQuery("SELECT * FROM color WHERE colorID = ?")
    @UseRowMapper(ColorMapper.class)
    Color getColor (int id);

}
