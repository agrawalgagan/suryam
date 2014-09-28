package com.suryam.domain

import com.suryam.search.PatientSearch
import org.hibernate.Criteria

class Patient {

    String name
    String address
    String phone
    Date dob

    static constraints = {
    }

    def static List<Patient> search(PatientSearch search){
        return Patient.withCriteria {
            if(search.name!=null){
                like("name",search.name+"%")
            }
        }

    }
}
