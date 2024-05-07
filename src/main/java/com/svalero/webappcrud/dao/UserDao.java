package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.User;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.sql.Date;
import java.util.List;

public interface UserDao {

    @SqlQuery("SELECT * FROM user")
    @UseRowMapper(UserMapper.class)
    List<User> getAllUsers();

    @SqlQuery("SELECT * FROM user WHERE username = ?")
    @UseRowMapper(UserMapper.class)
    User getIdUser(String name);

    @SqlQuery("SELECT * FROM user WHERE userID = ?")
    @UseRowMapper(UserMapper.class)
    User getUser (int id);

    @SqlUpdate("INSERT INTO user (username, pass, email, name, surname, address, mobile, register) VALUES (?,?,?,?,?,?,?,?)")
    int addUser(String username, String pass, String email, String name, String surname, String address, String mobile, Date register);

    @SqlUpdate("DELETE FROM user WHERE userID = ?")
    int removeUser(int userID);
}
