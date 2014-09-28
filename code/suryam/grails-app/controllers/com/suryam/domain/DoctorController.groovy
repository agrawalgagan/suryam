package com.suryam.domain

import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_DOCTOR_READ'])
class DoctorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Doctor.list(params), model:[doctorInstanceCount: Doctor.count()]
    }

    def show(Doctor doctorInstance) {
        respond doctorInstance
    }

    @Secured(['ROLE_DOCTOR_WRITE'])
    def create() {
        respond new Doctor(params)
    }

    @Transactional
    @Secured(['ROLE_DOCTOR_WRITE'])
    def save(Doctor doctorInstance) {
        if (doctorInstance == null) {
            notFound()
            return
        }

        if (doctorInstance.hasErrors()) {
            respond doctorInstance.errors, view:'create'
            return
        }

        doctorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'doctor.label', default: 'Doctor'), doctorInstance.id])
                redirect doctorInstance
            }
            '*' { respond doctorInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_DOCTOR_WRITE'])
    def edit(Doctor doctorInstance) {
        respond doctorInstance
    }

    @Transactional
    @Secured(['ROLE_DOCTOR_WRITE'])
    def update(Doctor doctorInstance) {
        if (doctorInstance == null) {
            notFound()
            return
        }

        if (doctorInstance.hasErrors()) {
            respond doctorInstance.errors, view:'edit'
            return
        }

        doctorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Doctor.label', default: 'Doctor'), doctorInstance.id])
                redirect doctorInstance
            }
            '*'{ respond doctorInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_DOCTOR_WRITE'])
    def delete(Doctor doctorInstance) {

        if (doctorInstance == null) {
            notFound()
            return
        }

        doctorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Doctor.label', default: 'Doctor'), doctorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'doctor.label', default: 'Doctor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
