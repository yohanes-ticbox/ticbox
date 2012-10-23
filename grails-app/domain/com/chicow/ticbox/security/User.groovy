package com.chicow.ticbox.security

import com.chicow.ticbox.data.*

class User {

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	String email
	
	Respondent respondent
	Surveyor surveyor

	static constraints = {
		username blank: false, unique: true
		password blank: false
		email 	 blank: false
		respondent nullable:true
		surveyor nullable:true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
