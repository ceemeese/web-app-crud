package com.svalero.webappcrud.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Adoption {

    private int adoptionID;
    private Date dateAdoption;
    private String infoAdoption;
    private User userID;
    private Cat catID;
    private StatusAdoption statusAdoptionID;
}

