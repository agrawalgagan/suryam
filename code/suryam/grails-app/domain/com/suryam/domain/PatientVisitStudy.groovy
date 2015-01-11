package com.suryam.domain

class PatientVisitStudy {

	Study study
	Float cost
	
	static belongsTo = [patientVisit : PatientVisit]
	
    static constraints = {
    }
}
