import com.suryam.domain.Gender
import com.suryam.domain.Patient
import com.suryam.domain.admin.Role
import com.suryam.domain.admin.RoleGroup
import com.suryam.domain.admin.RoleGroupRole
import com.suryam.domain.admin.User
import com.suryam.domain.admin.UserRole
import com.suryam.domain.admin.UserRoleGroup

class BootStrap {

    def init = { servletContext ->
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

        addPatients()
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

    def destroy = {
    }
}
