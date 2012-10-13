package com.chicow.ticbox

class Respondent {
	String username
	String password
	String email
	String gender
	
	String country = "Indonesia"
	String province
	String city
	Date   dob
	
	String occupation
	String sallary
	String martialStatus
	String child
	
    static constraints = {
		username 	blank:false, unique:false
		password 	blank:false
		email 	 	blank:false, unique:false
		gender 	 	inList: [ "Male", "Female" ]
		
		province 	inList: [ "DKI Jakarta", "Jawa Barat", "Jawa Tengah", "Jawa Timur" ]
		city		blank:true
		dob			nullable:true
		
		occupation	blank:true
		sallary		blank:true
		martialStatus inlist: ["Single", "Married" ]
		child	 	blank:true
    }
}
