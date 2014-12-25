package com.suryam.domain

import javax.persistence.Transient;

class PatientVisit {

    Date appointmentTime = new Date()
    Date arrivalTime
    Doctor referringDoctor
    Date reportTime
    VisitStatus status = VisitStatus.APPOINTMENT_TAKEN
	Float discount
	@Transient
	Float totalCost
	Float amountPaid
	Float amountPending
 
    static belongsTo = [patient : Patient]
    static hasMany = [studies : Study]
	
	static transients = ["totalCost","amountPending"]

    static constraints = {
        reportTime nullable: true
    }
	
	Float getTotalCost(){
		Float total = 0.0
		if(studies!=null){
			for(Study study : studies){
				total += study.cost
			}
			total = total - discount
		}
		total
	}
	
	Float getAmountPending(){
		getTotalCost()-amountPaid
	}
}
