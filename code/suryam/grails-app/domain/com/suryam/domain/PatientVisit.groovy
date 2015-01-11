package com.suryam.domain

import javax.persistence.Transient;

class PatientVisit {

    Date appointmentTime = new Date()
    Date arrivalTime
    Doctor referringDoctor
    Date reportTime
    VisitStatus status = VisitStatus.APPOINTMENT_TAKEN
	Float discount = 0.0
	@Transient
	Float totalCost = 0.0
	Float amountPaid = 0.0
	Float amountPending = 0.0
 
    static belongsTo = [patient : Patient]
    static hasMany = [visitStudies : PatientVisitStudy]
	
	static transients = ["totalCost","amountPending"]

    static constraints = {
        reportTime nullable: true
    }
	
	Float getTotalCost(){
		Float total = 0.0
		if(visitStudies!=null){
			for(PatientVisitStudy visitStudy : visitStudies){
				total += visitStudy.study.cost
			}
			total = total - discount
		}
		total
	}
	
	Float getAmountPending(){
		getTotalCost()-amountPaid
	}
}
