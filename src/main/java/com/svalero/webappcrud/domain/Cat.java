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

    private int idCat;
    private String name;
    private int age;
    private String description;
    private String image;
    private int idGender;
    private int idBreed;
    private int idColor;
    private int idState;
    private int idUser;
    private Date admissionDate;
    private Date dateUpdate;
    private String location;
}
