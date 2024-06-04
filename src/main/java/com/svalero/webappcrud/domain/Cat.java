package com.svalero.webappcrud.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cat {

    private int catID;
    private String name;
    private int age;
    private String description;
    private String image;
    private Gender genderID;
    private Breed breedID;
    private Color colorID;
    private State stateID;
    private String location;
}
