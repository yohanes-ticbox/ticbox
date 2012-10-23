package com.chicow.ticbox.data

class Respondent {
	String country
	String province
	String city
	String gender
	Date dob
	BigDecimal salary
	String education
	String occupation
	String martialStatus
	Integer childs
	
    static constraints = {
		country 		blank: false
		province 		blank: false
		city			blank: false
		gender			blank: false
		dob				blank: false
		salary			blank: false
		education		blank: false
		occupation 		blank: false
		martialStatus	blank: false		
		
    }
}
