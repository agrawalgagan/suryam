package com.suryam.controller.admin

import com.suryam.domain.admin.RoleGroup
import com.suryam.domain.admin.UserRoleGroup
import grails.util.GrailsNameUtils

class UserController extends grails.plugin.springsecurity.ui.UserController {

    protected Map buildUserModel(user) {
        return [user: user, roleMap: [:]]
    }

    protected void addRoles(user) {
        def roleId = params.getLong("role")
        def roleGroup = RoleGroup.get(roleId)
        if(roleGroup){
            def userRoleGroup = user.userRoleGroup
            if(userRoleGroup){
                userRoleGroup.delete(flush:true)
            }
            UserRoleGroup.create(user, roleGroup,true)
        }
    }
}
