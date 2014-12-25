package com.suryam.domain

class PatientVisit {

    Date appointmentTime = new Date()
    Date arrivalTime
    Doctor referringDoctor
    Date reportTime
    VisitStatus status = VisitStatus.APPOINTMENT_TAKEN
 
    static belongsTo = [patient : Patient]
    static hasMany = [studies : Study]

    static constraints = {
        reportTime nullable: true
    }
}
