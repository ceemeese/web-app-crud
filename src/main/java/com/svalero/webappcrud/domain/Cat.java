package com.svalero.webappcrud.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cat {

    private int id;
    private String name;
    private int age;
    private String gender;
    private String description;
    private String race;
    private String color;
    private String state;
    private Date admissionDate;
    private int id_user;
    private Date updateDate;
    private String location;
    private String picture;

}
