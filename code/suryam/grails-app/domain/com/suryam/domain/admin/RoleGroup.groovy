package com.suryam.domain.admin

class RoleGroup {

	String name

	static mapping = {
		cache true
	}

	Set<Role> getAuthorities() {
		RoleGroupRole.findAllByRoleGroup(this).collect { it.role }
	}

	static constraints = {
		name blank: false, unique: true
	}
}
