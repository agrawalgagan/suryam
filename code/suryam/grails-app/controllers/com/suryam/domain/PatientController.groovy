package com.suryam.domain

import com.suryam.search.PatientSearch
import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_PATIENT_READ'])
class PatientController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Patient.list(params), model: [patientInstanceCount: Patient.count()]
    }

    def show(Patient patientInstance) {
        respond patientInstance
    }

    @Secured(['ROLE_PATIENT_WRITE'])
    def create() {
        respond new Patient(params)
    }

    @Transactional
    @Secured(['ROLE_PATIENT_WRITE'])
    def save(Patient patientInstance) {
        if (patientInstance == null) {
            notFound()
            return
        }

        if (patientInstance.hasErrors()) {
            respond patientInstance.errors, view: 'create'
            return
        }

        patientInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'patient.label', default: 'Patient'), patientInstance.id])
                redirect patientInstance
            }
            '*' { respond patientInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_PATIENT_WRITE'])
    def edit(Patient patientInstance) {
        respond patientInstance
    }

    @Transactional
    @Secured(['ROLE_PATIENT_WRITE'])
    def update(Patient patientInstance) {
        if (patientInstance == null) {
            notFound()
            return
        }

        if (patientInstance.hasErrors()) {
            respond patientInstance.errors, view: 'edit'
            return
        }

        patientInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Patient.label', default: 'Patient'), patientInstance.id])
                redirect patientInstance
            }
            '*' { respond patientInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_PATIENT_WRITE'])
    def delete(Patient patientInstance) {

        if (patientInstance == null) {
            notFound()
            return
        }

        patientInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Patient.label', default: 'Patient'), patientInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'patient.label', default: 'Patient'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def search(PatientSearch patientSearch){
        List<Patient> patients = Patient.search(patientSearch)
        respond patients, model: [patientInstanceCount: patients.size()], view : "index"
    }
}
