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

    static mapping = {
        firstName index:"firstName_idx"
        lastName index:"lastName_idx"
        phone index:"phone_idx"
        email index:"email_idx"
    }

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
        def criteria = Patient.createCriteria()
        return criteria.list(search.paramMap) {
            if(search.firstName)
                ilike("firstName","${search.firstName}%")
            if(search.lastName)
                ilike("lastName","${search.lastName}%")
            if(search.phone)
                ilike("phone","${search.phone}%")
        }

    }

    String getName(){
        if(lastName)
            firstName+" "+lastName
        else firstName
    }
}
