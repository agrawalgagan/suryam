package com.suryam.domain

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_PATIENT_READ'])
class PatientVisitController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PatientVisit.list(params), model: [patientVisitInstanceCount: PatientVisit.count()]
    }

    def list(Patient patient) {
        if(!params.sort){
            params.sort = "appointmentTime"
            params.order = "desc"
        }
        def patientVisits = PatientVisit.findAllByPatient(patient, params)
        respond patientVisits, model: [patientVisitInstanceList:patientVisits, patientVisitInstanceCount: patientVisits.size(), patient : patient], view:"list"
    }

    def show(PatientVisit patientVisitInstance) {
        respond patientVisitInstance
    }

    @Secured(['ROLE_PATIENT_WRITE'])
    def create() {
        respond new PatientVisit(params)
    }

    @Secured(['ROLE_PATIENT_WRITE'])
    @Transactional
    def save(PatientVisit patientVisitInstance) {
        if (patientVisitInstance == null) {
            notFound()
            return
        }

        if (patientVisitInstance.hasErrors()) {
            respond patientVisitInstance.errors, view: 'create'
            return
        }
		setStudies(params.studys, patientVisitInstance)
		
        patientVisitInstance.save flush: true
        list(patientVisitInstance.patient)
    }

	private setStudies(def studys, PatientVisit patientVisitInstance) {
		if(studys!=null){
			studys.each{
				Study study = Study.get(it)
				if(study!=null){
					patientVisitInstance.addToVisitStudies(new PatientVisitStudy(study : study, cost : study.cost))
				}
			}
		}
	}

    @Secured(['ROLE_PATIENT_WRITE'])
    def edit(PatientVisit patientVisitInstance) {
        respond patientVisitInstance
    }

    @Transactional
    @Secured(['ROLE_PATIENT_WRITE'])
    def update(PatientVisit patientVisitInstance) {
        if (patientVisitInstance == null) {
            notFound()
            return
        }

        if (patientVisitInstance.hasErrors()) {
            respond patientVisitInstance.errors, view: 'edit'
            return
        }

		def existingStudies = []
		def removedStudies = []
		patientVisitInstance.visitStudies.each{
			//existingStudyCostMap.put(it.study, it.study.cost)
			if(!params.studys.contains(it.study)){
				it.delete()
				removedStudies << it
				//patientVisitInstance.visitStudies.remove(it)
			}	
			else
				existingStudies << it.study
		}
		removedStudies.each {
			patientVisitInstance.visitStudies.remove(it)
		}
		def newStudies = params.studys.minus(existingStudies)
		//patientVisitInstance.visitStudies.clear()
		//patientVisitInstance.save flush: true
		setStudies(newStudies, patientVisitInstance)
        patientVisitInstance.save flush: true
		list(patientVisitInstance.patient)

        /*request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PatientVisit.label', default: 'PatientVisit'), patientVisitInstance.id])
                redirect patientVisitInstance
            }
            '*' { respond patientVisitInstance, [status: OK] }
        }*/
    }

    @Transactional
    @Secured(['ROLE_PATIENT_WRITE'])
    def delete(PatientVisit patientVisitInstance) {

        if (patientVisitInstance == null) {
            notFound()
            return
        }

        patientVisitInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PatientVisit.label', default: 'PatientVisit'), patientVisitInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'patientVisit.label', default: 'PatientVisit'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
