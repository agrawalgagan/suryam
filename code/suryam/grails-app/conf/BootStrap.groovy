import com.suryam.domain.Doctor
import com.suryam.domain.Gender
import com.suryam.domain.Patient
import com.suryam.domain.Study
import com.suryam.domain.StudyType
import com.suryam.domain.admin.Role
import com.suryam.domain.admin.RoleGroup
import com.suryam.domain.admin.RoleGroupRole
import com.suryam.domain.admin.User
import com.suryam.domain.admin.UserRole
import com.suryam.domain.admin.UserRoleGroup

class BootStrap {
    def grailsApplication
    def init = { servletContext ->
        TimeZone.setDefault(TimeZone.getTimeZone(grailsApplication.config.application.timezone))
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def testUser = new User(username: 'admin', password: 'password')
        testUser.save(flush: true)

        def adminGroup = new RoleGroup(name: 'ADMIN').save(flush: true)
        def helpdeskGroup = new RoleGroup(name: 'HELPDESK').save(flush: true)

        RoleGroupRole.create(adminGroup, adminRole, true)
        RoleGroupRole.create(adminGroup, userRole, true)

        RoleGroupRole.create(helpdeskGroup, userRole, true)

        for(String role in ['ROLE_DOCTOR_READ','ROLE_DOCTOR_WRITE','ROLE_PATIENT_READ','ROLE_PATIENT_WRITE']){
            RoleGroupRole.create(adminGroup,new Role(authority: role).save(flush : true),true)
        }

        UserRoleGroup.create(testUser,adminGroup,true)
        addDoctors()
        addPatients()
        addStudies()
    }

    private void addPatients() {
        Patient gagan = Patient.findByFirstName("Gagan")
        if (!gagan) {
            new Patient(firstName: "Gagan", lastName: "Agrawal", dob: new Date(), gender: Gender.MALE, email: "gagan@gmail.com", address: "Gurgaon", phone: "9999999999").save(flush: true)
            new Patient(firstName: "Swati", lastName: "Goel", dob: new Date(), gender: Gender.FEMALE, email: "swati@gmail.com", address: "Gurgaon", phone: "8888888888").save(flush: true)
            for(i in 0..30){
                new Patient(firstName: "Patient${i}", dob: new Date(), gender: Gender.MALE, email: "patient${i}@gmail.com", address: "Gurgaon", phone: "${i}${i}${i}${i}${i}", height: 5.9, weight: 70.8).save(flush: true)
            }
        }
    }

    private void addDoctors() {
        Doctor gaurav = Doctor.findByName("Gaurav Agrawal")
        if (!gaurav) {
            new Doctor(name: "Gaurav Agrawal", dob: new Date(), address: "Gujarat", phone: "9999999999").save(flush: true)
            for(i in 0..10){
                new Doctor(name: "Doctor${i}", dob: new Date(), phone: "${i}${i}${i}${i}${i}", address: "Gujarat").save(flush: true)
            }
        }
    }

    private void addStudies(){

        Study mri = Study.findByNameAndParent("MRI",null) ?: new Study(name:"MRI",type: StudyType.CATEGORY).save(flush: true)
        Study ct = Study.findByNameAndParent("CT",null) ?: new Study(name:"CT", type: StudyType.CATEGORY).save(flush: true)

        new Study(name:"BRAIN", type: StudyType.PART, parent: mri, cost: 100.0f).save(flush: true)
		new Study(name:"CERVICAL SPINE", type: StudyType.PART, parent: mri, cost: 100.0f).save(flush: true)
        new Study(name:"LUMBAR SPINE", type: StudyType.PART, parent: mri, cost: 101.0f).save(flush: true)
        new Study(name:"PELVIS", type: StudyType.PART, parent: mri, cost: 102.0f).save(flush: true)
        new Study(name:"SCREENING WHOLE SPINE", type: StudyType.PART, parent: mri, cost: 103.0f).save(flush: true)
		new Study(name:"SPECTROSCOPY", type: StudyType.PART, parent: mri, cost: 103.0f).save(flush: true)
		new Study(name:"MRCP", type: StudyType.PART, parent: mri, cost: 103.0f).save(flush: true)
		
		new Study(name:"BRAIN", type: StudyType.PART, parent: ct, cost: 103.0f).save(flush: true)
		new Study(name:"NECK", type: StudyType.PART, parent: ct, cost: 103.0f).save(flush: true)
		new Study(name:"THORAX", type: StudyType.PART, parent: ct, cost: 103.0f).save(flush: true)
		new Study(name:"ABDOMEN", type: StudyType.PART, parent: ct, cost: 103.0f).save(flush: true)
		new Study(name:"PELVIS", type: StudyType.PART, parent: ct, cost: 103.0f).save(flush: true)
		new Study(name:"JOINTS", type: StudyType.PART, parent: ct, cost: 103.0f).save(flush: true)

    }

    def destroy = {
    }
}
