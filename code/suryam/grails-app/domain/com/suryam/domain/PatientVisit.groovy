package com.suryam.domain

class PatientVisit {

    Date appointmentTime
    Date arrivalTime
    Doctor referringDoctor
    Date reportTime
    VisitStatus status = VisitStatus.APPOINTMENT_TAKEN
    static belongsTo = [patient : Patient]

    static constraints = {
        reportTime nullable: true
    }
}
