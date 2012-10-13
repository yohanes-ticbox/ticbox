package com.chicow.ticbox

class User {
	String username
	String password
	String email
	String typeUser
	
	
    static constraints = {
		username blank:false, unique:false
		password blank:false
		email 	 blank:false, unique:false
		
		typeUser inList: [ "Personal", "Company" ]
    }
}
