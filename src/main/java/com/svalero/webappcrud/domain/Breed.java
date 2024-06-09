package com.svalero.webappcrud.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Breed {

    private int breedID;
    private String name;
    private String description;
    private String image;

}

