package com.svalero.webappcrud.dao;

import com.svalero.webappcrud.domain.User;
import org.jdbi.v3.sqlobject.customizer.Bind;
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

    @SqlQuery("SELECT * FROM user WHERE name = :searchTerm OR surname = :searchTerm")
    @UseRowMapper(UserMapper.class)
    List<User> findUsers(@Bind("searchTerm") String searchTerm);

    @SqlQuery("SELECT * FROM user WHERE userID = ?")
    @UseRowMapper(UserMapper.class)
    User getUser (int id);

    @SqlQuery("SELECT * FROM user WHERE username = ? AND pass = SHA1(?)")
    @UseRowMapper(UserMapper.class)
    User getUserLog(String username, String pass);

    @SqlUpdate("INSERT INTO user (username, pass, email, name, surname, address, mobile, register, role) VALUES (?,SHA1(?),?,?,?,?,?,?,?)")
    int addUser(String username, String pass, String email, String name, String surname, String address, String mobile, Date register, String role);

    @SqlUpdate("DELETE FROM user WHERE userID = ?")
    int removeUser(int userID);

    @SqlUpdate("UPDATE user SET username = ?, email = ?, name = ?, surname = ?, address = ?, mobile = ?, role = ? WHERE userID = ?")
    int updateUser(String username, String email, String name, String surname, String address, String mobile, String role, int userID);

}
