package com.suryam.domain

import com.suryam.search.PatientSearch
import org.hibernate.Criteria

class Patient {

    String firstName
    String lastName
    String parentName
    Date dob
    Gender gender
    Float height
    Float weight
    String address
    String phone
    String email

    static constraints = {
        lastName nullable: true
        parentName nullable: true
        dob nullable: true
        height nullable: true
        weight nullable: true
        address nullable: true
        email nullable: true
    }

    def static List<Patient> search(PatientSearch search){
        return Patient.withCriteria {
            if(search.firstName)
                ilike("firstName","${search.firstName}%")
            if(search.lastName)
                ilike("lastName","${search.lastName}%")
            if(search.phone)
                ilike("phone","${search.phone}%")
        }

    }

    String name(){
        if(lastName)
            firstName+" "+lastName
        else firstName
    }
}
