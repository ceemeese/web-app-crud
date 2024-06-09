package com.svalero.webappcrud.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

    private int userID;
    private String username;
    private String pass;
    private String email;
    private String name;
    private String surname;
    private String address;
    private String mobile;
    private Date register;
    private String role;
}

